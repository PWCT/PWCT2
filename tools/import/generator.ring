/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Generator
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "../vsfgenerator/generator.ring"

class Generator

	aParseTree = []

	oPWCT = new VSFGenerator {	
		cFileName = "output/app.pwct"
	}

	func setFileName cFile 
		oPWCT.cFileName = cFile

	func SetParseTree aTree
		aParseTree = aTree

	func Start 

		for aCommand in aParseTree {
			ProcessCommand(aCommand)
		}
		oPWCT.WriteVisualSourceFile()

	func ProcessCommand aCommand
		oPWCT {
			switch aCommand[:Command] {
				case :See 
					AddPrintExpression(aCommand[:Expression],False)
				case :QuestionMark 
					AddPrintExpression(aCommand[:Expression],True)
				case :If
					AddIfExpression(aCommand[:Expression])
				case :But
					AddButExpression(aCommand[:Expression])
				case :Else
					AddElse()
				case :BlockEnd
					popParent()
				case :Load 
					AddLoadLiteral(aCommand[:Expression])
				case :Func 
					AddFuncParameters(aCommand[:Function],aCommand[:Parameters])
				case :Return
					AddReturnExpression(aCommand[:Expression])
				case :Give 
					AddGiveIdentifier(aCommand[:Identifier])
				case :Class 
					AddDefineClass(aCommand[:ClassName],aCommand[:ParentClassName])
				case :Private 
					AddPrivate()
				case :Package 
					AddPackage(aCommand[:PackageName])
				case :Expression
					AddExpressionCommand(aCommand[:Expression])
				case :While
					AddWhileExpression(aCommand[:Expression])
				case :For
					AddForLoop(aCommand[:Start],aCommand[:To],aCommand[:Step])
				case :ForIn
					AddForInLoop(aCommand[:Variable],aCommand[:In],aCommand[:Step])				
				case :DoAgain
					AddDoAgainExpression(aCommand[:Expression])
				case :Exit 
					AddExitValue(aCommand[:Value])
				case :Loop
					AddLoopValue(aCommand[:Value])
				case :Bye
					AddBye(aCommand[:Value])
			}
		}
