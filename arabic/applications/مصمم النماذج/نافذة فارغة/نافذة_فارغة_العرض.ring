# Form/Window View - Generated Source Code File 
# Generated by the Ring 1.23 Form Designer
# Date : 22/04/2025
# Time : 02:10:40

Load "stdlibcore.ring"
Load "guilib.ring"

import System.GUI

if IsMainSourceFile() { 
	new App {
		StyleFusion()
		new نافذة_فارغةView { win.show() } 
		exec()
	}
}

class نافذة_فارغةView from WindowsViewParent
	win = new MainWindow() { 
		resize(504,471)
		setWindowTitle("السلام عليكم ورحمة الله وبركاته")
		setstylesheet("background-color:#55007f;") 
	}

# End of the Generated Source Code File...