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

	func CloseApp
		oView.Close()

	func GenerateCode
		oGenerator = new ComponentWizardGenerator 
		oGenerator.setComponentName(oView.textName.text())
		oGenerator.setFolder(oView.textFolder.text())
		nTemplate = oView.ListTemplate.currentrow()
		switch nTemplate {
			case 1		# Empty File 
				oGenerator.EmptyComponentTemplate()
			case 2		# Empty Page
			case 3		# One Textbox
			case 4		# Two Textboxes
			case 5		# Three Textboxes
		}

	func ChangeTemplate
		
