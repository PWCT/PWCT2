/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Parser
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "parserdata.ring"
load "parsertokens.ring"
load "parserexpr.ring"
load "parserstmt.ring"

mergemethods(:Parser,:ParserTokens)
mergemethods(:Parser,:ParserExpr)
mergemethods(:Parser,:ParserStmt)
