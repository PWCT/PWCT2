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
SetStepCode( "" )',
'NewParentStep(  )
	SetStepCode( "" )
	AllowInteraction()
	NewStep( T_CT_XXX_ST_STARTHERE )
	oStep = GetActiveStep()
	SetActiveStep(oStep)
',
'NewParentStep(  )
	SetStepCode( "" )
	AllowInteraction()
	NewStep( T_CT_XXX_ST_STARTHERE )
	oStep = GetActiveStep()
	NewStep( T_CT_XXX_ST_END )
		SetStepCode( "" )
	SetActiveStep(oStep)
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

	func quickScripts
		oView.textQuickScript.setPlaintext(aQuickScripts[oView.ComboQuickScript.CurrentIndex()])	
