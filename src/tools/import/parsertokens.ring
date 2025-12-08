/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Parser
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ParserTokens

	func setTokens aList
		aTokens 	= aList 
		nActiveToken 	= 0
		nTokensCount	= len(aTokens)

	func start
		nextToken()
		do
			if ! mainClass() {
				error("Parsing Error!")
				return False
			}
		again (nActiveToken != nTokensCount)
		return True

	func ignoreNewLine
		DisableBufferFlag()
		while epslion() {}
		EnableBufferFlag()

	func epslion
		if isendline() {
			if nexttoken() or nTokensCount = 1 {
				return True 
			}
		}
		if isComment() {
			oTarget.GenerateComment(self)
			if nexttoken() {
				return True
			}
		}

		return False

	func loadToken
		aActiveToken	= aTokens[nActiveToken]
		nTokenType 	= aActiveToken[C_TOKENTYPE]
		cTokenValue 	= aActiveToken[C_TOKENVALUE]
		nTokenIndex 	= aActiveToken[C_TOKENINDEX]
		if lBufferFlag {
			AddToTextBuffer()
		}

	func clearTextBuffer
		cBuffer = ""
		cBuffer2 = ""

	func addParameter cAttribute 
		aInstructionParameters[cAttribute] = cBuffer
		return cBuffer

	func addParameterAndValue cAttribute,cValue
		aInstructionParameters[cAttribute] = cValue
		return 

	func addParameterFromSecondBuffer cAttribute 
		aInstructionParameters[cAttribute] = cBuffer2
		return cBuffer2

	func parameter cAttribute
		return aInstructionParameters[cAttribute]

	func clearInstructionParameters
		aInstructionParameters = []

	func addParameterToInstruction nIns,cAttribute
		aParseTree[nIns][cAttribute] = cBuffer

	func addParameterToInstructionFromSecondBuffer nIns,cAttribute
		aParseTree[nIns][cAttribute] = cBuffer2

	func valueAsString cValue
		# Add " " or ' ' or ` `
			if substr(cValue,'"') = 0 {
				cChar = '"'
			elseif substr(cValue,"'") = 0 
				cChar = "'"
			else 
				cChar = "`"
			}
		return cChar + cValue + cChar

	func processToken
		# We use cTokenValue2 to avoid updating cTokenValue 
		# Because ValueAsString() could be called many times 
		if Find([C_LITERAL,C_NUMBER,C_OPERATOR,C_IDENTIFIER],nTokenType) {
			cTokenValue2 = cTokenValue
			if nTokenType = C_LITERAL {
				cTokenValue2 = ValueAsString(cTokenValue)
			}
			if nTokenType = C_OPERATOR {
				if cTokenValue = "?" {
					return
				elseif cTokenValue = "=" 
					if right(cBuffer,3) = " < " or 
					   right(cBuffer,3) = " > " {
						cBuffer = left(cBuffer,len(cBuffer)-1)+"= "
						cBuffer2 = left(cBuffer2,len(cBuffer2)-1)+"= "
						cTokenValue = ""
						return 
					else 
						return " = "
					}
				elseif cTokenValue = "+=" 
					return " += "
				elseif cTokenValue = "-=" 
					return " -= "
				elseif cTokenValue = "*=" 
					return " *= "
				elseif cTokenValue = "<" 
					return " < "
				elseif cTokenValue = ">" 
					return " > "
				elseif cTokenValue = "<=" 
					return " <= "
				elseif cTokenValue = ">=" 
					return " >= "
				elseif cTokenValue = "!=" 
					return " != "
				}
			}			
	 		return cTokenValue2
		}

	func addToTextBuffer 
		cBuffer += ProcessToken()

	func manualAddToTextBuffer cText
		cBuffer += cText

	func manualAddToSecondTextBuffer cText
		cBuffer2 += cText

	func addToSecondTextBuffer 
 		cBuffer2 += ProcessToken()

	func enableBufferFlag
		lBufferFlag = True

	func disableBufferFlag
		lBufferFlag = False

	func nextToken
		if nActiveToken < nTokensCount {
			if lBufferFlag {
				AddToSecondTextBuffer()
			}
			nActiveToken++
			LoadToken()
			return True
		}
		return False

	func removeCurrentTokenFromBuffer
		if right(cBuffer,len(cTokenValue)) = cTokenValue {
			cBuffer = left(cBuffer,len(cBuffer)-len(cTokenValue))
		}
		if right(cBuffer2,len(cTokenValue)) = cTokenValue {
			cBuffer2 = left(cBuffer2,len(cBuffer2)-len(cTokenValue))
		}

	func removeOpenedBraceFromBuffer
		if right(cBuffer,1) = "{"
			cBuffer = left(cBuffer,len(cBuffer)-1)
		ok
		if right(cBuffer2,1) = "{"
			cBuffer2 = left(cBuffer2,len(cBuffer2)-1)
		ok

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

	func isComment return nTokenType = C_COMMENT

	func isAnyKeyword return nTokenType = C_KEYWORD

	func isAnyOperator return nTokenType = C_OPERATOR 

	func isOperator2 nIndex
		return nTokenType = C_OPERATOR and 
		   nTokenIndex = nIndex 
	
	func setToken x 
		if x >= 1 and x <= nTokensCount {
			nActiveToken = x 
			loadtoken()
			return 1 
		}
		return 0 

	func passNewLine
		while passepslion() {}

	func passEpslion
		/* used after factor - identifier to allow {  } in new line */
		if isendline() {
			nLineNumber = cTokenValue
			if nexttoken() {
				return True 
			}
		}
		return False

	func currentToken
		return nActiveToken

	func error cMsg 
		if lOnErrorPrintMsg {
			? "PWCT 2.0 - Import Tool"
			? "Compiler Error!"
			? "Token Number : " + nActiveToken
			? "Line Number  : " + nLineNumber
			? cMsg
		}
		if lOnErrorShutDown {
			ShutDown()
		}


	func generate aCommand, lClear 
		aParseTree + aCommand 
		if lClear {
			clearTextBuffer()
			clearInstructionParameters()
		}

	func getParseTree 
		return aParseTree

	func currentInstruction
		return len(aParseTree)

	func printParseTree
		? "Parse Tree..."
		? List2Code(aParseTree)


	func TokensText nFrom, nTo 
		cTokensText = ""	
		for t=nFrom to nTo {
			aToken = aTokens[t] 
			switch aToken[C_TOKENTYPE] {
			case C_KEYWORD 
				if cTokensText { cTokensText += " " }
				cTokensText += lower(aKeywords[0+aToken[C_TOKENVALUE]]) + " "
			case C_OPERATOR 
				if (len(cTokensText) > 1) and (right(cTokensText,1) != " ") {
					if aToken[C_TOKENVALUE] = ")" or aToken[C_TOKENVALUE] = "}" {
						if right(cTokensText,1) != "(" or right(cTokensText,1) = "{" {
							cTokensText += " "
						}
					}
				}
				cTokensText += aToken[C_TOKENVALUE]
				if aToken[C_TOKENVALUE] = ")" or aToken[C_TOKENVALUE] = "{" {
					cTokensText += " "
				}
			case C_LITERAL 
				cTokensText += valueAsString( aToken[C_TOKENVALUE] ) + " "
			case C_NUMBER 
				cTokensText += "" + aToken[C_TOKENVALUE] + " "
			case C_IDENTIFIER
				if (len(cTokensText) > 1) and (right(cTokensText,1) != " ") {
					cTokensText += " "
				}  
				cTokensText += "" + aToken[C_TOKENVALUE] 
			case C_ENDLINE 
			case C_COMMENT 
			}
		} 		
		return cTokensText	

	func processkeywords() {
	/*
	**  Change some keywords to identifiers (Useful for Natural Commands using Classes/Braces)
	**  Check if we have a keyword
	*/
	if (isanykeyword() &&
	    /* Check keywords that are in the middle of instructions */
	    (iskeyword(K_TO) || iskeyword(K_IN) ||
	     iskeyword(K_FROM) || iskeyword(K_STEP) ||
	     /* Check keywords releated to if-statement */
	     ((! nIfCounter) &&
	      (iskeyword(K_BUT) || iskeyword(K_OK))) ||
	     /* Check keywords related to Switch-statement */
	     ((! nSwitchCounter) &&
	      (iskeyword(K_ON) || iskeyword(K_CASE) ||
	       iskeyword(K_OFF))) ||
	     /* Check keywrods related to Try-Catch-Done statement */
	     ((! nTryCatchCounter) &&
	      (iskeyword(K_CATCH) || iskeyword(K_DONE))) ||
	     /* Check the Again keyword */
	     ((! nDoAgainCounter) && (iskeyword(K_AGAIN))) ||
	     /* Check keywords shared by if-statement and switch-statement */
	     ((! nIfCounter) && ( ! nSwitchCounter ) &&
	      (iskeyword(K_ELSE) || iskeyword(K_OTHER))))) {
		keywordtoidentifier(false)
	/* Check keywords related to classes identifiers */
	elseif (isanykeyword(pParser) &&
		 (iskeyword(K_THIS) || iskeyword(K_SELF) ||
		  iskeyword(K_SUPER))) 
		keywordtoidentifier(true)
	}
}
