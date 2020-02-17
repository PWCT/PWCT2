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

	func setTokens aList
		aTokens 	= aList 
		nActiveToken 	= 0
		nTokensCount	= len(aTokens)

	func LoadToken
		aActiveToken	= aTokens[nActiveToken]
		nTokenType 	= aActiveToken[C_TOKENTYPE]
		cTokenValue 	= aActiveToken[C_TOKENVALUE]
		nTokenIndex 	= aActiveToken[C_TOKENINDEX]

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
		   cTokenIndex = nIndex 

	func Generate aCommand 
		aParseTree + aCommand 

	func GetParseTree 
		return aParseTree

	func Start 
		do
			Statement()	
		again NextToken()

	func Statement 
		StmtSeeExpr()

	func StmtSeeExpr
		if isKeyWord(K_SEE) {
			NextToken()
			Expr()
			Generate( [
				:Command = :See,
				:Expression = cBuffer
			] )
		}

	func Expr
		cBuffer = ""
		Literal()

	func Literal
		if isLiteral() {
			cBuffer += cTokenValue
			NextToken()
			return True
		}
		return False

	func PrintParseTree
		? "Parse Tree..."
		? List2Code(aParseTree)

	func IGNORENEWLINE
		while epslion() end

	func epslion
		if isendline() {
			if nexttoken() {
				return 1 
			}
			if TokensCount = 1 {
				return 1 
			}
		}
		return 0 

	func ring_parser_expr  
		/* Expr --> LogicNot { and|or LogicNot } */
		if ( logicnot() ) {
			x = 1 
			while ( iskeyword(K_AND) 	|| isoperator("&&")  	|| 
				iskeyword(K_OR) 	|| isoperator("||") ) 	{
				if ( iskeyword(K_AND) || isoperator("&&") ) {
					nexttoken()
					IGNORENEWLINE() 
					x = logicnot()
					if ( x = 0 ) {
						return 0 
					}
				else
					nexttoken()
					IGNORENEWLINE() 
					x = logicnot()
					if ( x = 0 ) {
						return 0 
					}
				}
			}
			return x 
		}
		return 0 
	

