/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Generator
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

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

	func WriteVisualSourceFile
		oPWCT.WriteVisualSourceFile()

	func GetStepsTreeTable
		return oPWCT.GetStepsTreeTable()

	func GetInteractionsTable 
		return oPWCT.GetInteractionsTable()

	func GetStepsID
		return oPWCT.GetStepsID()

	func GetInteractionsID
		return oPWCT.GetInteractionsID()

	func ProcessCommand aCommand
		oPWCT {
			switch aCommand[:Command] {
				case :Load 
					AddLoadLiteral(aCommand[:Expression],aCommand[:Type])
				case :Import
					AddImportValue(aCommand[:Value])
				case :See 
					AddPrintExpression(aCommand[:Expression],False)
				case :QuestionMark 
					AddPrintExpression(aCommand[:Expression],True)
				case :Give 
					AddGiveIdentifier(aCommand[:Identifier])
				case :BlockEnd
					popParent()
				case :If
					AddIfExpression(aCommand[:Expression])
				case :But
					AddButExpression(aCommand[:Expression])
				case :Else
					AddElse()
				case :Switch
					AddSwitchVariable(aCommand[:Variable])
				case :SwitchCase
					AddSwitchCaseValue(aCommand[:Value])
				case :SwitchOther
					AddSwitchOther()
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
				case :Try
					AddTry()
				case :Catch
					AddCatch()
				case :Func 
					AddFuncParameters(aCommand[:Function],aCommand[:Parameters])
				case :Return
					AddReturnExpression(aCommand[:Expression])
				case :Package 
					AddPackage(aCommand[:PackageName])
				case :Class 
					AddDefineClass(aCommand[:ClassName],aCommand[:ParentClassName])
				case :Private 
					AddPrivate()
				case :Expression
					AddExpressionCommand(aCommand[:Expression])
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
						if right(cComment,1) = char(10) {
							cComment = left(cComment,len(cComment)-1)
						}
						if right(cComment,1) = char(13) {
							cComment = left(cComment,len(cComment)-1)
						}
						cComment = Trim(cComment)
						if left(cComment,1) = "#" {
							cComment = substr(cComment,2)
						elseif left(cComment,2) = "//" 
							cComment = substr(cComment,3)
						}
						AddStep(cComment)
					}
				case :OpenExpressionCallFunction 
					AddOpenExpressionCallFunction(aCommand[:Expression])
			}
		}

	func Optimization
		nMax = len(aParseTree)
		# The First Pass (We check ')' that exist alone & We check braces '{' after Expressions)
		for t=2 to nMax {
			aPrevCommand = aParseTree[t-1]
			aCommand = aParseTree[t]
			switch aCommand[:Command] {
				# merge ')' that exist alone with previous expression
				# Also merge separated parameters like ',180)' with previous expression
				case :Expression 
					if aPrevCommand[:Command] = :Expression {
						if right(trim(aCommand[:Expression]),1) = ")" and 
						   not substr(aCommand[:Expression],"(") {
							aParseTree[t-1][:Expression] += aCommand[:Expression]
							del(aParseTree,t) t-- nMax--
							loop
						}
					}
				# When we have braces '{' after expression - We will analysis the expression  
				case :UsingBraces 
					if aPrevCommand[:Command] = :Expression {
						cType = ExpressionType(aPrevCommand[:Expression])
						lDelete = False
						switch cType {
							#  We have something like : myobj { } 
							case "word" 
								aParseTree[t-1][:Command] = :AccessObject
								lDelete = True
							# We have something like : myfunc = func x,y
							case "= func"
								# Get the function name (variable) and the function parameters 
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
							# We have something like : myobj = new myclass
							case "= new"
								# Get the Object Name and the Class Name 
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
							# We have something like : myobj = new myclass(value)
							case "= new init"
								# Get the Object Name, the Class Name and the Init() method parameters 
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
							# We have something like : new myclass 
							case "new"
								# Get the Class Name 
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
		# Second Pass (We check Expressions that Contains New Objects)
		nMax = len(aParseTree)
		for t=1 to nMax {
			if aParseTree[t][:Command] = :Expression {
				if ExpressionIsCallFunction(t) or ExpressionIsCallMethod(t) {
					loop 
				}
				cType = ExpressionType(aParseTree[t][:Expression])
				switch cType {
					# We have something like : myobj = new myclass
					case "= new"
						# Get the Object Name and the Class Name 
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
					# We have something like : myobj = new myclass(value)
					case "= new init"
						# Get the Object Name, the Class Name and the Init() method parameters 
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
					# We have something like : new myclass 
					case "new"
						# Get the Class Name 
						aParseTree[t][:Command] = :newobj	
						cExpr = aParseTree[t][:Expression]
						nNewPos = substr(lower(cExpr),"new")
						cClassName = substr(cExpr,nNewPos+3)
						aParseTree[t][:ClassName] = trim(cClassName)
						aParseTree[t][:lInit] = False
						aParseTree[t][:lBraces] = False
				}
			elseif aParseTree[t][:Command] = :AccessObject 
				cExpr = aParseTree[t][:Expression]
				nPos = substr(cExpr,"( new")
				if nPos {
					# Copy the Current Command 
						Insert(aParseTree,t,aParseTree[t])
					# Change the current command to Open Expression (Function Call)
						aParseTree[t][:Command] = :OpenExpressionCallFunction
						aParseTree[t][:Expression] = left(cExpr,nPos-1)
					# Change the Next Command (Access Object)
						aParseTree[t+1][:Expression] = substr(cExpr,nPos+2)
					# Change the extra ')' to (Block End) command 
						for t2=1 to nMax {
							if aParseTree[t2][:Command] = :Expression {
								if trim(aParseTree[t2][:Expression]) = ")" {
									aParseTree[t2][:Command] = :BlockEnd
									exit 
								}
							}
						}

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

