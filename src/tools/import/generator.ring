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
		Optimization()
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
				case :Switch
					AddSwitchVariable(aCommand[:Variable])
				case :SwitchCase
					AddSwitchCaseValue(aCommand[:Value])
				case :SwitchOther
					AddSwitchOther()
				case :Import
					AddImportValue(aCommand[:Value])
				case :Try
					AddTry()
				case :Catch
					AddCatch()
				case :Assignment
					AddAssignment(aCommand[:LeftSide],aCommand[:RightSide])
				case :UsingBraces
					AddUsingBraces()
			}
		}

	func Optimization
		nMax = len(aParseTree)
		for t=2 to nMax {
			aPrevCommand = aParseTree[t-1]
			aCommand = aParseTree[t]
			if aCommand[:Command] = :UsingBraces {
				if aPrevCommand[:Command] = :Expression {
					? "Action: " + aPrevCommand[:Expression]
					? "Type: " + ExpressionType(aPrevCommand[:Expression])
				}
			}
		}

	func ExpressionType cExpr 
		cType = "Word"
		if substr(cExpr,"=") {
			if substr(cExpr,"new") {
				cType = "= new"
				if substr(cExpr,"(") and substr(cExpr,")") {
					cType = "= new init"
				}
			}
			if substr(cExpr,"func") {
				cType = "= func"
			}
		else 
			if substr(cExpr,"new") {
				cType = "new"
				if substr(cExpr,"(") and substr(cExpr,")") {
					cType = "new init"
				}
			}
			if substr(cExpr,"func") {
				cType = "func"
			}
		}
		return cType 
