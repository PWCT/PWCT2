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
		switch aCommand[:Command] {
			case :See 
				oPWCT.AddPrintExpression(aCommand[:Expression],False)
			case :QuestionMark 
				oPWCT.AddPrintExpression(aCommand[:Expression],True)
			case :if
				oPWCT.AddIfExpression(aCommand[:Expression])
			case :BlockEnd
				oPWCT.popParent()
			case :load 
				oPWCT.AddLoadLiteral(aCommand[:Expression])
			case :Func 
				oPWCT.AddFuncParameters(aCommand[:Function],aCommand[:Parameters])
			case :return
				oPWCT.AddReturnExpression(aCommand[:Expression])
			case :give 
				oPWCT.AddGiveIdentifier(aCommand[:Identifier])
			case :class 
				oPWCT.AddDefineClass(aCommand[:ClassName],aCommand[:ParentClassName])
		}
