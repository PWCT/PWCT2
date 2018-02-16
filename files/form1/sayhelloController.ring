# Form/Window Controller - Source Code File

load "sayhelloView.ring"

import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		open_window(:sayhelloController)
		exec()
	}
}

class sayhelloController from windowsControllerParent

	oView = new sayhelloView
