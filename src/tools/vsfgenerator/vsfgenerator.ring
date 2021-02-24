/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Visual Source File Generator Class
**	Date : 2020.02.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

C_CheckboxTrue = 2

class VSFGenerator

	cFileName = "test/test.pwct"
	oModel = new GoalDesignerModel

	oStyle 		= new HTMLStyles
	oHTMLFunctions	= new HTMLFunctions

	# Setting the Parent Step
		aParents 	= [1]
		nParentID	= 1

	# Setting the Parent Step when using the Class Component 
		nStepID_PrivateAttributes	= 0
		nStepID_PrivateMethods		= 0

	# Setting the Parsent Step when using the Try-Catch Component 
		nStepID_Catch				= 0

	func startGenerator
		TestGenerator()
		WriteVisualSourceFile()

	func TestGenerator
		for x = 1 to 10 {
			AddRootStep("Step Number : " + x)
			AddPrintLiteral("Hello, World " + x,True)
		}

	func WriteVisualSourceFile
		# Delete the old visual source file 
			if fexists(cFileName) { remove(cFileName) }
		# Write the new visual source file (*.pwct)
			oVisualSourceFile = new visualSourceFile
			oVisualSourceFile.cFileName  =  cFileName
			oVisualSourceFile.Open()
			oVisualSourceFile.SetStepsTreeTable(oModel.oStepsTreeModel.GetData())
			oVisualSourceFile.SetInteractionsTable(oModel.oInteractionModel.GetData())
			oVisualSourceFile.SetStepsID(oModel.oStepsTreeModel.GetID())
			oVisualSourceFile.SetInteractionsID(oModel.oInteractionModel.GetID())
			oVisualSourceFile.CreateTables()
			oVisualSourceFile.SaveTables()
			oVisualSourceFile.Close()
	
	func AddRootStep cStepName 
		cPlainStepName = cStepName
 		nStepID = oModel.AddStep(1,[
				:name = cStepName,
				:active = True , 
				:code = "" , 
			 	:interactionid = oModel.oInteractionModel.AddUserInteraction() ,
				:visible = True , 
				:stepnumber = 1 ,
				:steptype = C_STEPTYPE_COMMENT,
				:plainname = cPlainStepName
			]
		)
		return nStepID

	func List2InteractionVariables aList 
		cVariables = ""
		for aItem in aList {
			cVariables += aItem[1] + C_INTERACTIONVALUES_SEPARATOR +
					aItem[2] + C_INTERACTIONVALUES_SEPARATOR
		} 
		return cVariables 

	/*
		Purpose : Add Generated Step Interaction
		Parameters : The component Name
		Output : Interaction ID
	*/

	func AddGeneratedInteraction cComponent
		return oModel.oInteractionModel.AddGeneratedInteraction(cComponent)

	/*
		Purpose : Save Variables Values
		Parameters : Interaction ID and Variables Values
		Output : None
	*/

	func SaveVariablesValues nIID,cVariablesValues
		oModel.oInteractionModel.SaveVariablesValues(nIID,cVariablesValues)

	/*
		Purpose : Add Generated Step
		Parameters : Step Name, Interaction ID, Step Number and Step Type
		Output : Step ID
	*/

	func AddGeneratedStep nParentID,cStepName,nIID,nStepNumber,nStepType
		cPlainStepName = oHTMLFunctions.PlainText(cStepName)
 		nStepID = oModel.AddStep(nParentID,[
				:name = cStepName,
				:active = True , 
				:code = "" , 
			 	:interactionid = nIID ,
				:visible = True , 
				:stepnumber = nStepNumber ,
				:steptype = nStepType,
				:plainname = cPlainStepName 
			]
		)
		return nStepID

	/*
		Purpose : Set Text color and backcolor 
		Parameters : Text as String 
		Output : Styled Text as String 
	*/
	func StyleData cText 
		return oStyle.text( htmlspecialchars(cText) , "C_STEPCOLOR_DATA_TEXT" ,"C_STEPCOLOR_DATA_BACKCOLOR") 

	/*
		HTML Special Character 
		Input : String contains Special Characters like < and >
		Output : String to be displayed in HTML pages
	*/
	func HTMLSpecialChars cStr
		return oHTMLFunctions.HTMLSpecialChars(cStr)

	/*
		Accept literal contains characters like ", ' and `
	*/
	func common_literal cText 
		if substr(cText,CHAR(34)) = 0 {
			cChar = Char(34)
		elseif substr(cText,"'") = 0 
			cChar = "'"
		elseif substr(cText,"`") = 0 
			cChar = "`"
		else 
			cChar = '"'
			cText = substr(cText,'"',`"+char(34)+"`)
		}
		return cChar + cText + cChar

	/*
		Replacement for using the Interaction Page
	*/
	func UseComponent cComponentName,aVarsList
		nIID = AddGeneratedInteraction(cComponentName)
		cVariables = List2InteractionVariables(aVarsList)
		SaveVariablesValues(nIID,cVariables)
		return nIID

	/*
		Determine if we have just a Literal or long Expression
	*/
	func ExprIsLiteral cExpr
		lLiteral = False
		if len(cExpr) > 1 {
			cChar = cExpr[1]
			if cChar = '"' or cChar = "'" or cChar = "`" {
				nSize = len(cExpr)
				if cChar = cExpr[nSize] {
					cSub = substr(cExpr,2,nSize-2)
					if substr(cSub,cChar) = 0 {
						lLiteral = True  # Literal
						cExpr = cSub
					}	 
				}
			}
		}
		return [:IsLiteral = lLiteral,:Expr = cExpr]

	/*
		Input  : "Some Text" as String 
		Output : Some Text as String
	*/
	func JustLiteralText cLiteral 
		return ExprIsLiteral(cLiteral)[:Expr]
	
	func SetStepsParent 
		if len(aParents) = 0 { return }
		nParentID = aParents[len(aParents)]

	func PopParent
		if len(aParents) > 1 {
			del(aParents,len(aParents))
		}
		SetStepsParent()

	/*
		Pass a literal to the Print component
	*/

	func AddPrintLiteral cLiteral,lNewLine 
		AddPrintExpression(char(34) + cLiteral + char(34),lNewLine)

	/*
		The Print Component
	*/

	func AddPrintExpression cExpr,lNewLine
		# Add new line or not	
			if lNewLine {
				cNewLine = "2"
				cCommand = "? "
				cStepNameNewLine = T_CT_PRINT_ST_NEWLINE
			else 
				cNewLine = "0"
				cCommand = "see "
				cStepNameNewLine = ""
			}  
		# Literal or Expression
			aExpr = ExprIsLiteral(cExpr)
			if aExpr[:IsLiteral] {
				cType = "1"  # Literal
				cExpr = aExpr[:Expr]
			else 
				cType = "2"  # Expression
			}
		# Use the Interaction Page
			nIID = UseComponent("print",[
				:text 		= cExpr,
				:type 		= cType,
				:newline 	= cNewLine 
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_PRINT_ST_PRINT + StyleData(cExpr) + cStepNameNewLine,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			if cType = "1" {
				oModel.SaveStepCode(nStepID, cCommand + common_literal(cExpr))
			else 
				oModel.SaveStepCode(nStepID, cCommand + cExpr)
			}
			return nStepID

	/*
		if component 
	*/
	func AddIfExpression cExpr
		# Use the Interaction Page
			nIID = UseComponent("ifstatement",[
				:condition 	= cExpr
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
				T_CT_IFSTATEMENT_ST_IF + StyleData(cExpr ) ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "if " +  cExpr + " { " )
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_IFSTATEMENT_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
			nStepID3 = AddGeneratedStep(nStepID,
				T_CT_IFSTATEMENT_ST_ENDOFIFSTATEMENT ,
			nIID,nStepNumber,C_STEPTYPE_INFO)
			oModel.SaveStepCode(nStepID3, "} " )
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID

	/*
		Else If component 
	*/
	func AddButExpression cExpr
		# Use the Interaction Page
			nIID = UseComponent("elseif",[
				:condition 	= cExpr
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
				T_CT_ELSEIF_ST_ELSEIF + StyleData(cExpr ) ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "elseif " +  cExpr )
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_ELSEIF_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID

	/*
		Else component 
	*/
	func AddElse 
		# Use the Interaction Page
			nIID = UseComponent("else",[
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
				T_CT_ELSE_ST_ELSE,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "else")
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_ELSE_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID




	/*
		Load Component 
	*/
	func AddLoadLiteral cLiteral 
		cLiteral = JustLiteralText(cLiteral)
		# Use the Interaction Page
			nIID = UseComponent("load",[
				:file 		= cLiteral
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_LOAD_ST_LOAD + StyleData(cLiteral),
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "load " + '"' + cLiteral + '"')
			return nStepID

	/*
		Define Function component
	*/
	func AddFuncParameters cFunction,cParameters 
		lParameters = C_CheckboxTrue
		if trim(cParameters) = "" {
			lParameters = False
		}
		# Use the Interaction Page
			nIID = UseComponent("func",[
				:name 		= cFunction,
				:parameters	= cParameters,
				:lParameters	= lParameters,
				:output 	= "",
				:lOutput	= False 
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
				T_CT_FUNC_ST_FUNC + StyleData(cFunction ) +
				" " + StyleData(cParameters ) ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "func " + cFunction  + 
			" " + cParameters + " { " )
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_FUNC_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
			nStepID3 = AddGeneratedStep(nStepID,
				T_CT_FUNC_ST_ENDOFFUNC ,
			nIID,nStepNumber,C_STEPTYPE_INFO)
			oModel.SaveStepCode(nStepID3, "} " )
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID


	/*
		Return component 
	*/
	func AddReturnExpression cExpr
		# Use the Interaction Page
			nIID = UseComponent("return",[
				:value 	= cExpr
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_RETURN_ST_RETURN + StyleData(cExpr),
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "return " +  cExpr)
			return nStepID


	/*
		Give component  (Get Input Component)
	*/
	func AddGiveIdentifier cIdentifier
		# Use the Interaction Page
			nIID = UseComponent("getinput",[
				:text 	= cIdentifier
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_GETINPUT_ST_INPUT + StyleData(cIdentifier),
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "give " +  cIdentifier)
			return nStepID
	
	/*
		Define Class component 
	*/
	func AddDefineClass cClassName,cParentClassName 
		# Use the Interaction Page
			nIID = UseComponent("class",[
				:value 	= cClassName,
				:value2 = cParentClassName
			])
		# Generate the Step and the Code
			nStepNumber = 1
			if cParentClassName = NULL {
				nStepID = AddGeneratedStep(nParentID,
					 T_CT_CLASS_ST_CLASS + StyleData(cClassName),
					 nIID,nStepNumber,C_STEPTYPE_ROOT )
				oModel.SaveStepCode(nStepID, "class " + cClassName )
			else
				nStepID = AddGeneratedStep(nParentID,
					 T_CT_CLASS_ST_CLASS + StyleData(cClassName) + T_CT_CLASS_ST_FROM +
					StyleData(cParentClassName) ,
					nIID,nStepNumber,C_STEPTYPE_ROOT )
				oModel.SaveStepCode(nStepID, "class " + cClassName + " from " + cParentClassName  )
			
			}
			nStepNumber++
			nStepID_Attributes = AddGeneratedStep(nStepID, T_CT_CLASS_ST_ATTRIBUTES,
					nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION )
			nStepNumber++
			nStepID_Methods = AddGeneratedStep(nStepID, T_CT_CLASS_ST_METHODS,
					nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION )
			nStepNumber++
			nStepID_Private = AddGeneratedStep(nStepID, T_CT_CLASS_ST_PRIVATE,
					nIID,nStepNumber,C_STEPTYPE_INFO )
			oModel.SaveStepCode(nStepID_Private, "private")
			nStepNumber++
			nStepID_PrivateAttributes = AddGeneratedStep(nStepID_Private, T_CT_CLASS_ST_ATTRIBUTES,
					nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION )
			nStepNumber++
			nStepID_PrivateMethods = AddGeneratedStep(nStepID_Private, T_CT_CLASS_ST_METHODS,
					nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION )
			nStepNumber++
			AddGeneratedStep(nStepID_Private, T_CT_CLASS_ST_END,
					nIID,nStepNumber,C_STEPTYPE_INFO )
	
			# Set the Parent 
				aParents + nStepID_Methods
				aParents + nStepID_Attributes
				SetStepsParent()

	/*
		Class - Private Attributes/Methods 
	*/
	func AddPrivate 
		PopParent()	# Attributes 
		PopParent()	# Methods 
		aParents + nStepID_PrivateMethods
		aParents + nStepID_PrivateAttributes
		SetStepsParent()

	/*
		Package component 
	*/
	func AddPackage cPackageName
		# Use the Interaction Page
			nIID = UseComponent("package",[
				:value 	= cPackageName
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_PACKAGE_ST_PACKAGE + StyleData(cPackageName),
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "package " + cPackageName)
			return nStepID

	func AddExpressionCommand cExpr
		# Use the Interaction Page
			nIID = UseComponent("freetyping",[
				:value 		= cExpr
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			StyleData(cExpr),
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, cExpr)
			return nStepID

	/*
		WhileLoop component 
	*/
	func AddWhileExpression cExpr
		# Use the Interaction Page
			nIID = UseComponent("whileloop",[
				:condition 	= cExpr
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
				T_CT_WHILELOOP_ST_WHILE + StyleData(cExpr ) ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "while " +  cExpr + " { " )
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_WHILELOOP_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
			nStepID3 = AddGeneratedStep(nStepID,
				T_CT_WHILELOOP_ST_ENDOFWHILELOOP ,
			nIID,nStepNumber,C_STEPTYPE_INFO)
			oModel.SaveStepCode(nStepID3, "} " )
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID

	/*
		ForLoop component 
	*/
	func AddForLoop cStart,cTo,cStep
		if trim(cStep) = "" { cStep = "1" }
		# Use the Interaction Page
			nIID = UseComponent("forloop",[
				:start 	= cStart,
				:to 		= cTo,
				:step 	= cStep
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
					T_CT_FORLOOP_ST_FOR  + StyleData(cStart)  + " " +
					T_CT_FORLOOP_ST_TO   + StyleData(cTo) 		+ " " + 
					T_CT_FORLOOP_ST_STEP + StyleData(cStep),
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "for " + cStart +
				 " to " + cTo + " step " + 
				 cStep + " { "  )
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_FORLOOP_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
			nStepID3 = AddGeneratedStep(nStepID,
				T_CT_FORLOOP_ST_ENDOFFORLOOP ,
			nIID,nStepNumber,C_STEPTYPE_INFO)
			oModel.SaveStepCode(nStepID3, "} " )
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID

	/*
		ForInLoop component 
	*/
	func AddForInLoop cVariable,cIn,cStep
		if trim(cStep) = "" { cStep = "1" }
		# Use the Interaction Page
			nIID = UseComponent("forinloop",[
				:variable 	= cVariable,
				:in 				= cIn,
				:step 			= cStep
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_FORINLOOP_ST_FOR + StyleData(cVariable)  + " " +
			T_CT_FORINLOOP_ST_IN + StyleData(cIn) +  " " + 
			T_CT_FORINLOOP_ST_STEP + StyleData(cStep),
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "for " +  cVariable +
				 " in " + cIn +
				 " step " + cStep + " { "  )
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_FORINLOOP_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
			nStepID3 = AddGeneratedStep(nStepID,
				T_CT_FORINLOOP_ST_ENDOFFORLOOP ,
			nIID,nStepNumber,C_STEPTYPE_INFO)
			oModel.SaveStepCode(nStepID3, "} " )
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID

	/*
		DoAgain component 
	*/
	func AddDoAgainExpression cExpr
		# Use the Interaction Page
			nIID = UseComponent("doagain",[
				:condition 	= cExpr
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
				T_CT_DOAGAIN_ST_DO ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "do ")
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_DOAGAIN_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
			nStepID3 = AddGeneratedStep(nStepID,
				T_CT_DOAGAIN_ST_AGAIN + StyleData(cExpr) ,
			nIID,nStepNumber,C_STEPTYPE_INFO)
			oModel.SaveStepCode(nStepID3, "again " + cExpr )
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID

	/*
		Loop Component 
	*/
	func AddLoopValue cValue
		if cValue="" { cValue = "1" }
		# Use the Interaction Page
			nIID = UseComponent("loop",[
				:value 		= cValue
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_LOOP_ST_LOOP + StyleData(cValue) ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "loop " + cValue)
			return nStepID
	
	/*
		Exit Component 
	*/
	func AddExitValue cValue
		if cValue="" { cValue = "1" }
		# Use the Interaction Page
			nIID = UseComponent("exit",[
				:value 		= cValue
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_EXIT_ST_EXIT + StyleData(cValue) ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "exit " + cValue)
			return nStepID
	
	/*
		Bye Component 
	*/
	func AddBye cValue
		if cValue="" { cValue = "0" }
		# Use the Interaction Page
			nIID = UseComponent("shutdown",[
				:value 		= 0
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_SHUTDOWN_ST_VALUE + StyleData(cValue) ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID,  "shutdown("  + cValue + ")"  )
			return nStepID
	
	/*
		Switch Component 
	*/
	func AddSwitchVariable cVariable
		# Use the Interaction Page
			nIID = UseComponent("switch",[
				:variable 		= cVariable
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_SWITCH_ST_SWITCH + StyleData(cVariable) ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "switch " + cVariable + " { ")
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_SWITCH_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
			nStepID3 = AddGeneratedStep(nStepID,
				T_CT_SWITCH_ST_ENDOFSWITCH ,
			nIID,nStepNumber,C_STEPTYPE_INFO)
			oModel.SaveStepCode(nStepID3, "} " )
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID

	/*
		Switch - Case Component 
	*/
	func AddSwitchCaseValue cValue
		# Use the Interaction Page
			nIID = UseComponent("case",[
				:value 		= cValue
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_CASE_ST_CASE + StyleData(cValue) ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "case " + cValue)
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_CASE_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID


	/*
		Switch - Other Component 
	*/
	func AddSwitchOther 
		return AddElse()

	/*
		Import Component 
	*/
	func AddImportValue cValue
		# Use the Interaction Page
			nIID = UseComponent("import",[
				:value 		= cValue
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_IMPORT_ST_IMPORT + " " + StyleData(cValue) ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "import " + cValue)
			return nStepID

	/*
		Try-Catch Component 
	*/
	func AddTry
		# Use the Interaction Page
			nIID = UseComponent("trycatch",[
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
				T_CT_TRYCATCH_ST_TRY ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "try { " )
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_TRYCATCH_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)

			nStepNumber++
			nStepID3 = AddGeneratedStep(nStepID,
				T_CT_TRYCATCH_ST_CATCH ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID3, "catch " )
			nStepNumber++
			nStepID_Catch = AddGeneratedStep(nStepID3,
				T_CT_TRYCATCH_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)

			nStepNumber++
			nStepID5 = AddGeneratedStep(nStepID,
				T_CT_TRYCATCH_ST_END ,
			nIID,nStepNumber,C_STEPTYPE_INFO)
			oModel.SaveStepCode(nStepID5, "} " )
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID

	func AddCatch
		PopParent()	# Try
		aParents + nStepID_Catch
		SetStepsParent()

	/*
		Assignment Component 
	*/
	func AddAssignment cLeftSide,cRightSide
		# Use the Interaction Page
			nIID = UseComponent("assignment",[
				:leftside 		= cLeftSide,
				:rightside 		= cRightSide
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
			T_CT_ASSIGNMENT_ST_SET + StyleData(cLeftSide) +
			 " = " + StyleData(cRightSide)  ,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, cLeftSide + " = " + cRightSide )
			return nStepID

	/*
			Braces Component 
	*/
	func AddUsingBraces 
		# Use the Interaction Page
			nIID = UseComponent("braces",[
			])
		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
				T_CT_BRACES_ST_BRACESTART,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, "{" )
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_BRACES_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
			nStepID3 = AddGeneratedStep(nStepID,
				T_CT_BRACES_ST_BRACEEND ,
			nIID,nStepNumber,C_STEPTYPE_INFO)
			oModel.SaveStepCode(nStepID3, "}" )
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID

	/*
			Access Object Component 
	*/

	func AddAccessObject cValue
		# Use the Interaction Page
			nIID = UseComponent("accessobject",[
				:value 		= cValue
			])

		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
				StyleData(cValue) + " " + T_CT_BRACES_ST_BRACESTART,
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, cValue + " {" )
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_BRACES_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
			nStepID3 = AddGeneratedStep(nStepID,
				T_CT_BRACES_ST_BRACEEND ,
			nIID,nStepNumber,C_STEPTYPE_INFO)
			oModel.SaveStepCode(nStepID3, "}" )
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID


	/*
			Nested Function Component 
	*/
	func AddNestedFunc cVariable,cParameters
		# Use the Interaction Page
			nIID = UseComponent("nestedfunc",[
				:value 		= cVariable,
				:value2		= cParameters
			])

		# Generate the Step and the Code
			nStepNumber = 1
			nStepID = AddGeneratedStep(nParentID,
				StyleData(cVariable) + " = " + T_CT_ANONFUNC_ST_FUNC + StyleData(cParameters),
			nIID,nStepNumber,C_STEPTYPE_ROOT)
			oModel.SaveStepCode(nStepID, cVariable + " = func " + cParameters + " {")
			nStepNumber++
			nStepID2 = AddGeneratedStep(nStepID,
				T_CT_ANONFUNC_ST_STARTHERE ,
			nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
			nStepNumber++
			nStepID3 = AddGeneratedStep(nStepID,
				T_CT_ANONFUNC_ST_END ,
			nIID,nStepNumber,C_STEPTYPE_INFO)
			oModel.SaveStepCode(nStepID3, "}" )
		# Set the Parent 
			aParents + nStepID2
			SetStepsParent()
			return nStepID

	/*
			New Object Component 
	*/
	func AddNewObj cVariable,cClass,cInitPara,lInit,lBraces
		if lInit { nInit = 2  else nInit = 0}
		if lBraces { nBraces = 2 else nBraces = 0}
		# Use the Interaction Page
			nIID = UseComponent("newobj",[
				:value 		= cVariable,
				:value2		= cClass,
				:value3		= cInitPara,
				:braces		= nBraces,
				:init		= nInit
			])

		# Generate the Step and the Code
			nStepNumber = 1
		# Generate New Object Step

			if cVariable = NULL {
				if lInit = False {
					nStepID = AddGeneratedStep(nParentID,
						T_CT_NEWOBJ_ST_NEWOBJ + StyleData(cClass),
						nIID,nStepNumber,C_STEPTYPE_ROOT)
					oModel.SaveStepCode(nStepID, "new " + cClass)
				else 
					nStepID = AddGeneratedStep(nParentID,
						T_CT_NEWOBJ_ST_NEWOBJ + StyleData(cClass) +
						"(" + StyleData(cInitPara) + ")" ,
						nIID,nStepNumber,C_STEPTYPE_ROOT)
					oModel.SaveStepCode(nStepID, "new " + cClass +
						"(" + cInitPara + ")" )
				}
			else 
				if lInit = False {
					nStepID = AddGeneratedStep(nParentID,
						T_CT_NEWOBJ_ST_SET + StyleData(cVariable) + " = " + 
						T_CT_NEWOBJ_ST_NEWOBJ + StyleData(cClass),
						nIID,nStepNumber,C_STEPTYPE_ROOT)
					oModel.SaveStepCode(nStepID, cVariable + " = new " + cClass)
				else 
					nStepID = AddGeneratedStep(nParentID,
						T_CT_NEWOBJ_ST_SET + StyleData(cVariable) + " = " + 
						T_CT_NEWOBJ_ST_NEWOBJ + StyleData(cClass) +
						"(" + StyleData(cInitPara) + ")",
						nIID,nStepNumber,C_STEPTYPE_ROOT)
					oModel.SaveStepCode(nStepID, cVariable + " = new " + cClass +
						"(" + cInitPara + ")" )
				}
			}

		if lBraces {
			# Generate Braces 
				nStepNumber++
				nStepID = AddGeneratedStep(nStepID,
					T_CT_BRACES_ST_BRACESTART,
				nIID,nStepNumber,C_STEPTYPE_ROOT)
				oModel.SaveStepCode(nStepID, " {" )
				nStepNumber++
				nStepID2 = AddGeneratedStep(nStepID,
					T_CT_BRACES_ST_STARTHERE ,
				nIID,nStepNumber,C_STEPTYPE_ALLOWINTERACTION)
				nStepNumber++
				nStepID3 = AddGeneratedStep(nStepID,
					T_CT_BRACES_ST_BRACEEND ,
				nIID,nStepNumber,C_STEPTYPE_INFO)
				oModel.SaveStepCode(nStepID3, "}" )
			# Set the Parent 
				aParents + nStepID2
				SetStepsParent()
		}
		return nStepID







