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
	lBufferFlag	= True

	nLineNumber 	= 1 
	nAssignmentFlag = 1 
	nClassStart 	= 0 
	nBraceFlag 	= 0 
	nNewObject 	= 0 
	nFuncCallOnly 	= 0 
	nControlStructureExpr 	= 0 
	nControlStructureBrace 	= 0 

	oTarget = new Target 

	func setTokens aList
		aTokens 	= aList 
		nActiveToken 	= 0
		nTokensCount	= len(aTokens)

	func LoadToken
		aActiveToken	= aTokens[nActiveToken]
		nTokenType 	= aActiveToken[C_TOKENTYPE]
		cTokenValue 	= aActiveToken[C_TOKENVALUE]
		nTokenIndex 	= aActiveToken[C_TOKENINDEX]
		if lBufferFlag {
			AddToTextBuffer()
		}

	func ClearTextBuffer
		cBuffer = ""

	func ValueAsString cValue
		if substr(cValue,'"') = 0 {
			cChar = '"'
		elseif substr(cValue,"'") = 0 
			cChar = "'"
		else 
			cChar = "`"
		}
		return cChar + cValue + cChar

	func AddToTextBuffer 
		if Find([C_LITERAL,C_NUMBER,C_OPERATOR,C_IDENTIFIER],nTokenType) {
			if nTokenType = C_LITERAL {
				cTokenValue = ValueAsString(cTokenValue)
			}
	 		cBuffer += cTokenValue
		}

	func EnableBufferFlag
		lBufferFlag = True

	func DisableBufferFlag
		lBufferFlag = False

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
		   nTokenIndex = nIndex 
	
	func SetToken x 
		if x >= 1 and x <= nTokensCount {
			nActiveToken = x 
			loadtoken()
			return 1 
		}
		return 0 

	func IGNORENEWLINE
		DisableBufferFlag()
		while epslion() {}
		EnableBufferFlag()

	func PASSNEWLINE 
		while passepslion() {}

	func Error cMsg 
		raise(cMsg)

	func epslion
		if isendline() {
			if nexttoken() {
				return 1 
			}
			if nTokensCount = 1 {
				return 1 
			}
		}
		return 0 

	func CURRENTTOKEN 
		return nActiveToken

	func passepslion
		/* used after factor - identifier to allow {  } in new line */
		if isendline() {
			nLineNumber = cTokenValue
			if nexttoken() {
				return 1 
			}
		}
		return 0 

	func Generate aCommand 
		aParseTree + aCommand 

	func GetParseTree 
		return aParseTree

	func Start 
		do
			IGNORENEWLINE() 
			mainclass()	
		again NextToken()

	func PrintParseTree
		? "Parse Tree..."
		? List2Code(aParseTree)

	func expr  
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
						error(ERROR_EXPROPERATOR)
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
						return 0 
					}
					/* Generate Code */
				elseif isoperator2(OP_REM)
					nexttoken()
					IGNORENEWLINE() 
					x = range()
					if x = 0 {
						return 0 
					}
					/* Generate Code */
				else
					nexttoken()
					IGNORENEWLINE() 
					x = range()
					if x = 0 {
						return 0 
					}
					/* Generate Code */
				}
			}
			return x 
		}
		return 0 

	func range
		/* Range --> Factor : Factor */
		if factor() {
			x = 1 
			if isoperator2(OP_RANGE) {
				nexttoken()
				IGNORENEWLINE()
				x = factor()
				if x = 0 {
					return 0 
				}
				/* Generate Code */
			}
			return x
		}
		return 0 
	
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
				return 0 
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
				nexttoken()
				/* Generate Code */
				IGNORENEWLINE() 
				nNewObject = 0 
				x = expr()
				/* Check New Object and this.property or self.property to disable set property */
				if nNewObject and lSetProperty and nLocalThisOrSelfLoadA {
					lSetProperty = 0 
				}
				/* Generate Code */
				return x 
			}
			/* ++ & -- */
			if ppmm() {
				return 1 
			}
			/* Generate Code */
			return 1 
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
				return 1 
			}
			/* Check using '(' after number */
			if isoperator2(OP_FOPEN) {
				error(ERROR_USINGBRACTAFTERNUM)
				return 0 
			}
			return 1 
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
				return 0 
			}
			return 1 
		}
		/* Factor --> Literal --> ':' Identifier */
		if isoperator2(OP_RANGE) {
			nexttoken()
			if isidentifier() or isanykeyword() {
				/* Generate Code */
				nexttoken()
				/* Hash --> '=' Expression */
				if isoperator2(OP_EQUAL) {
					nexttoken()
					/* Generate Code */
					if expr() {
						/* Generate Code */
						return 1 
					}
					return 0 
				}
				return 1 
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
				return 1 
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
					return 1 
				else
					error(ERROR_MISSPARENTHESES)
					return 0 
				}
			}
			return 0 
		}
		/* Factor --> List */
		if isoperator2(OP_LOPEN) {
			x = list() 
			return x 
		}
		/* Factor --> New Identifier */
		if iskeyword(K_NEW) {
			nexttoken()
			IGNORENEWLINE() 
			/* Generate Code */
			if namedotname() {
				/* Generate Code */
				IGNORENEWLINE() 
				if isoperator2(OP_BRACEOPEN) {
					x = mixer()
					nNewObject = 1 
					return x 
				elseif isoperator2(OP_FOPEN)
					/*
					**  Calling the init method using { } 
					**  Generate Code (Start Brace) 
					*/
					/* Generate Code ( Call Function ) */
					/* Generate Location for nPC of Getter */
					/* Function Parameters */
					nFuncCallOnly = 1 
					mixer()
					nFuncCallOnly = 0 
					/* Generate Code (End Brace) */
					IGNORENEWLINE() 
					x = mixer()
					nNewObject = 1 
					return x 
				}
				nNewObject = 1 
				/*
				**  Generate Code 
				**  PUSHV enable using braces to access the object 
				*/
				return 1 
			}
		}
		/* Factor --> Anonymous Function */
		if iskeyword(K_FUNC) or iskeyword(K_DEF) {
			nexttoken()
			/*
			**  Generate Code 
			**  Push Function Name, then jump after the function code 
			*/
			/* Get Function Parameters */
			if isidentifier() or isoperator2(OP_FOPEN) {
				if ! paralist() { return 0 }
			}
			/* Get Function Code */
			if isoperator2(OP_BRACEOPEN) {
				nexttoken()
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
				nAssignmentFlag = x 
				nNewObject = x2 
				nBraceFlag = x3 
				if isoperator2(OP_BRACECLOSE) {
					nexttoken()
					/* Generate Code */
					return 1 
				}
			}
		}
		/* Factor --> Call Identifier ( parameters ) */
		if iskeyword(K_CALL) {
			nexttoken()
			if isidentifier() {
				/* Generate Code */
				/* Generate Location for nPC of Getter */
				nexttoken()
				/* Object Attributes */
				if objattributes() = 0 {
					return 0 
				}
				if isoperator2(OP_FOPEN) {
					return mixer() 
				else
					return 0 
				}
			else
				return 0 
			}
		}
		return 0 

	func mixer 
		/*
		**  { . Identifier } 
		**  Object Attributes 
		*/
		if objattributes() = 0 {
			return 0 
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
						return 0 
					}
				else
					error(ERROR_MISSBRACKETS)
					return 0 
				}
			else 
				return 0 
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
						return 0 
					}
				else
					return 0 
				}
				IGNORENEWLINE() 
			}
		}
		/* Function Call Only */
		if nFuncCallOnly = 1 {
			return 1 
		}
		/* '{' {Statement} '}' */
		if isoperator2(OP_BRACEOPEN) and nControlStructureExpr = 0 {
			nBraceFlag++ 
			/* Generate Code */
			nexttoken()
			nStatus = nAssignmentFlag 
			nAssignmentFlag = 1 
			while stmt() {
				if nActiveToken = nTokensCount {
					exit
				}
			}
			nAssignmentFlag = nStatus 
			if isoperator2(OP_BRACECLOSE) {
				nBraceFlag-- 
				/*
				**  Generate Code 
				**  if ismethod(self,"braceend") braceend() ok 
				*/
				nexttoken()
				x = mixer()
				return x 
			else
				error(ERROR_BRACESNOTCLOSED)
			}
		}
		/* This function return 1 because the mixer is optional and comes after identifier */
		return 1 
	
	func ppmm 
		/* ++ & -- */
		if isoperator("++") {
			nexttoken()
			/* Generate Code */
			return 1 
		elseif isoperator("--")
			nexttoken()
			/* Generate Code */
			return 1 
		}
		return 0 

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
					return 0 
				}
				/* Generate Code */
				nexttoken()
			else
				return 0 
			}
		}
		return 1 

	func mainclass
		/* Statement --> Class Identifier  [ From Identifier ] */
		if iskeyword(K_CLASS) {
			nexttoken()
			IGNORENEWLINE() 
			if isidentifier() {
				nexttoken()
				/* [From Identifer] */
				if iskeyword(K_FROM) or isoperator2(OP_RANGE) or isoperator2(OP_LESS) {
					nexttoken()
					if namedotname() {
						/* Generate Code */
					else
						error(ERROR_PRENTCLASSNAME)
						return 0 
					}
				else
					/* Set Parent Class Name In Classes Map */
				}
				nClassStart = 1 
				return bracesandend(1,K_ENDCLASS) 
			else
				error(ERROR_CLASSNAME)
				return 0 
			}
		}
		/* Statement --> Func|Def Identifier [PARALIST] */
		if iskeyword(K_FUNC) or iskeyword(K_DEF) {
			nexttoken()
			IGNORENEWLINE() 
			if isidentifier() {
				nexttoken()
				if isidentifier() or isoperator2(OP_FOPEN) {
					x = paralist()
				else
					x = 1 
				}
				if x {
					/* Support using { } around the function code and using 'end' after the content */
					x = bracesandend(0,K_ENDFUNC) 
				}
				oTarget.GenerateBlockEnd(self)
				oTarget.GenerateFuncPara(self)
				oTarget.GenerateBlockStart(self)
				return x 
			else
				error(ERROR_FUNCNAME)
				return 0 
			}
		}
		/* Statement --> Package Identifier { '.' Identifier } */
		if iskeyword(K_PACKAGE) {
			nexttoken()
			IGNORENEWLINE() 
			/* Generate Code */
			if namedotname() {
				/* Support using { } around the package code and using 'end' after the content */
				return bracesandend(1,K_ENDPACKAGE) 
			else
				return 0 
			}
		}
		/* Statement --> Private */
		if iskeyword(K_PRIVATE) {
			nexttoken()
			if nClassStart = 1 {
				return 1 
			else
				error(ERROR_NOCLASSDEFINED)
				return 0 
			}
		}
		return stmt() 
	
	func stmt
		x = True
		/* Statement --> Load Literal */
		if iskeyword(K_LOAD) {
			nexttoken()
			/* Load Package Command */
			if iskeyword(K_PACKAGE) {
				nexttoken()
			elseif iskeyword(K_AGAIN) 
				nexttoken()
			}
			if isliteral() {
				nexttoken()
				oTarget.GenerateLoadLiteral(self)
				return x 
			}
			return 0 
		}
		/* Statement --> See|Put Expr */
		if iskeyword(K_SEE) or iskeyword(K_PUT) {
			nexttoken()
			IGNORENEWLINE() 
			nAssignmentFlag = 0 				
			x = expr()
			nAssignmentFlag = 1 
			oTarget.GenerateSeeExpr(self)
			return x 
		}
		/* Statement --> ? Expr */
		if isoperator("?") {
			clearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			nAssignmentFlag = 0 
			x = expr()
			nAssignmentFlag = 1 
			oTarget.GenerateQuestionMarkExpr(self)
			return x 
		}
		/* Statement --> Give|Get Identifier */
		if iskeyword(K_GIVE) or iskeyword(K_GET) {
			nexttoken()
			IGNORENEWLINE() 
			if isidentifier() {
				/* Generate Code */
				nexttoken()
				x = mixer()
				if x = 0 {
					return 0 
				}
				/* Generate Code */
				return 1 
			else
				error(ERROR_VARNAME)
				return 0 
			}
		}
		/* Statement --> For Identifier = Expr to Expr {Statement} Next  |  For Identifier in Expr {Statemen */
		if iskeyword(K_FOR) {
			nexttoken()
			IGNORENEWLINE() 
			if isidentifier() {
				nexttoken()
				if isoperator2(OP_EQUAL) {
					/*
					**  Generate Code 
					**  Mark for Exit command to go to outside the loop 
					*/
					nAssignmentFlag = 0 
					if expr() {
						/*
						**  Generate Code 
						**  Before Equal ( = ) not += , -= ,... etc 
						*/
						if iskeyword(K_TO) {
							nexttoken()
							IGNORENEWLINE() 
							nAssignmentFlag = 0 
							if csexpr() {
								nAssignmentFlag = 1 
								/* Generate Code */
								/* Step <expr> */
								x = parsestep()
								if x = 0 {
									return 0 
								}
								while stmt() {
									if nActiveToken = nTokensCount {
										exit
									}
								}
								if iskeyword(K_NEXT) or iskeyword(K_END) or csbraceend() {
									/* Generate Code */
									nexttoken()
									return 1 
								else
									error(ERROR_NEXT)
								}
							}
						}
					}
				elseif iskeyword(K_IN)
					/* Generate Code */
					nexttoken()
					IGNORENEWLINE() 
					nAssignmentFlag = 0 
					if csexpr() {
						nAssignmentFlag = 1 
						/* Generate Code */
						/* Step <expr> */
						x = parsestep()
						if x = 0 {
							return 0 
						}
						while stmt() {
							if nActiveToken = nTokensCount {
								exit
							}
						}
						if iskeyword(K_NEXT) or iskeyword(K_END) or csbraceend() {
							nexttoken()
							/* Generate Code */
							return 1 
						else
							error(ERROR_NEXT)
						}
					}
				}
			}
			return 0 
		}
		/* Statement --> IF Expr Statements OK */
		if iskeyword(K_IF) {
			ClearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			nAssignmentFlag = 0 
			if csexpr() {
				oTarget.GenerateIfExpr(self)
				oTarget.GenerateBlockStart(self)
				nAssignmentFlag = 1 
				while stmt() {
					if nActiveToken = nTokensCount {
						exit
					}
				}
				oTarget.GenerateBlockEnd(self)
				/* Generate Code */
				/* { 'But' Statements } 'Else' Statements */
				while iskeyword(K_BUT) or iskeyword(K_ELSEIF) {
					/* Generate Code */
					nexttoken()
					nAssignmentFlag = 0 
					if expr() {
						nAssignmentFlag = 1 
						/* Generate Code */
						while stmt() {
							if nActiveToken = nTokensCount {
								exit
							}
						}
						/* Generate Code */
					}
				}
				if iskeyword(K_ELSE) or iskeyword(K_OTHER) {
					/* Generate Code */
					nexttoken()
					while stmt() {
						if nActiveToken = nTokensCount {
							exit 
						}
					}
				}
				if iskeyword(K_OK) or iskeyword(K_END) or csbraceend() {
					/* Generate Code */
					nexttoken()
					return 1 
				else
					error(ERROR_OK)
				}
			}
			return 0 
		}
		/* Statement --> WHILE Expr Statements END */
		if iskeyword(K_WHILE) {
			/*
			**  Generate Code 
			**  Mark for Exit command to go to outsize the loop 
			*/
			nexttoken()
			IGNORENEWLINE() 
			nAssignmentFlag = 0 
			if csexpr() {
				nAssignmentFlag = 1 
				/* Generate Code */
				/* Save Loop|Exit commands status */
				while stmt() {
					if nActiveToken = TokensCount {
						exit
					}
				}
				if iskeyword(K_END) or csbraceend() {
					/* Generate Code */
					nexttoken()
					return 1 
				else
					error(ERROR_END)
				}
			}
			return 0 
		}
		/* Statement --> DO Statements AGAIN Expr */
		if iskeyword(K_DO) {
			/*
			**  Generate Code 
			**  Mark for Exit command to go to outsize the loop 
			*/
			nexttoken()
			/* Save Loop|Exit commands status */
			while stmt() {
				if nActiveToken = nTokensCount {
					exit
				}
			}
			if iskeyword(K_AGAIN) {
				/* Generate Code */
				nexttoken()
				IGNORENEWLINE() 
				nAssignmentFlag = 0 
				if expr() {
					/* Generate Code (Test Condition) */
					nAssignmentFlag = 1 
					return 1 
				}
			else
				error(ERROR_AGAIN)
			}
			return 0 
		}
		/* Statement --> Return Expr */
		if iskeyword(K_RETURN) {
			nexttoken()
			x = 1 
			if isendline() = 0 {
				/* Generate Code */
				nAssignmentFlag = 0 
				x = expr()
				nAssignmentFlag = 1 
				/* Generate Code */
			else 
				/*
				**  Generate Code 
				**  Return NULL 
				*/
			}
			return x 
		}
		/* Statement --> Try {Statement} Catch {Statement} Done */
		if iskeyword(K_TRY) {
			nexttoken()
			IGNORENEWLINE() 
			if isoperator2(OP_BRACEOPEN) {
				nexttoken()
				nControlStructureBrace++ 
			}
			/* Generate Code */
			while stmt() {
				if nActiveToken = nTokensCount {
					exit 
				}
			}
			if iskeyword(K_CATCH) {
				nexttoken()
				/*
				**  Generate Code 
				**  Jump from end of try block to label after done 
				*/
				while stmt() {
					if nActiveToken = nTokensCount {
						exit
					}
				}
				if iskeyword(K_DONE) or iskeyword(K_END) or csbraceend() {
					nexttoken()
					/* Generate Code */
					return 1 
				else
					error(ERROR_NODONE)
				}
			else
				error(ERROR_NOCATCH)
			}
		}
		/* Statement --> Bye (Close the Program) */
		if iskeyword(K_BYE) {
			nexttoken()
			/* Generate Code */
			return 1 
		}
		/* Statement --> Exit (Go to outside the loop) */
		if iskeyword(K_EXIT) {
			nexttoken()
			/* Check Number  (Exit from more than one loop) */
			if isnumber() or isidentifier() {
				if ! expr() {
					return 0 
				}
			}
			return 1 
		}
		/* Statement --> Loop (Continue) */
		if iskeyword(K_LOOP) {
			nexttoken()
			/* Check Number  (Continue from more than one loop) */
			if isnumber() or isidentifier() {
				if ! expr() {
					return 0 
				}
			}
			return 1 
		}
		/* Statement --> Switch  Expr { ON|CASE Expr {Statement} } OFF */
		if iskeyword(K_SWITCH) {
			nexttoken()
			IGNORENEWLINE() 
			nAssignmentFlag = 0 
			if csexpr() {
				nAssignmentFlag = 1 
				IGNORENEWLINE() 
				/* ON|CASE Statements */
				while iskeyword(K_ON) or iskeyword(K_CASE) {
					nexttoken()
					nAssignmentFlag = 0 
					if expr() {
						nAssignmentFlag = 1 
						/* Generate Code */
						while stmt() {
							if nActiveToken = nTokensCount {
								exit
							}
						}
						/* Generate Code */
					}
				}
				/* Other */
				if iskeyword(K_OTHER) or iskeyword(K_ELSE) {
					nexttoken()
					/* Generate Code */
					while stmt() {
						if nActiveToken = nTokensCount {
							exit
						}
					}
				}
				/* OFF */
				if iskeyword(K_OFF) or iskeyword(K_END) or csbraceend() {
					nexttoken()
					return 1 
				else
					error(ERROR_SWITCHOFF)
				}
			else
				error(ERROR_SWITCHEXPR)
			}
		}
		/* Statement --> Import Identifier { '.' Identifier } */
		if iskeyword(K_IMPORT) {
			nexttoken()
			IGNORENEWLINE() 
			/* Generate Code */
			return namedotname() 
		}
		/* Statement --> epslion */
		if epslion() {
			return 1 
		}
		/* Statement --> Expr */
		if expr() {
			/*
			**  Generate Code 
			**  Call expreval() if we are inside { } 
			*/
			if nBraceFlag {
				/* if ismethod(self,"braceexpreval") braceexpreval() ok */
			}
			return 1 
		}
		return 0 

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
