# Form/Window Controller - Source Code File

load "quickmsgView.ring"

import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		open_windowNoShow(:quickmsgController)
		last_window().setText("Please Wait...")
		last_window().start()
		exec()
	}
}

class quickmsgController from windowsControllerParent

	oView = new quickmsgView
	cMessage = "Loading..."

	oDesktop = new qDesktopwidget() 
	CenterTheWindow()

	func setText cText 
		cMessage = cText
		oView.oMsg.setText(cMessage)		

	func Text 
		return cMessage 

	func CenterTheWindow 
		nWindowWidth  = oView.win.width()
		nWindowHeight = oView.win.height()
		oView.win.move((oDesktop.width()-nWindowWidth)/2,(oDesktop.height()-nWindowHeight)/2)

	func CloseMsg
		oView.win.close()
	
