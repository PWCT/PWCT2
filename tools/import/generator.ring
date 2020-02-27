/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Generator
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "../vsfgenerator/generator.ring"

class Generator

	aParseTree = []

	func SetParseTree aTree
		aParseTree = aTree

	func Start 
		oPWCT = new VSFGenerator {	
			cFileName = "test.pwct"
		}
		for aCommand in aParseTree {
			switch aCommand[:Command] {
				case :See 
					oPWCT.AddPrintExpression(aCommand[:Expression],False)
				case :QuestionMark 
					oPWCT.AddPrintExpression(aCommand[:Expression],True)
				case :if
					oPWCT.AddIfExpression(aCommand[:Expression])
			}
		}
		oPWCT.WriteVisualSourceFile()
