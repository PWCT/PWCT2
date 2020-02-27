/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Visual Source File Generator Class
**	Date : 2020.02.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class VSFGenerator

	cFileName = "test/test.pwct"
	oModel = new GoalDesignerModel

	oStyle 		= new HTMLStyles
	oHTMLFunctions	= new HTMLFunctions

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
			nParentID   = 1
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
