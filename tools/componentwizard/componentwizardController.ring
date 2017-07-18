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
'NewStep( "" ) 
SetStepCode("" )',
'NewParentStep("" )
	SetStepCode("" )
	AllowInteraction()
	NewStep(T_CT_XXX_ST_STARTHERE)
	oStep = GetActiveStep()
	SetActiveStep(oStep)
',
'NewParentStep("" )
	SetStepCode("" )
	AllowInteraction()
	NewStep(T_CT_XXX_ST_STARTHERE)
	oStep = GetActiveStep()
	NewStep(T_CT_XXX_ST_END)
		SetStepCode("")
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
		switch oView.ListTemplate.currentrow() {
			case 1		# Empty File 
				oGenerator.EmptyComponentTemplate()
			case 2		# Empty Page
				oGenerator.EmptyPageTemplate()
			case 3		# One Textbox
			case 4		# Two Textboxes
			case 5		# Three Textboxes
		}

	func ChangeTemplate
		switch oView.listTemplate.currentrow() {
			case 1		# Empty File 
				cText = "Interaction Page - Title"
			case 2		# Empty Page
				cText = "Interaction Page - Title"
			case 3		# One Textbox
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" 
			case 4		# Two Textboxes
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Second Textbox)" 
			case 5		# Three Textboxes
				cText = "Interaction Page - Title" + WindowsNL() +
				"First Label (First Textbox)" + WindowsNL() +
				"Second Label (Second Textbox)"  + WindowsNL() +
				"Third Label (Third Textbox)"  
		}		
		oView.textInfo.setplaintext(cText)

	func ststep
		oView.TextStepsTree.insertplaintext('NewStep("")')		

	func stparentstep
		oView.TextStepsTree.insertplaintext('NewParentStep("")')		

	func ststepcode
		oView.TextStepsTree.insertplaintext('SteStepCode("")')		

	func ststepdata
		oView.TextStepsTree.insertplaintext('StepData(:xxx)')		

	func stvariable
		oView.TextStepsTree.insertplaintext('Variable(:xxx)')		

	func stconstant
		oView.TextStepsTree.insertplaintext('T_CT_XXX_ST_')		

	func stga
		oView.TextStepsTree.insertplaintext('oStep = GetActiveStep()')		

	func stsa
		oView.TextStepsTree.insertplaintext('SetActiveStep(oStep)')		

	func stai
		oView.TextStepsTree.insertplaintext('AllowInteraction()')		

	func stcheck
		oView.TextStepsTree.insertplaintext('	if NoValueMsg(:XXX) { return False }')		

	func quickScripts
		oView.textQuickScript.setPlaintext(aQuickScripts[oView.ComboQuickScript.CurrentIndex()])	
