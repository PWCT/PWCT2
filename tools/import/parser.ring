/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Parser
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class Parser

	aTokens 	= []
	nActiveToken 	= 0
	nTokensCount	= 0

	aActiveToken	= []	
	nTokenType 	= 0
	cTokenValue	= ""
	nTokenIndex 	= 0

	aParseTree	= []
	cBuffer		= ""

	func setTokens aList
		aTokens 	= aList 
		nActiveToken 	= 0
		nTokensCount	= len(aTokens)

	func LoadToken
		aActiveToken	= aTokens[nActiveToken]
		nTokenType 	= aActiveToken[C_TOKENTYPE]
		cTokenValue 	= aActiveToken[C_TOKENVALUE]
		nTokenIndex 	= aActiveToken[C_TOKENINDEX]

	func NextToken
		if nActiveToken < nTokensCount {
			nActiveToken++
			LoadToken()
			return True
		}
		return False

	func isKeyword cKeyword
		return nTokenType = C_KEYWORD and 
		   Number(cTokenValue) = cKeyword 
		
	func isOperator cOperator
		return nTokenType = C_OPERATOR and 
		   cTokenValue = cOperator

	func isLiteral return nTokenType = C_LITERAL

	func isNumber return nTokenType = C_NUMBER

	func isIdentifier return nTokenType = C_IDENTIFIER

	func isEndLine return nTokenType = C_ENDLINE

	func isAnyKeyword return nTokenType = C_KEYWORD

	func isOperator2 nIndex
		return nTokenType = C_OPERATOR and 
		   cTokenIndex = nIndex 

	func Generate aCommand 
		aParseTree + aCommand 

	func GetParseTree 
		return aParseTree

	func Start 
		do
			Statement()	
		again NextToken()

	func Statement 
		StmtSeeExpr()

	func StmtSeeExpr
		if isKeyWord(K_SEE) {
			NextToken()
			Expr()
			Generate( [
				:Command = :See,
				:Expression = cBuffer
			] )
		}

	func Expr
		cBuffer = ""
		Literal()

	func Literal
		if isLiteral() {
			cBuffer += cTokenValue
			NextToken()
			return True
		}
		return False

	func PrintParseTree
		? "Parse Tree..."
		? List2Code(aParseTree)

	func IGNORENEWLINE
		while epslion() end

	func Error cMsg 
		raise(cMsg)

	func epslion
		if isendline() {
			if nexttoken() {
				return 1 
			}
			if TokensCount = 1 {
				return 1 
			}
		}
		return 0 

	func ring_parser_expr  
		/* Expr --> LogicNot { and|or LogicNot } */
		if logicnot() {
			x = 1 
			while iskeyword(K_AND) 	or isoperator("&&")  	or 
			      iskeyword(K_OR) 	or isoperator("||")  	{
				if iskeyword(K_AND) or isoperator("&&") {
					nexttoken()
					IGNORENEWLINE() 
					x = logicnot()
					if x = 0 {
						return 0 
					}
				else
					nexttoken()
					IGNORENEWLINE() 
					x = logicnot()
					if x = 0 {
						return 0 
					}
				}
			}
			return x 
		}
		return 0 
	
	func logicnot
		/* LogicNot --> Not EqualOrNot */
		if iskeyword(K_NOT) or isoperator2(OP_NOT) {
			nexttoken()
			IGNORENEWLINE()
		}
		x = equalornot()
		return x 

	func equalornot
		/* EqualOrNot --> Compare { =|!= Compare } */
		if compare() {
			x = 1 
			while isoperator2(OP_EQUAL) or isoperator2(OP_NOT)  {
				if isoperator2(OP_NOT) {
					nexttoken()
					IGNORENEWLINE() 
					if isoperator2(OP_EQUAL) {
						nexttoken()
						IGNORENEWLINE()
						x = compare()
						if x = 0 {
							return 0 
						}
					else
						error(RING_PARSER_ERROR_EXPROPERATOR)
						return 0 
					}
				else 
					nexttoken()
					IGNORENEWLINE()
					x = compare()
					if x = 0 {
						return 0 
					}
				}
			}
			return x 
		}
		return 0 

	func compare
		/* Compare --> BitORXOR { <|>|<=|>= BITORXOR } */
		if bitorxor() {
			x = 1 
			while isoperator2(OP_LESS) or isoperator2(OP_GREATER) {
				nEqual = 0 
				if isoperator2(OP_LESS) {
					nexttoken()
					IGNORENEWLINE()
					if isoperator2(OP_EQUAL) {
						nEqual = 1 
						nexttoken()
					}
					x = bitorxor()
					if x = 0 {
						return 0 
					}
					if nEqual = 0 {
						/* Generate Code */
					else
						/* Generate Code */
					}
				else 
					nexttoken()
					IGNORENEWLINE() 
					if isoperator2(OP_EQUAL) {
						nEqual = 1 
						nexttoken()
						IGNORENEWLINE() 
					}
					x = bitorxor()
					if x = 0 {
						return 0 
					}
					if nEqual = 0 {
						/* Generate Code */
					else 
						/* Generate Code */
					}
				}
				/* Check <> */
				if x = 0 {
					return 0 
				}
			}
			return x 
		}
		return 0 

	func bitorxor
		/* BitOrXOR --> BitAnd { | | ^ BitAnd } */
		if bitand() {
			x = 1 
			while isoperator2(OP_BITOR) or isoperator2(OP_XOR) {
				if isoperator2(OP_BITOR) {
					nexttoken()
					IGNORENEWLINE()
					x = bitand()
					if x = 0 {
						return 0 
					}
					/* Generate Code */
				else
					nexttoken()
					IGNORENEWLINE() 
					x = bitand()
					if x = 0 {
						return 0
					}
					/* Generate Code */
				}
			}
			return x
		}
		return 0

	func bitand
		/* BitAnd --> BitShift { & BitShift } */
		if bitshift() {
			x = 1 
			while isoperator2(OP_BITAND) {
				nexttoken()
				IGNORENEWLINE()
				x = bitshift()
				if x = 0 {
					return 0 
				}
				/* Generate Code */
			}
			return x
		}
		return 0

	func bitshift
		/* BitShift --> Arith { << | >>  Arith } */
		if arithmetic() {
			x = 1 
			while isoperator("<<") or isoperator(">>") {
				if isoperator("<<") {
					nexttoken()
					IGNORENEWLINE()
					x = arithmetic()
					if x = 0 {
						return 0
					}
					/* Generate Code */
				else
					nexttoken()
					IGNORENEWLINE()
					x = arithmetic()
					if x = 0 {
						return 0
					}
					/* Generate Code */
				}
			}
			return x
		}
		return 0

	func arithmetic
		/* Arithmetic --> Term { +|- Term } */
		if term() {
			x = 1 
			while isoperator2(OP_PLUS) or isoperator2(OP_MINUS) {
				if isoperator2(OP_PLUS) {
					nexttoken()
					IGNORENEWLINE()
					x = term()
					if x = 0 {
						return 0 
					}
					/* Generate Code */
				else
					nexttoken()
					IGNORENEWLINE()
					x = term()
					if x = 0 {
						return 0 
					}
					/* Generate Code */
				}
			}
			return x 
		}
		return 0 
