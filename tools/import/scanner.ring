class Scanner 

	cFileName
	aTokens = []

	func setFileName cFile 
		cFileName = cFile

	func GenTokens 
		pState = ring_state_new()
		aTokens = ring_state_filetokens(pState,cFileName)
		ring_state_delete(pState)
	
	func GetTokens
		return aTokens

	func PrintTokens 
		for aToken in aTokens
			switch aToken[C_TOKENTYPE]
			on C_KEYWORD 
				? Width("Keyword",C_WIDTH) + ": "  +
				 aKeywords[0+aToken[C_TOKENVALUE]]
			on C_OPERATOR 
				? Width("Operator",C_WIDTH)  + ": " +
				 aToken[C_TOKENVALUE] + " (" +
				 aToken[C_TOKENINDEX] + ")"
			on C_LITERAL 
				? Width("Literal",C_WIDTH)  + ": " +
				 aToken[C_TOKENVALUE]
			on C_NUMBER 
				? Width("Number",C_WIDTH)  + ": " +
				 aToken[C_TOKENVALUE]
			on C_IDENTIFIER 
				? Width("Identifier",C_WIDTH)  + ": " +
				 aToken[C_TOKENVALUE]
			on C_ENDLINE 
				? "EndLine"	
			off
		next
	
	
	