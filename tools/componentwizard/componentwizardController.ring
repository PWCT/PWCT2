# Form/Window Controller - Source Code File

load "componentwizardView.ring"

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
