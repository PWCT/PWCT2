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
		cBuffer2 = ""

	func AddParameter cAttribute 
		aInstructionParameters[cAttribute] = cBuffer

	func AddParameterFromSecondBuffer cAttribute 
		aInstructionParameters[cAttribute] = cBuffer2

	func Parameter cAttribute
		return aInstructionParameters[cAttribute]

	func ClearInstructionParameters
		aInstructionParameters = []

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

	func AddToSecondTextBuffer 
		if Find([C_LITERAL,C_NUMBER,C_OPERATOR,C_IDENTIFIER],nTokenType) {
			if nTokenType = C_LITERAL {
				cTokenValue = ValueAsString(cTokenValue)
			}
	 		cBuffer2 += cTokenValue
		}


	func EnableBufferFlag
		lBufferFlag = True

	func DisableBufferFlag
		lBufferFlag = False

	func NextToken
		if nActiveToken < nTokensCount {
			if lBufferFlag {
				AddToSecondTextBuffer()
			}
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

	func isAnyOperator return nTokenType = C_OPERATOR 

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
		? "PWCT 2.0 - Import Tool"
		? "Compiler Error!"
		? "Token Number: " + nActiveToken
		? cMsg
		ShutDown()

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

	func Generate aCommand, lClear 
		aParseTree + aCommand 
		if lClear {
			clearTextBuffer()
			clearInstructionParameters()
		}

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

