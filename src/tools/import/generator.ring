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
				case :AccessObject
					AddAccessObject(aCommand[:Expression])
				case :NestedFunc
					AddNestedFunc(aCommand[:Variable],aCommand[:Parameters])
				case :NewObj 
					AddNewObj(aCommand[:Variable],aCommand[:ClassName],aCommand[:cInitParameters],aCommand[:lInit],aCommand[:lBraces])
				case :CallFunction 
					AddCallFunction(aCommand[:function],aCommand[:Parameters])
				case :CallMethod
					AddCallMethod(aCommand[:Object],aCommand[:Method],aCommand[:Parameters])
				case :Comment 
					aComments = str2list(aCommand[:Comment])
					for cComment in aComments {
						//AddExpressionCommand(cComment)
						AddStep(cComment)
					}
			}
		}

	func Optimization
		nMax = len(aParseTree)
		for t=2 to nMax {
			aPrevCommand = aParseTree[t-1]
			aCommand = aParseTree[t]
			switch aCommand[:Command] {
				case :Expression 
					if aPrevCommand[:Command] = :Expression {
						if trim(aCommand[:Expression]) = ")" {
							aParseTree[t-1][:Expression] += ")"
							del(aParseTree,t) t-- nMax--
							loop
						}
					}
				case :UsingBraces 
					if aPrevCommand[:Command] = :Expression {
						cType = ExpressionType(aPrevCommand[:Expression])
						lDelete = False
						switch cType {
							case "word" 
								aParseTree[t-1][:Command] = :AccessObject
								lDelete = True
							case "= func"
								aParseTree[t-1][:Command] = :nestedfunc
								cExpr = aParseTree[t-1][:Expression]
								nEqualPos = substr(cExpr,"=")
								cExpr2 = substr(cExpr,nEqualPos+1)
								nFuncPos = substr(lower(cExpr2),"func")
								cVariable = left(cExpr,nEqualPos-1)
								cPara = substr(cExpr2,nFuncPos+4)
								aParseTree[t-1][:Variable] = trim(cVariable)
								aParseTree[t-1][:Parameters] = trim(cPara)
								lDelete = True
							case "= new"
								aParseTree[t-1][:Command] = :newobj	
								cExpr = aParseTree[t-1][:Expression]
								nEqualPos = substr(cExpr,"=")
								cExpr2 = substr(cExpr,nEqualPos+1)
								nNewPos = substr(lower(cExpr2),"new")
								cVariable = left(cExpr,nEqualPos-1)
								cClassName = substr(cExpr2,nNewPos+3)
								aParseTree[t-1][:Variable] = trim(cVariable)
								aParseTree[t-1][:ClassName] = trim(cClassName)
								aParseTree[t-1][:lInit] = False
								aParseTree[t-1][:lBraces] = True
								lDelete = True
							case "= new init"
								aParseTree[t-1][:Command] = :newobj	
								cExpr = aParseTree[t-1][:Expression]
								nEqualPos = substr(cExpr,"=")
								cExpr2 = substr(cExpr,nEqualPos+1)
								nNewPos = substr(lower(cExpr2),"new")
								cVariable = left(cExpr,nEqualPos-1)
								cClassName = substr(cExpr2,nNewPos+3)
								cInit = SubStr(cClassName,substr(cClassName,"(")+1)
								cInit = left(cInit,len(cInit)-1)
								cClassName = left(cClassName,substr(cClassName,"(")-1)
								aParseTree[t-1][:Variable] = trim(cVariable)
								aParseTree[t-1][:ClassName] = trim(cClassName)
								aParseTree[t-1][:lInit] = True
								aParseTree[t-1][:cInitParameters] = cInit
								aParseTree[t-1][:lBraces] = True
								lDelete = True
							case "new"
								aParseTree[t-1][:Command] = :newobj	
								cExpr = aParseTree[t-1][:Expression]
								nNewPos = substr(lower(cExpr),"new")
								cClassName = substr(cExpr,nNewPos+3)
								aParseTree[t-1][:ClassName] = trim(cClassName)
								aParseTree[t-1][:lInit] = False
								aParseTree[t-1][:lBraces] = True
								lDelete = True
						}
						if lDelete {
							del(aParseTree,t) t-- nMax--
						}
					}
			}
		}
		# Second Pass 
			nMax = len(aParseTree)
			for t=1 to nMax {
				if aParseTree[t][:Command] = :Expression {
					if ExpressionIsCallFunction(t) or ExpressionIsCallMethod(t) {
						loop 
					}
					cType = ExpressionType(aParseTree[t][:Expression])
					switch cType {
						case "= new"
							aParseTree[t][:Command] = :newobj	
							cExpr = aParseTree[t][:Expression]
							nEqualPos = substr(cExpr,"=")
							cExpr2 = substr(cExpr,nEqualPos+1)
							nNewPos = substr(lower(cExpr2),"new")
							cVariable = left(cExpr,nEqualPos-1)
							cClassName = substr(cExpr2,nNewPos+3)
							aParseTree[t][:Variable] = trim(cVariable)
							aParseTree[t][:ClassName] = trim(cClassName)
							aParseTree[t][:lInit] = False
							aParseTree[t][:lBraces] = False
						case "= new init"
							aParseTree[t][:Command] = :newobj	
							cExpr = aParseTree[t][:Expression]
							nEqualPos = substr(cExpr,"=")
							cExpr2 = substr(cExpr,nEqualPos+1)
							nNewPos = substr(lower(cExpr2),"new")
							cVariable = left(cExpr,nEqualPos-1)
							cClassName = substr(cExpr2,nNewPos+3)
							cInit = SubStr(cClassName,substr(cClassName,"(")+1)
							cInit = left(cInit,len(cInit)-1)
							cClassName = left(cClassName,substr(cClassName,"(")-1)
							aParseTree[t][:Variable] = trim(cVariable)
							aParseTree[t][:ClassName] = trim(cClassName)
							aParseTree[t][:lInit] = True
							aParseTree[t][:cInitParameters] = cInit
							aParseTree[t][:lBraces] = False
						case "new"
							aParseTree[t][:Command] = :newobj	
							cExpr = aParseTree[t][:Expression]
							nNewPos = substr(lower(cExpr),"new")
							cClassName = substr(cExpr,nNewPos+3)
							aParseTree[t][:ClassName] = trim(cClassName)
							aParseTree[t][:lInit] = False
							aParseTree[t][:lBraces] = False
					}
				}
			}
			

	func ExpressionType cExpr 
		cExpr = lower(cExpr)
		cType = "word"
		if substr(cExpr,"= [") or substr(cExpr,",:") {
			return cType 
		}
		if substr(cExpr,"=") {
			if substr(cExpr,"new ") {
				cType = "= new"
				if substr(cExpr,"(") and substr(cExpr,")") {
					cType = "= new init"
				}
			}
			if substr(cExpr,"func ") {
				cType = "= func"
			}
		else 
			nPos = substr(cExpr,"new ")			
			if nPos {
				if trim(left(cExpr,nPos-1)) = NULL {
					cType = "new"
					if substr(cExpr,"(") and substr(cExpr,")") {
						cType = "new init"
					}
				}
			}
			nPos = substr(cExpr,"func ")
			if nPos {
				if trim(left(cExpr,nPos-1)) = NULL {
					cType = "func"
				}
			}
		}
		return cType 

	func ExpressionIsCallFunction nIndex
		cExp = aParseTree[nIndex][:Expression]
		exp = new qregularexpression() {
			setPattern("^(\w+)\((.*)\)$")
			match = match(cExp,0,0,0)
		}
		if match.hasmatch() {
			cFunc = match.captured(1)
			cPara = match.captured(2)
			aParseTree[nIndex][:Command] = :CallFunction
			aParseTree[nIndex][:Function] = cFunc
			aParseTree[nIndex][:Parameters] = cPara
		}

	func ExpressionIsCallMethod nIndex
		cExp = aParseTree[nIndex][:Expression]
		exp = new qregularexpression() {
			setPattern("^(\w+)\.(\w+)\((.*)\)$")
			match = match(cExp,0,0,0)
		}
		if match.hasmatch() {
			cObject = match.captured(1)
			cMethod = match.captured(2)
			cParameters = match.captured(3)
			aParseTree[nIndex][:Command] = :CallMethod
			aParseTree[nIndex][:Object] = cObject
			aParseTree[nIndex][:Method] = cMethod
			aParseTree[nIndex][:Parameters] = cParameters
		}

