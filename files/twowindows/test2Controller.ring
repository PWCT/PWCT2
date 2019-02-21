# Form/Window Controller - Source Code File

load "test2View.ring"

import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		open_window(:test2Controller)
		exec()
	}
}

class test2Controller from windowsControllerParent

	oView = new test2View
