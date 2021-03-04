/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Parser
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ParserExpr

	func expr  
		/* Expr --> LogicNot { and|or LogicNot } */
		if logicnot() {
			x = 1 
			while iskeyword(K_AND) 	or isoperator("&&")  	or 
			      iskeyword(K_OR) 	or isoperator("||")  	{
				if iskeyword(K_AND) or isoperator("&&") {
					if iskeyword(K_AND) {
						manualAddToSecondTextBuffer(" AND ")
					}
					nexttoken()
					IGNORENEWLINE() 
					x = logicnot()
					if x = 0 {
						return False 
					}
				else
					if iskeyword(K_OR) {
						manualAddToSecondTextBuffer(" OR ")
					}
					nexttoken()
					IGNORENEWLINE() 
					x = logicnot()
					if x = 0 {
						return False 
					}
				}
			}
			return x 
		}
		return False 
	
	func logicnot
		/* LogicNot --> Not EqualOrNot */
		if iskeyword(K_NOT) or isoperator2(OP_NOT) {
			if iskeyword(K_NOT) {
				manualAddToSecondTextBuffer(" NOT ")
			}
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
							return False 
						}
					else
						error(ERROR_EXPROPERATOR)
						return False 
					}
				else 
					nexttoken()
					IGNORENEWLINE()
					x = compare()
					if x = 0 {
						return False 
					}
				}
			}
			return x 
		}
		return False 

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
						return False 
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
						return False 
					}
					if nEqual = 0 {
						/* Generate Code */
					else 
						/* Generate Code */
					}
				}
				/* Check <> */
				if x = 0 {
					return False 
				}
			}
			return x 
		}
		return False 

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
						return False 
					}
					/* Generate Code */
				else
					nexttoken()
					IGNORENEWLINE() 
					x = bitand()
					if x = 0 {
						return False
					}
					/* Generate Code */
				}
			}
			return x
		}
		return False

	func bitand
		/* BitAnd --> BitShift { & BitShift } */
		if bitshift() {
			x = 1 
			while isoperator2(OP_BITAND) {
				nexttoken()
				IGNORENEWLINE()
				x = bitshift()
				if x = 0 {
					return False 
				}
				/* Generate Code */
			}
			return x
		}
		return False

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
						return False
					}
					/* Generate Code */
				else
					nexttoken()
					IGNORENEWLINE()
					x = arithmetic()
					if x = 0 {
						return False
					}
					/* Generate Code */
				}
			}
			return x
		}
		return False

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
						return False 
					}
					/* Generate Code */
				else
					nexttoken()
					IGNORENEWLINE()
					x = term()
					if x = 0 {
						return False 
					}
					/* Generate Code */
				}
			}
			return x 
		}
		return False 

	func term
		/* Term --> Range { *|/|% Range } */
		if range() {
			x = 1 
			while isoperator2(OP_MUL) or isoperator2(OP_DIV) or isoperator2(OP_REM) {
				if isoperator2(OP_MUL) {
					nexttoken()
					IGNORENEWLINE()
					x = range()
					if x = 0 {
						return False 
					}
					/* Generate Code */
				elseif isoperator2(OP_REM)
					nexttoken()
					IGNORENEWLINE() 
					x = range()
					if x = 0 {
						return False 
					}
					/* Generate Code */
				else
					nexttoken()
					IGNORENEWLINE() 
					x = range()
					if x = 0 {
						return False 
					}
					/* Generate Code */
				}
			}
			return x 
		}
		return False 

	func range
		/* Range --> Factor : Factor */
		if factor() {
			x = 1 
			if isoperator2(OP_RANGE) {
				nexttoken()
				IGNORENEWLINE()
				x = factor()
				if x = 0 {
					return False 
				}
				/* Generate Code */
			}
			return x
		}
		return False 
	
	func factor 
		/* Factor --> Identifier  {mixer} [ '=' Expr ] */
		if isidentifier() {
			/* Generate Code */
			nexttoken()
			nToken = CURRENTTOKEN() 
			PASSNEWLINE() 
			/* Back if we don't have { */
			if CURRENTTOKEN() > nToken {
				if ! isoperator2(OP_BRACEOPEN) {
					settoken(nToken)
				}
			}
			/* Array Index & Object Dot */
			x = mixer()
			if x = 0 {
				return False 
			}
			/*
			**  [ [ = Expr  ] 
			**  Save State before changes by Check Operator 
			*/
			/* Check Operator */
			lequal = 1 
			if isoperator2(OP_EQUAL) {
				nBeforeEqual = 0 
			elseif isoperator("+=")  
				nBeforeEqual = 1 
			elseif isoperator("-=") 
				nBeforeEqual = 2 
			elseif isoperator("*=") 
				nBeforeEqual = 3 
			elseif isoperator("/=")
				nBeforeEqual = 4 
			elseif isoperator("%=") 
				nBeforeEqual = 5 
			elseif isoperator("&=")
				nBeforeEqual = 6 
			elseif isoperator("|=") 
				nBeforeEqual = 7 
			elseif isoperator("^=") 
				nBeforeEqual = 8 
			elseif isoperator("<<=")
				nBeforeEqual = 9 
			elseif isoperator(">>=") 
				nBeforeEqual = 10 
			else 
				lequal = 0 
				nBeforeEqual = 0 
			}
			if lequal = 1  and nAssignmentFlag = 1 {
				if nBeforeEqual = 0 {   # Operator: = 
					AddParameterFromSecondBuffer(:LeftSide)
					clearTextBuffer() 
					nexttoken()
					IGNORENEWLINE()
					nNewObject = 0 
					x = expr()
					cRS = AddParameterFromSecondBuffer(:RightSide)
					if cRS != "" {
						# Remove '=' operator  in the start 
							if left(cRS,1) = "=" { 
								cRS = trim(substr(cRS,2))
								aInstructionParameters[:RightSide] = cRS
							elseif left(cRS,3) = " = " 
								cRS = trim(substr(cRS,4))
								aInstructionParameters[:RightSide] = cRS
							}
						if trim(aInstructionParameters[:LeftSide]) != NULL {
								if left(trim(aInstructionParameters[:RightSide]),3) = "new" {
									aInstructionParameters[:Expression] = " = " + cRS
									oTarget.GenerateExpressionCommand(self)
								else 
									oTarget.GenerateAssignment(self)						
								}
						else 
							aInstructionParameters[:Expression] = cRS
							oTarget.GenerateExpressionCommand(self)
						}
						clearTextBuffer() 
						return x
					}
					return x
				}
				nexttoken()
				/* Generate Code */
				IGNORENEWLINE() 
				nNewObject = 0 
				x = expr()
				return x 
			}
			/* ++ & -- */
			if ppmm() {
				return True 
			}
			/* Generate Code */
			return True
		}
		/* Factor - Number */
		if isnumber() {
			/* Generate Code */
			nexttoken()
			/* If we have condition - pass new lines */
			if nControlStructureExpr {
				IGNORENEWLINE() 
			}
			/* ++ and -- */
			if ppmm() {
				return True 
			}
			/* Check using '(' after number */
			if isoperator2(OP_FOPEN) {
				error(ERROR_USINGBRACTAFTERNUM)
				return False 
			}
			return True 
		}
		/* Factor --> Literal */
		if isliteral() {
			/* Generate Code */
			nexttoken()
			/* If we have condition - pass new lines */
			if nControlStructureExpr {
				IGNORENEWLINE() 
			}
			/* Array Index & Object Dot */
			x = mixer()
			if x = 0 {
				return False 
			}
			return True 
		}
		/* Factor --> Literal --> ':' Identifier */
		if isoperator2(OP_RANGE) {
			nexttoken()
			if isidentifier() or isanykeyword() {
				/* Generate Code */
					if isAnyKeyword() {
						cBuffer += lower(aKeywords[0+aActiveToken[C_TOKENVALUE]])
						cBuffer2 += lower(aKeywords[0+aActiveToken[C_TOKENVALUE]])
					}
				nexttoken()
				/* Hash --> '=' Expression */
				if isoperator2(OP_EQUAL) {
					nexttoken()
					/* Generate Code */
					if expr() {
						/* Generate Code */
						return True 
					}
					return False 
				}
				return True 
			}
		}
		/* Factor --> Negative (-) Factor */
		if isoperator2(OP_MINUS) {
			nexttoken()
			x = factor()
			/* Generate Code */
			return x 
		elseif isoperator2(OP_BITNOT)
			/* bitnot (~) Expr */
			nexttoken()
			x = expr()
			/* Generate Code */
			return x 
		/* Factor --> & */
		elseif isoperator2(OP_BITAND) 
			nexttoken()
			/* Generate Code */
			if expr() {
				return True 
			}
		}
		/* Factor --> ( Expr ) */
		if isoperator2(OP_FOPEN) {
			nexttoken()
			x = nAssignmentFlag 
			nAssignmentFlag = 0 
			if expr() {
				nAssignmentFlag = x 
				if ( isoperator2(OP_FCLOSE) ) {
					nexttoken()
					return True 
				else
					return False 
				}
			}
			return False 
		}
		/* Factor --> List */
		if isoperator2(OP_LOPEN) {
			x = list() 
			return x 
		}
		/* Factor --> New Identifier */
		if iskeyword(K_NEW) {
			manualAddToSecondTextBuffer(" new ")
			nexttoken()
			IGNORENEWLINE() 
			/* Generate Code */
			if namedotname() {
				/* Generate Code */
				IGNORENEWLINE() 
				if isoperator2(OP_BRACEOPEN) {
					GenerateStatementIsExpression()
					clearTextBuffer()
					x = mixer()
					nNewObject = 1 
					return x 
				elseif isoperator2(OP_FOPEN)
					/* Function Parameters */
					nFuncCallOnly = 1 
					mixer()
					nFuncCallOnly = 0 
					/* Generate Code (End Brace) */
					IGNORENEWLINE() 
					GenerateStatementIsExpression()
					clearTextBuffer()

					x = mixer()
					nNewObject = 1 
					return x 
				}
				nNewObject = 1 
				return True 
			}
		}
		/* Factor --> Anonymous Function */
		if iskeyword(K_FUNC) or iskeyword(K_DEF) {
			manualAddToSecondTextBuffer(" func ")
			nexttoken()
			/*
			**  Generate Code 
			**  Push Function Name, then jump after the function code 
			*/
			/* Get Function Parameters */
			if isidentifier() or isoperator2(OP_FOPEN) {
				if ! paralist() { return False }
			}
			/* Get Function Code */
			if isoperator2(OP_BRACEOPEN) {
				GenerateStatementIsExpression()
				nexttoken()
				clearTextBuffer()
				oTarget.GenerateUsingBraces(self)
				oTarget.GenerateBlockStart(self)

				x = nAssignmentFlag 
				x2 = nNewObject 
				x3 = nBraceFlag 
				nAssignmentFlag = 1 
				nBraceFlag = 0 
				while stmt() {
					if nActiveToken = nTokensCount {
						exit 
					}
				}

				oTarget.GenerateBlockEnd(self)

				nAssignmentFlag = x 
				nNewObject = x2 
				nBraceFlag = x3 
				if isoperator2(OP_BRACECLOSE) {
					nexttoken()
					clearTextBuffer()
					/* Generate Code */
					return True 
				}
			}
		}
		/* Factor --> Call Identifier ( parameters ) */
		if iskeyword(K_CALL) {
			manualAddToSecondTextBuffer("call ")
			nexttoken()
			if isidentifier() {
				/* Generate Code */
				/* Generate Location for nPC of Getter */
				nexttoken()
				/* Object Attributes */
				if objattributes() = 0 {
					return False 
				}
				if isoperator2(OP_FOPEN) {
					return mixer() 
				else
					return False 
				}
			else
				return False 
			}
		}
		return False 

	func mixer 
		/*
		**  { . Identifier } 
		**  Object Attributes 
		*/
		if objattributes() = 0 {
			return False 
		}
		/* [Index]  to access array element, Index = Expression */
		if isoperator2(OP_LOPEN) {
			nexttoken()
			IGNORENEWLINE() 
			if expr() {
				/* Generate Code */
				if isoperator2(OP_LCLOSE) {
					nexttoken()
					x = mixer()
					if x = 0 {
						return False 
					}
				else
					error(ERROR_MISSBRACKETS)
					return False 
				}
			else 
				return False 
			}
		}
		/* |  [ ( [ Expr { , Expr } ] ) ]  ] */
		if isoperator2(OP_FOPEN) {
			/* Generate Code */
			nexttoken()
			IGNORENEWLINE() 
			if isoperator2(OP_FCLOSE) {
				nexttoken()
				/* Generate Code */
				IGNORENEWLINE() 
				x = mixer()
				return x
			}
			while True {
				nFlag = nAssignmentFlag 
				nNew = nNewObject 
				nAssignmentFlag = 0 
				if expr() {
					nAssignmentFlag = nFlag 
					nNewObject = nNew 
					IGNORENEWLINE() 
					if isoperator2(OP_COMMA) {
						nexttoken()
					elseif isoperator2(OP_FCLOSE)  
						nexttoken()
						/* Generate Code */
						x = mixer()
						return x 
					else 
						error(ERROR_MISSPARENTHESES)
						return False 
					}
				else
					return False 
				}
				IGNORENEWLINE() 
			}
		}
		/* Function Call Only */
		if nFuncCallOnly = 1 {
			return True 
		}
		/* '{' {Statement} '}' */
		if isoperator2(OP_BRACEOPEN) and nControlStructureExpr = 0 {
			nBraceFlag++ 
			/* Generate Code */
			RemoveCurrentTokenFromBuffer()			
			GenerateStatementIsExpression()
			nexttoken()
			oTarget.GenerateUsingBraces(self)
			oTarget.GenerateBlockStart(self)
			nStatus = nAssignmentFlag 
			nAssignmentFlag = 1 
			while stmt() {
				if nActiveToken = nTokensCount {
					exit
				}
			}
			oTarget.GenerateBlockEnd(self)
			nAssignmentFlag = nStatus 
			if isoperator2(OP_BRACECLOSE) {
				nBraceFlag-- 
				/*
				**  Generate Code 
				**  if ismethod(self,"braceend") braceend() ok 
				*/
				nexttoken()
				clearTextBuffer()
				x = mixer()
				return x 
			else
				error(ERROR_BRACESNOTCLOSED)
			}
		}
		/* This function return True because the mixer is optional and comes after identifier */
		return True 
	
	func ppmm 
		/* ++ & -- */
		if isoperator("++") {
			nexttoken()
			/* Generate Code */
			return True 
		elseif isoperator("--")
			nexttoken()
			/* Generate Code */
			return True 
		}
		return False 

	func objattributes
		/* { . Identifier } */
		while isoperator2(OP_DOT) {
			nexttoken()
			IGNORENEWLINE() 
			/* we support literal to be able to call methods contains operators in the name */
			if isidentifier() or isliteral() {
				/* Prevent Accessing the self reference from outside the object */
				if cTokenValue = "self" {
					error(ERROR_ACCESSSELFREF)
					return False 
				}
				/* Generate Code */
				nexttoken()
			else
				return False 
			}
		}
		return True 

