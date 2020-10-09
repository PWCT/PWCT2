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
				case :if
					AddIfExpression(aCommand[:Expression])
				case :BlockEnd
					popParent()
				case :load 
					AddLoadLiteral(aCommand[:Expression])
				case :Func 
					AddFuncParameters(aCommand[:Function],aCommand[:Parameters])
				case :return
					AddReturnExpression(aCommand[:Expression])
				case :give 
					AddGiveIdentifier(aCommand[:Identifier])
				case :class 
					AddDefineClass(aCommand[:ClassName],aCommand[:ParentClassName])
			}
		}
