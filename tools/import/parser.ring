class Parser

	aTokens 	= []
	nActiveToken 	= 0
	nTokensCount	= 0

	aActiveToken	= []	
	nTokenType 	= 0
	cTokenValue	= ""
	nTokenIndex 	= 0

	func setTokens aList
		aTokens 	= aList 
		nActiveToken 	= 1
		nTokensCount	= len(aTokens)

	func LoadToken
		aActiveToken	= aTokens[nActiveToken]
		nTokenType 	= aActiveToken[C_TOKENTYPE]
		cTokenValue 	= aActiveToken[C_TOKENVALUE]
		nTokenIndex 	= aActiveToken[C_TOKENINDEX]

	func NextToken
		if nActiveToken < nTokensCount
			nActiveToken++
		ok

	func isKeyword cKeyword
		return nTokenType = C_KEYWORD and 
		   cTokenValue = cKeyword 
		
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

