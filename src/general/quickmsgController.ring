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

	nWindowWidth nWindowHeight

	oDesktop = new qDesktopwidget() 
	CenterTheWindow()

	func setText cText 
		cMessage = cText
		oView.oMsg.setText(cMessage)	
		oView.win.move((oDesktop.width()-nWindowWidth)/2,(oDesktop.height()-nWindowHeight)/2)

	func Text 
		return cMessage 

	func CenterTheWindow 
		nWindowWidth  = oView.win.width()
		nWindowHeight = oView.win.height()
		oView.win.move((oDesktop.width()-nWindowWidth)/2,(oDesktop.height()-nWindowHeight)/2)

	func RefreshSize 
		oView.win.resize(nWindowWidth,nWindowHeight)

	func Show 
		RefreshSize()
		oView.win.show()

	func Hide 
		oView.win.hide()
		RefreshSize()

	func CloseMsg
		oView.win.close()
	

