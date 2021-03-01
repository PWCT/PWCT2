/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Parser
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ParserExtra
	
	func paralist
		nStart = 0 
		if isoperator2(OP_FOPEN) {
			nexttoken()
			nStart = 1 
		}
		/* ParaList --> Epslion */
		if isendline() or (nStart and isoperator2(OP_FCLOSE) ) {
			nexttoken()
			return 1 
		}
		/* ParaList --> [ Identifier { , Identifier }  ] */
		if isidentifier() {
			cToken = cTokenValue
			nexttoken()
			/* Support Type Identifiter */
			if nStart and isidentifier() {
				cToken = cTokenValue
				nexttoken()
			}
			/* Generate Code */
			while isoperator2(OP_COMMA) {
				nexttoken()
				IGNORENEWLINE()
				if isidentifier() {
					cToken = cTokenValue
					nexttoken()
					/* Support Type Identifiter */
					if ( nStart and isidentifier() ) {
						cToken = cTokenValue
						nexttoken()
					}
					/* Generate Code */
				else
					error(ERROR_PARALIST)
					return 0 
				}
			}
			if nStart and isoperator2(OP_FCLOSE) {
				nexttoken()
			}
			return 1 
		else
			error(ERROR_PARALIST)
			return 0 
		}

	func list 
		/* "["  [ Expr { , Expr } ] "]" */
		if isoperator2(OP_LOPEN) {
			/* Generate Code */
			nexttoken()
			IGNORENEWLINE()
			if isoperator2(OP_LCLOSE) {
				nexttoken()
				/* Generate Code */
				return 1 
			}
			while True {
				nAssignmentFlag = 0 
				if expr() {
					/* Generate Code */
					nAssignmentFlag = 1 
					IGNORENEWLINE()
					if isoperator2(OP_COMMA) {
						nexttoken()
					elseif isoperator2(OP_LCLOSE) 
						nexttoken()
						/* Generate Code */
						return 1 
					else
						error(ERROR_LISTITEM)
						return 0 
					}
				else
					error(ERROR_LISTITEM)
					return 0 
				}
				IGNORENEWLINE()
			}
		}
		return 0 
	
	func namedotname
		if isidentifier() {
			/* Get Token Text */
			nexttoken()
			while isoperator2(OP_DOT) {
				nexttoken()
				if isidentifier() {
					nexttoken()
				else
					error(ERROR_PACKAGENAME)
					return 0 
				}
			}
			/* Generate Code */
			return 1 
		else
			error(ERROR_PACKAGENAME)
			return 0 
		}


	func parsestep
		/* Step <expr> */
		if iskeyword(K_STEP) {
			nexttoken()
			nAssignmentFlag = 0 
			if csexpr() {
				nAssignmentFlag = 1 
				/* Generate Code */
			else
				return 0 
			}
		else
			/* Generate Code */
		}
		//RemoveCurrentTokenFromBuffer()
		//addParameter(:Step)

		addParameterFromSecondBuffer(:Step)

		//addParameter(:Step)
		return 1 
		
	func csexpr
		nControlStructureExpr = 1 
		nOutput = expr()
		nControlStructureExpr = 0 
		IGNORENEWLINE() 
		if isoperator2(OP_BRACEOPEN) {
			nexttoken()
			nControlStructureBrace++ 
		}
		RemoveOpenedBraceFromBuffer()
		return nOutput 

	func csbraceend
		if (nControlStructureBrace >= 1) and isoperator2(OP_BRACECLOSE) {
			nControlStructureBrace-- 
			return 1 
		}
		return 0 

	func bracesandend lClass, nKeyword 
		/*
		**  This function is used to support braces { } around packages/classes/functions 
		**  Also support using 'end' after packages/classes/functions 
		**  IF The Parameter : lClass = True we call ring_parser_class() instead of ring_parser_stmt() 
		**  When we support braces { } 
		**  But the support for 'end' always uses ring_parser_class() 
		**  Support using { } 
		*/
		IGNORENEWLINE() 
		if isoperator2(OP_BRACEOPEN) {
			nexttoken()
			cleartextBuffer()
			if lClass {
				while mainclass() {
					if nActiveToken = nTokensCount  {
						exit
					}
				}
			else
				while stmt() {
					if nActiveToken = nTokensCount {
						exit
					}
				}
			}
			if isoperator2(OP_BRACECLOSE) {
				nexttoken()
				cleartextBuffer()
				return 1 
			}
			return 0 
		}
		/* Support using End */
		while mainclass() {
			if nActiveToken = nTokensCount {
				exit
			}
		}
		if iskeyword(K_END) or iskeyword(nKeyword) {
			nexttoken()
		}
		return 1 
