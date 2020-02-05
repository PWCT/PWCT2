load "../vsfgenerator/generator.ring"

load "globals.ring"

func main
	aList = GetTokens("test.ring")
	PrintTokens(aList)
	
func GetTokens cFileName
	pState = ring_state_new()
	aList = ring_state_filetokens(pState,cFileName)
	ring_state_delete(pState)
	return aList

func PrintTokens aList
	for aToken in aList
		switch aToken[C_TOKENTYPE]
		on C_KEYWORD 
			? Width("Keyword",C_WIDTH) + ": "  +
			 aKeywords[0+aToken[C_TOKENVALUE]]
		on C_OPERATOR 
			? Width("Operator",C_WIDTH)  + ": " +
			 aToken[C_TOKENVALUE]
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

func Width cText,nWidth
	return cText+Copy(" ",nWidth-len(cText))
