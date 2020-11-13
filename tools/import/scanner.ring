/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Scanner
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class Scanner 

	cFileName
	aTokens = []

	func setFileName cFile 
		cFileName = cFile

	func Start 
		pState = ring_state_new()
		aTokens = ring_state_filetokens(pState,cFileName,False)
		ring_state_delete(pState)
	
	func GetTokens
		return aTokens

	func PrintTokens 
		nID = 0
		for aToken in aTokens {
			nID++
			? "ID = " + nID
			switch aToken[C_TOKENTYPE] {
			case C_KEYWORD 
				? Width("Keyword",C_WIDTH) + ": "  +
				 aKeywords[0+aToken[C_TOKENVALUE]]
			case C_OPERATOR 
				? Width("Operator",C_WIDTH)  + ": " +
				 aToken[C_TOKENVALUE] + " (" +
				 aToken[C_TOKENINDEX] + ")"
			case C_LITERAL 
				? Width("Literal",C_WIDTH)  + ": " +
				 aToken[C_TOKENVALUE]
			case C_NUMBER 
				? Width("Number",C_WIDTH)  + ": " +
				 aToken[C_TOKENVALUE]
			case C_IDENTIFIER 
				? Width("Identifier",C_WIDTH)  + ": " +
				 aToken[C_TOKENVALUE]
			case C_ENDLINE 
				? "EndLine"	
			}
		}
	
	
	
