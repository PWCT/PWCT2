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

	func CloseApp
		oView.Close()

	func GenerateCode
		oGenerator = new ComponentWizardGenerator 
		oGenerator.setComponentName(oView.textName.text())
		oGenerator.setFolder(oView.textFolder.text())
		oGenerator.setEnglishData(oView.textEnglish.toPlaintext())
		oGenerator.setArabicData(oView.textArabic.toPlaintext())
		nTemplate = oView.ListTemplate.currentrow()
		switch nTemplate {
			case 1		# Empty File 
				oGenerator.EmptyComponentTemplate()
			case 2		# Empty Page
				oGenerator.EmptyPageTemplate()
			case 3		# One Textbox
			case 4		# Two Textboxes
			case 5		# Three Textboxes
		}

	func ChangeTemplate
		
	func ststep

	func stparentstep

	func ststepcode

	func ststepdata

	func stvariable

	func stconstant

	func stga

	func stsa

	func stai

	func stcheck

	func quickScripts
		oView.textQuickScript.setPlaintext(aQuickScripts[oView.ComboQuickScript.CurrentIndex()])	
