# Form/Window Controller - Source Code File

load "componentwizardView.ring"
load "componentwizardgenerator.ring"

import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		open_window(:componentwizardController)
		exec()
	}
}

class componentwizardController from windowsControllerParent

	oView = new componentwizardView

	aQuickScripts = [
'NewStep(  )
SetStepCode(  )',
'NewParentStep(  )
	SetStepCode(  )
	AllowInteraction()
	NewStep( T_CT_XXX_ST_STARTHERE )
	oStep = GetActiveStep()
	SetActiveStep(oStep)
',
'NewParentStep(  )
	SetStepCode(  )
	AllowInteraction()
	NewStep( T_CT_XXX_ST_STARTHERE )
	oStep = GetActiveStep()
	NewStep( T_CT_XXX_ST_END )
		SetStepCode(  )
	SetActiveStep(oStep)
',
'

if Variable(:value3) = NULL {
	NewStep( StepData(:value4) + " = " +  T_CT_FINDITEM_ST_FIND  + StepData(:value2) +  T_CT_FINDITEM_ST_INLIST + StepData(:value) )
	SetStepCode( Variable(:value4) + " = binarysearch(" + Variable(:value) + "," + Variable(:value2) + ")" )
else
	NewStep( StepData(:value4) + " = " +  T_CT_FINDITEM_ST_FIND  + StepData(:value2) +  T_CT_FINDITEM_ST_INLIST + StepData(:value) +  T_CT_FINDITEM_ST_COLUMN + StepData(:value3) )
	SetStepCode( Variable(:value4) + " = binarysearch(" + Variable(:value) + "," + Variable(:value2) + "," + Variable(:value3) + ")" )
}
',
'
if Variable(:value3) = NULL {
	NewStep( StepData(:value5) + " = " +  T_CT_FINDITEM_ST_FIND  + StepData(:value2) +  T_CT_FINDITEM_ST_INLIST + StepData(:value) )
	SetStepCode( Variable(:value5) + " = find(" + Variable(:value) + "," + Variable(:value2) + ")" )
elseif Variable(:value3) != NULL and Variable(:value4) = NULL
	NewStep( StepData(:value5) + " = " +  T_CT_FINDITEM_ST_FIND  + StepData(:value2) +  T_CT_FINDITEM_ST_INLIST + StepData(:value) +  T_CT_FINDITEM_ST_COLUMN + StepData(:value3) )
	SetStepCode( Variable(:value5) + " = find(" + Variable(:value) + "," + Variable(:value2) + "," + Variable(:value3) + ")" )
else
	NewStep( StepData(:value5) + " = " +  T_CT_FINDITEM_ST_FIND  + StepData(:value2) +  T_CT_FINDITEM_ST_INLIST + StepData(:value) +  T_CT_FINDITEM_ST_COLUMN + StepData(:value3) +  T_CT_FINDITEM_ST_ATTRIBUTE + StepData(:value4)  )
	SetStepCode( Variable(:value5) + " = find(" + Variable(:value) + "," + Variable(:value2) + "," + Variable(:value3) + "," + Variable(:value4)+ ")" )
}
'
]

	PrepareView()

	func PrepareView
		oView.textQuickScript.setPlaintext(aQuickScripts[1])
		ChangeTemplate()

	func CloseApp
		oView.Close()

	func GenerateCode
		oGenerator = new ComponentWizardGenerator
		oGenerator.setComponentName(oView.textName.text())
		oGenerator.setFolder(oView.textFolder.text())
		oGenerator.setEnglishData(oView.textEnglish.toPlaintext())
		oGenerator.setArabicData(oView.textArabic.toPlaintext())
		oGenerator.setStepsTree(oView.textStepsTree.toPlaintext())
		switch oView.ListTemplate.currentrow() {
			case 1		# Empty File
				oGenerator.EmptyComponentTemplate()
			case 2		# Empty Page
				oGenerator.EmptyPageTemplate()
			case 3		# One Textbox
				oGenerator.OneTextboxTemplate()
			case 4		# Two Textboxes
				oGenerator.TwoTextboxesTemplate()
			case 5		# Three Textboxes
				oGenerator.ThreeTextboxesTemplate()
			case 6		# Four Textboxes
				oGenerator.FourTextboxesTemplate()
			case 7		# Five Textboxes
				oGenerator.FiveTextboxesTemplate()
		}

	func ChangeTemplate
		switch oView.listTemplate.currentrow() {
			case 1		# Empty File
				cText = "Interaction Page - Title" + WindowsNL() +
				"Steps Tree Constants"
			case 2		# Empty Page
				cText = "Interaction Page - Title" + WindowsNL() +
				"Steps Tree Constants"
			case 3		# One Textbox
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Steps Tree Constants"
			case 4		# Two Textboxes
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Second Textbox)" + WindowsNL() +
				"Steps Tree Constants"
			case 5		# Three Textboxes
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Second Textbox)"  + WindowsNL() +
				"Third Label (Third Textbox)"  + WindowsNL() +
				"Steps Tree Constants"
			case 6		# Four Textboxes
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Second Textbox)"  + WindowsNL() +
				"Third Label (Third Textbox)"  + WindowsNL() +
				"Label 4 (Textbox 4)"  + WindowsNL() +
				"Steps Tree Constants"
			case 7		# Five Textboxes
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Second Textbox)"  + WindowsNL() +
				"Third Label (Third Textbox)"  + WindowsNL() +
				"Label 4 (Textbox 4)"  + WindowsNL() +
				"Label 5 (Textbox 5)"  + WindowsNL() +
				"Steps Tree Constants"

		}
		oView.textInfo.setplaintext(cText)

	func ststep
		oView.TextStepsTree.insertplaintext('NewStep()')

	func stparentstep
		oView.TextStepsTree.insertplaintext('NewParentStep()')

	func ststepcode
		oView.TextStepsTree.insertplaintext('SteStepCode("")')

	func ststepdata
		cVar = InputBox("Step Data","Variable :")
		oView.TextStepsTree.insertplaintext('StepData(:'+cVar+')')

	func stvariable
		cVar = InputBox("Step Data","Variable :")
		oView.TextStepsTree.insertplaintext('Variable(:'+cVar+')')

	func stconstant
		cComponent = UPPER(oView.textName.text())
		cVar = UPPER(InputBox("Step Data","Variable :"))
		oView.TextStepsTree.insertplaintext(' T_CT_'+cComponent+'_ST_'+cVar + " ")

	func stga
		oView.TextStepsTree.insertplaintext('oStep = GetActiveStep()')

	func stsa
		oView.TextStepsTree.insertplaintext('SetActiveStep(oStep)')

	func stai
		oView.TextStepsTree.insertplaintext('AllowInteraction()')

	func stcheck
		cVar = InputBox("Step Data","Variable :")
		oView.TextStepsTree.insertplaintext('	if NoValueMsg(:'+cVar+') { return False }')

	func StepData1
		oView.TextStepsTree.insertplaintext('StepData(:value)')

	func VariableValue1
		oView.TextStepsTree.insertplaintext('Variable(:value)')

	func quickScripts
		oView.textQuickScript.setPlaintext(aQuickScripts[oView.ComboQuickScript.CurrentIndex()])

	func UseScript
		oView.textStepsTree.SetPlaintext(oView.textQuickScript.toplaintext())

	func FunctionCall
		cComponent = UPPER(oView.textName.text())
		cFuncName = InputBox("Function Call","Function Name :")
		nParaCount = 0+InputBox("Function Call","Parameters Count :")
		cCode = "NewStep( #{f1}  )" + WindowsNL() +
			"SetStepCode( #{f2} )" + WindowsNL()
		cStepName = ""
		cStepCode  = ""
		# Prepare the Step Name & Step Code
		if nParaCount > 0 {
			cStepName += "StepData(:Value" + (nParaCount+1) + ")"
			cStepName += ' + " = " '
			cStepCode += "Variable(:Value" + (nParaCount+1) + ")"
			cStepCode += ' + " = #{f1}(" '
			cStepCode = substr(cStepCode,"#{f1}",cFuncName)
			for x = 1 to nParaCount {
				if x = 1 { t = " " else t = x }
				cStepName += ' +  T_CT_'+cComponent+
				'_ST_VALUE'+t + " + StepData(:Value" + t + ")"
				cStepCode += " + Variable(:Value" + t + ")"
				if x != nParaCount {
					cStepCode += ' + "," '
				else
					cStepCode += ' + ")" '
				}
			}
		else
			cStepName += "StepData(:Value) + ' = ' "
			cStepName +=  ' +  T_CT_'+cComponent+
				'_ST_VALUE'
			cStepCode += "Variable(:Value) + ' = ' + " + 
				'"' + cFuncName + "()" + '"'
			
		}			
		cCode = substr(cCode,"#{f1}",cStepName)
		cCode = substr(cCode,"#{f2}",cStepCode)
		oView.TextStepsTree.insertplaintext(cCode)
