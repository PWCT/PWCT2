# Form/Window Controller - Source Code File

load "vsfgeneratorView.ring"
load "../generator.ring"

import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		open_window(:vsfgeneratorController)
		exec()
	}
}

class vsfgeneratorController from windowsControllerParent

	oView = new vsfgeneratorView

	func Generate 
		new VSFGenerator {
			startGenerator()
		}
		msginfo("Generator","Operation Done!")
