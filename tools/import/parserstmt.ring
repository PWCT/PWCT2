/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Parser
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ParserStmt
	
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
				AddParameter(:FileName)
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
			AddParameter(:Expression)
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
			AddParameter(:Expression)
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
				AddParameter(:Identifier)
				oTarget.GenerateGiveIdentifier(self)
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
				AddParameter(:Condition)
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
				AddParameter(:Expression)
			else 
				/*
				**  Generate Code 
				**  Return NULL 
				*/
			}
			oTarget.GenerateReturn(self)
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
