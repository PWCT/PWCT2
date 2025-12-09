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
			clearTextBuffer()
			nexttoken()
			nLoadType = 1
			/* Load Package Command */
			if iskeyword(K_PACKAGE) {
				nLoadType = 2
				nexttoken()
			elseif iskeyword(K_AGAIN) 
				nLoadType = 3
				nexttoken()
			}
			AddParameterAndValue(:Type,nLoadType)
			if isliteral() {
				nexttoken()
				AddParameter(:FileName)
				oTarget.GenerateLoadLiteral(self)
				clearTextBuffer()
				return x 
			}
			return False 
		}
		/* Statement --> See|Put Expr */
		if iskeyword(K_SEE) or iskeyword(K_PUT) {
			clearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			nAssignmentFlag = 0 				
			// x = GetExprAsString()
			x = Expr()
			nAssignmentFlag = 1 
			AddParameterFromSecondBuffer(:Expression) 
			oTarget.GenerateSeeExpr(self)
			clearTextBuffer()
			return x 
		}
		/* Statement --> ? Expr */
		if isoperator("?") {
			clearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			nAssignmentFlag = 0 
			// x = GetExprAsString()
			x = Expr()
			nAssignmentFlag = 1 
			AddParameterFromSecondBuffer(:Expression)
			oTarget.GenerateQuestionMarkExpr(self)
			clearTextBuffer()
			return x 
		}
		/* Statement --> Give|Get Identifier */
		if iskeyword(K_GIVE) or iskeyword(K_GET) {
			clearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			if isidentifier() {
				/* Generate Code */
				nexttoken()
				x = mixer()
				if x = 0 {
					return False 
				}
				/* Generate Code */
				AddParameter(:Identifier)
				oTarget.GenerateGiveIdentifier(self)
				clearTextBuffer()
				return True 
			else
				error(ERROR_VARNAME)
				return False 
			}
		}
		/* Statement --> For Identifier = Expr to Expr {Statement} Next  |  For Identifier in Expr {Statemen */
		if iskeyword(K_FOR) or isKeyword(K_FOREACH) {
			nForCounter++
			clearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			if isidentifier() {
				addParameter(:Variable)		# Used by For-In
				nexttoken()
				if isoperator2(OP_EQUAL) {
					nexttoken()
					/*
					**  Generate Code 
					**  Mark for Exit command to go to outside the loop 
					*/
					nAssignmentFlag = 0 
					if expr() {  
						addParameter(:Start)
					  clearTextBuffer()
						/*
						**  Generate Code 
						**  Before Equal ( = ) not += , -= ,... etc 
						*/
						if iskeyword(K_TO) {
							nexttoken()
							IGNORENEWLINE() 
							nAssignmentFlag = 0 
							if csexpr() {
								addParameterFromSecondBuffer(:To)
								clearTextBuffer()
								nAssignmentFlag = 1 
								/* Generate Code */
								/* Step <expr> */
								x = parsestep()
								if x = 0 {
									nForCounter--
									return False 
								}
								oTarget.GenerateForLoop(self)
								oTarget.GenerateBlockStart(self)
								while stmt() {
									if nActiveToken = nTokensCount {
										exit
									}
								}
								oTarget.GenerateBlockEnd(self)
								if iskeyword(K_NEXT) or iskeyword(K_END) or iskeyword(K_ENDFOR) or csbraceend() {
									/* Generate Code */
									nexttoken()
									clearTextBuffer()
									nForCounter--
									return True 
								else
									error(ERROR_NEXT)
								}
							}
						}
					}
				elseif iskeyword(K_IN)
					clearTextBuffer()
					/* Generate Code */
					nexttoken()
					//addParameter(:In)
					IGNORENEWLINE() 
					nAssignmentFlag = 0 
					if csexpr() {
						addParameterFromSecondBuffer(:In)
						clearTextBuffer()
						nAssignmentFlag = 1 
						/* Generate Code */
						/* Step <expr> */
						x = parsestep()
						if x = 0 {
							nForCounter--
							return False 
						}
						oTarget.GenerateForInLoop(self)
						oTarget.GenerateBlockStart(self)
						while stmt() {
							if nActiveToken = nTokensCount {
								exit
							}
						}
						oTarget.GenerateBlockEnd(self)
						if iskeyword(K_NEXT) or iskeyword(K_END) or iskeyword(K_ENDFOR) or csbraceend() {
							nexttoken()
							/* Generate Code */
							clearTextBuffer()
							nForCounter--
							return True 
						else
							error(ERROR_NEXT)
						}
					}
				}
			}
			nForCounter--
			return False 
		}
		/* Statement --> IF Expr Statements OK */
		if iskeyword(K_IF) {
			nIfCounter++
			ClearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			nAssignmentFlag = 0 
			if csexpr() {
				AddParameterFromSecondBuffer(:Condition)
				oTarget.GenerateIfExpr(self)
				oTarget.GenerateBlockStart(self)
				clearTextBuffer()
				nAssignmentFlag = 1 
				while stmt() {
					if nActiveToken = nTokensCount {
						exit
					}
				}
				/* Generate Code */
				/* { 'But' Statements } 'Else' Statements */
				while iskeyword(K_BUT) or iskeyword(K_ELSEIF) {
					ClearTextBuffer()
					/* Generate Code */
					nexttoken()
					nAssignmentFlag = 0 
					if expr() {
						AddParameterFromSecondBuffer(:Condition)
						oTarget.GenerateButExpr(self)
						oTarget.GenerateBlockStart(self)
						clearTextBuffer()
						nAssignmentFlag = 1 
						/* Generate Code */
						while stmt() {
							if nActiveToken = nTokensCount {
								exit
							}
						}
						oTarget.GenerateBlockEnd(self)
						/* Generate Code */
					}
				}
				if iskeyword(K_ELSE) or iskeyword(K_OTHER) {
					ClearTextBuffer()
					/* Generate Code */
					nexttoken()
					oTarget.GenerateElse(self)
					oTarget.GenerateBlockStart(self)
					while stmt() {
						if nActiveToken = nTokensCount {
							exit 
						}
					}
					oTarget.GenerateBlockEnd(self)
				}
				if iskeyword(K_OK) or iskeyword(K_END) or iskeyword(K_ENDIF) or csbraceend() {
					/* Generate Code */
					oTarget.GenerateBlockEnd(self)
					nexttoken()
					clearTextBuffer()
					nIfCounter--
					return True 
				else
					error(ERROR_OK)
				}
			}
			nIfCounter--
			return False 
		}
		/* Statement --> WHILE Expr Statements END */
		if iskeyword(K_WHILE) {
			/*
			**  Generate Code 
			**  Mark for Exit command to go to outsize the loop 
			*/
			clearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			nAssignmentFlag = 0 
			if csexpr() {
				AddParameterFromSecondBuffer(:Condition)
				oTarget.GenerateWhileExpr(self)
				oTarget.GenerateBlockStart(self)
				nAssignmentFlag = 1 
				/* Generate Code */
				/* Save Loop|Exit commands status */
				while stmt() {
					if nActiveToken = nTokensCount {
						exit
					}
				}
				oTarget.GenerateBlockEnd(self)
				if iskeyword(K_END) or iskeyword(K_ENDWHILE) or csbraceend() {
					/* Generate Code */
					nexttoken()
					clearTextBuffer()
					return True 
				else
					error(ERROR_END)
				}
			}
			return False 
		}
		/* Statement --> DO Statements AGAIN Expr */
		if iskeyword(K_DO) {
			nDoAgainCounter++
			clearTextBuffer()
			/*
			**  Generate Code 
			**  Mark for Exit command to go to outsize the loop 
			*/
			nexttoken()
			oTarget.GenerateDoAgainExpr(self)
			nDoAgainInstruction = CurrentInstruction()
			oTarget.GenerateBlockStart(self)
			/* Save Loop|Exit commands status */
			while stmt() {
				if nActiveToken = nTokensCount {
					exit
				}
			}
			oTarget.GenerateBlockEnd(self)
			if iskeyword(K_AGAIN) {
				clearTextBuffer()
				/* Generate Code */
				nexttoken()
				IGNORENEWLINE() 
				nAssignmentFlag = 0 
				if expr() {
					AddParameterToInstructionFromSecondBuffer(nDoAgainInstruction,:Expression)
					/* Generate Code (Test Condition) */
					nAssignmentFlag = 1 
					clearTextBuffer()
					nDoAgainCounter--
					return True 
				}
			else
				error(ERROR_AGAIN)
			}
			nDoAgainCounter--
			return False 
		}
		/* Statement --> Return Expr */
		if iskeyword(K_RETURN) {
			clearTextBuffer()
			nexttoken()
			x = 1 
			if isendline() = 0 and isComment() = 0 {
				nAssignmentFlag = 0
				x = GetExprAsString()
				nAssignmentFlag = 1 
			}
			oTarget.GenerateReturn(self)
			clearTextBuffer()
			return x 
		}
		/* Statement --> Try {Statement} Catch {Statement} Done */
		if iskeyword(K_TRY) {
			nTryCatchCounter++
			clearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			if isoperator2(OP_BRACEOPEN) {
				nexttoken()
				nControlStructureBrace++ 
			}
			/* Generate Code */
			oTarget.GenerateTry(self)
			oTarget.GenerateBlockStart(self)
			clearTextBuffer()
			while stmt() {
				if nActiveToken = nTokensCount {
					exit 
				}
			}
			oTarget.GenerateBlockEnd(self)
			if iskeyword(K_CATCH) {
				nexttoken()
				/*
				**  Generate Code 
				**  Jump from end of try block to label after done 
				*/
				oTarget.GenerateCatch(self)
				oTarget.GenerateBlockStart(self)
				while stmt() {
					if nActiveToken = nTokensCount {
						exit
					}
				}
				oTarget.GenerateBlockEnd(self)
				if iskeyword(K_DONE) or iskeyword(K_END) or iskeyword(K_ENDTRY) or csbraceend() {
					nexttoken()
					/* Generate Code */
					clearTextBuffer()
					nTryCatchCounter--
					return True 
				else
					error(ERROR_NODONE)
				}
			else
				error(ERROR_NOCATCH)
			}
			nTryCatchCounter--
			return False 
		}
		/* Statement --> Bye (Close the Program) */
		if iskeyword(K_BYE) {
			clearTextBuffer()
			nexttoken()
			/* Generate Code */
			oTarget.GenerateBye(self)
			clearTextBuffer()
			return True 
		}
		/* Statement --> Exit (Go to outside the loop) */
		if iskeyword(K_EXIT) || iskeyword(K_BREAK) {
			clearTextBuffer()
			nexttoken()
			/* Check Number  (Exit from more than one loop) */
			if isnumber() or isidentifier() {
				if ! expr() {
					return False 
				}
			}
			addParameterFromSecondBuffer(:Value)
			oTarget.GenerateExit(self)
			clearTextBuffer()
			return True 
		}
		/* Statement --> Loop (Continue) */
		if iskeyword(K_LOOP) || iskeyword(K_CONTINUE) {
			clearTextBuffer()
			nexttoken()
			/* Check Number  (Continue from more than one loop) */
			if isnumber() or isidentifier() {
				if ! expr() {
					return False 
				}
			}
			addParameterFromSecondBuffer(:Value)
			oTarget.GenerateLoop(self)
			clearTextBuffer()
			return True 
		}
		/* Statement --> Switch  Expr { ON|CASE Expr {Statement} } OFF */
		if iskeyword(K_SWITCH) {
			nSwitchCounter++
			clearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			nAssignmentFlag = 0 
			if csexpr() {
				addParameterFromSecondBuffer(:Variable)
				nAssignmentFlag = 1 
				IGNORENEWLINE() 
				/* ON|CASE Statements */
				oTarget.GenerateSwitch(self)
				oTarget.GenerateBlockStart(self)
				clearTextBuffer()
				while iskeyword(K_ON) or iskeyword(K_CASE) {
					clearTextBuffer()
					nexttoken()
					nAssignmentFlag = 0 
					if expr() {
						nAssignmentFlag = 1 
						/* Generate Code */
						addParameterFromSecondBuffer(:Value)
						oTarget.GenerateSwitchCase(self)
						oTarget.GenerateBlockStart(self)
						clearTextBuffer()
						while stmt() {
							if nActiveToken = nTokensCount {
								exit
							}
						}
						oTarget.GenerateBlockEnd(self)
						/* Generate Code */
					}
				}
				/* Other */
				if iskeyword(K_OTHER) or iskeyword(K_ELSE) {
					clearTextBuffer()
					nexttoken()
					oTarget.GenerateSwitchOther(self)
					oTarget.GenerateBlockStart(self)
					/* Generate Code */
					while stmt() {
						if nActiveToken = nTokensCount {
							exit
						}
					}
					oTarget.GenerateBlockEnd(self)
				}
				oTarget.GenerateBlockEnd(self)
				/* OFF */
				if iskeyword(K_OFF) or iskeyword(K_END) or iskeyword(K_ENDSWITCH) or csbraceend() {
					nexttoken()
					clearTextBuffer()
					nSwitchCounter--
					return True 
				else
					error(ERROR_SWITCHOFF)
				}
			else
				error(ERROR_SWITCHEXPR)
			}
			nSwitchCounter--
			return False
		}
		/* Statement --> Import Identifier { '.' Identifier } */
		if iskeyword(K_IMPORT) {
			clearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			/* Generate Code */
			lOutput = namedotname() 
			addParameter(:Value)
			oTarget.GenerateImportPackage(self)
			clearTextBuffer()
			return lOutput
		}
		/* Statement --> epslion */
		if epslion() {
			return True 
		}
		/* Statement --> Comma */
		if isoperator2(OP_COMMA) {
			nexttoken()
			clearTextBuffer()
			return True 
		}
		/* Statement --> Expr */
		if expr() {
			if isOperator(")") {
				NextToken()
			} 
			GenerateStatementIsExpression()
			return True 

		}
		return False

		
	func GenerateStatementIsExpression
		AddParameterFromSecondBuffer(:Expression)
		oTarget.GenerateExpressionCommand(self)
		clearTextBuffer()

	func GetExprAsString 

		/*
			When we have a code like 
				Return new qDate() { setDate(y,m,d) }
			Ring Compiler while produce instructions for 
				new qDate() { setDate(y,m,d) }
			Then it will produce the Return instruction 
			To return the expression on the Stack 
			This is OK for Ring Compiler 
			But for Ring2PWCT we want a different behavior 
			We want to generate the Return instruction 
			While generating new qDate() { setDate(y,m,d) } as expression 
			So using GetExprAsString() we can achive this by
				1 - calling expr()
				2 - Ignore all of the generated instruction (added to aParseTree)
				3 - Get tokens text parsed by expr() 
		*/

		aParseTreeCopy = aParseTree  
		nTokensStart = nActiveToken
		x = expr()
		nTokensEnd  = nActiveToken - 1
		cTokensText = ""
		if nTokensEnd >= nTokensStart {
			cTokensText = TokensText(nTokensStart,nTokensend)
		}
		aParseTree = aParseTreeCopy
		addParameterAndValue(:Expression,cTokensText)
		return x 
