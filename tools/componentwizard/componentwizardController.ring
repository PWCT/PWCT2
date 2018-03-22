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
			case 8		# Textbox-Listbox-Textbox
				oGenerator.TextListTextTemplate()
			case 9		# Textbox-Listbox-Textbox-Textbox
				oGenerator.TextListTextTextTemplate()
			case 10		# 6 Textboxes
				oGenerator.SixTextboxesTemplate()
			case 11		# 7 Textboxes
				oGenerator.SevenTextboxesTemplate()
			case 12		# 8 Textboxes
				oGenerator.EightTextboxesTemplate()
			case 13		# 9 Textboxes
				oGenerator.NineTextboxesTemplate()
			case 14		# One Listbox 
				oGenerator.OneListboxTemplate()

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
			case 8		# Textbox - Listbox - Textbox
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Listbox)"  + WindowsNL() +
				"Listbox Items as List"  + WindowsNL() +
				"Third Label (Textbox)"  + WindowsNL() +
				"Steps Tree Constants"
			case 9		# Textbox - Listbox - Textbox - Textbox
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Listbox)"  + WindowsNL() +
				"Listbox Items as List"  + WindowsNL() +
				"Third Label (Textbox)"  + WindowsNL() +
				"Label 4 (Textbox)"  + WindowsNL() +
				"Steps Tree Constants"
			case 10		# 6 Textboxes
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Second Textbox)"  + WindowsNL() +
				"Third Label (Third Textbox)"  + WindowsNL() +
				"Label 4 (Textbox 4)"  + WindowsNL() +
				"Label 5 (Textbox 5)"  + WindowsNL() +
				"Label 6 (Textbox 6)"  + WindowsNL() +
				"Steps Tree Constants"
			case 11		# 7 Textboxes
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Second Textbox)"  + WindowsNL() +
				"Third Label (Third Textbox)"  + WindowsNL() +
				"Label 4 (Textbox 4)"  + WindowsNL() +
				"Label 5 (Textbox 5)"  + WindowsNL() +
				"Label 6 (Textbox 6)"  + WindowsNL() +
				"Label 7 (Textbox 7)"  + WindowsNL() +
				"Steps Tree Constants"
			case 12		# 8 Textboxes
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Second Textbox)"  + WindowsNL() +
				"Third Label (Third Textbox)"  + WindowsNL() +
				"Label 4 (Textbox 4)"  + WindowsNL() +
				"Label 5 (Textbox 5)"  + WindowsNL() +
				"Label 6 (Textbox 6)"  + WindowsNL() +
				"Label 7 (Textbox 7)"  + WindowsNL() +
				"Label 8 (Textbox 8)"  + WindowsNL() +
				"Steps Tree Constants"
			case 13		# 9 Textboxes
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Second Textbox)"  + WindowsNL() +
				"Third Label (Third Textbox)"  + WindowsNL() +
				"Label 4 (Textbox 4)"  + WindowsNL() +
				"Label 5 (Textbox 5)"  + WindowsNL() +
				"Label 6 (Textbox 6)"  + WindowsNL() +
				"Label 7 (Textbox 7)"  + WindowsNL() +
				"Label 8 (Textbox 8)"  + WindowsNL() +
				"Label 9 (Textbox 9)"  + WindowsNL() +
				"Steps Tree Constants"
			case 14		# One Listbox 
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (Listbox)"  + WindowsNL() +
				"Listbox Items as List"  + WindowsNL() +
				"Steps Tree Constants"


		}
		oView.textInfo.setplaintext(cText)

	func ststep
		oView.TextStepsTree.insertplaintext('NewStep()')

	func stparentstep
		oView.TextStepsTree.insertplaintext('NewParentStep()')

	func ststepcode
		oView.TextStepsTree.insertplaintext('SetStepCode("")')

	func ststepdata
		cVar = InputBox("Step Data","Variable :")
		oView.TextStepsTree.insertplaintext('StepData(:'+cVar+')')

	func stvariable
		cVar = InputBox("Step Data","Variable :")
		oView.TextStepsTree.insertplaintext('Variable(:'+cVar+')')

	func stconstant
		cComponent = UPPER(oView.textName.text())
		cVar = UPPER(InputBox("Define Constant","Name :"))
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

	func FunctionsListbox
		cComponent = UPPER(oView.textName.text())
		nFuncCount = 0+InputBox("Functions List","Functions Count :")
		cCode = `
		switch Variable(:Value2) {
			#{f1}
		}

		NewStep( StepData(:Value3) + " = "  +  T_CT_#{f2}_ST_VALUE  +
			 StepData(:Value ) +  T_CT_#{f2}_ST_VALUE2 + 
			StyleData(T_CT_#{f2}_IP_VALUE2LIST[Variable(:Value2)])  )
		SetStepCode( Variable(:Value3) + " = "+cFunc+"("  + Variable(:Value ) + ")"  )
		`
		cStr = windowsnl()
		for x = 1 to nFuncCount {
			cStr += copy(char(9),3)+'case '+x+' cFunc = "" ' + windowsnl()
		}
		cCode = substr(cCode,"#{f1}",cStr)
		cCode = substr(cCode,"#{f2}",cComponent)
		oView.TextStepsTree.insertplaintext(cCode)

	func ClearData
		oView {
			textName.setText("")
			ListTemplate.setcurrentrow(4,3)
			textEnglish.setplaintext(" Component")
			textArabic.setplaintext("مكون ")
			textStepsTree.setplaintext("")
			comboQuickScript.setCurrentIndex(1)
		}

	func FunctionCallNoOutput
		cComponent = UPPER(oView.textName.text())
		cFuncName = InputBox("Function Call","Function Name :")
		nParaCount = 0+InputBox("Function Call","Parameters Count :")
		cCode = "NewStep( #{f1}  )" + WindowsNL() +
			"SetStepCode( #{f2} )" + WindowsNL()
		cStepName = ""
		cStepCode  = ""
		# Prepare the Step Name & Step Code
		if nParaCount > 0 {
			cStepCode += ' "#{f1}(" '
			cStepCode = substr(cStepCode,"#{f1}",cFuncName)
			for x = 1 to nParaCount {
				if x = 1 { t = " " else t = x }
				if x != 1 {
					cStepName += ' +  '
				}
				cStepName += 'T_CT_'+cComponent+
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

	func ClassMethodsListbox
		cComponent = UPPER(oView.textName.text())
		nFuncCount = 0+InputBox("Class Methods List","Methods Count :")
		cCode = `
		switch Variable(:Value2) {
			#{f1}
		}

		# Get the function Name 
			cFuncName = T_CT_#{f2}_IP_VALUE2LIST [Variable(:Value2)]

		# Generate Step and Code using common method 
			common_callobjectmethod(cFunc,cFuncName)
		`
		cStr = windowsnl()
		for x = 1 to nFuncCount {
			cStr += copy(char(9),3)+'case '+x+' cFunc = "" ' + windowsnl()
		}
		cCode = substr(cCode,"#{f1}",cStr)
		cCode = substr(cCode,"#{f2}",cComponent)
		oView.TextStepsTree.insertplaintext(cCode)
		cEnglishText = "Class Component
Object
Method
[#{f1}]
Parameters
Output"

		cArabicText = "مكون فئة ال 
اسم الكائن :
الميثود : 
[#{f1}]
المعطيات :
الناتج :"
		cStr = ""
		for x = 1 to nFuncCount {
			if x != 1 { cStr += "," }
			cStr += '""'
		}
		cEnglishText = substr(cEnglishText,"#{f1}",cStr)
		cArabicText  = substr(cArabicText, "#{f1}",cStr)
		oView.textEnglish.setplaintext(cEnglishText)
		oView.textArabic.setplaintext(cArabicText)
