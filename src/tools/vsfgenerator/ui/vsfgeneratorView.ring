# Form/Window View - Generated Source Code File 
# Generated by the Ring 1.13 Form Designer
# Date : 09/10/2020
# Time : 17:29:18

Load "stdlibcore.ring"
Load "guilib.ring"

import System.GUI

if IsMainSourceFile() { 
	new App {
		StyleFusion()
		new vsfgeneratorView { win.show() } 
		exec()
	}
}

class vsfgeneratorView from WindowsViewParent
	win = new MainWindow() { 
		move(41,48)
		resize(695,590)
		setWindowTitle("Visual Source File Generator")
		setstylesheet("background-color:;") 

		setWindowFlags(Qt_Window | Qt_WindowTitleHint | Qt_WindowSystemMenuHint | Qt_WindowCloseButtonHint) 
		Button1 = new pushbutton(win) {
			move(474,36)
			resize(186,41)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("Arial")
			setfont(oFont)
			oFont.delete()
			setText("Generate")
			setClickEvent(Method(:generate))
			setBtnImage(Button1,"")
			
		}
	}

# End of the Generated Source Code File...