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
		CenterTheWindow()
		RefreshTheWindow()

	func Text 
		return cMessage 

	func CenterTheWindow 
		nWindowWidth  = oView.win.width()
		nWindowHeight = oView.win.height()
		oView.win.move((oDesktop.width()-nWindowWidth)/2,(oDesktop.height()-nWindowHeight)/2)

	func RefreshTheWindow 
		oView.win.show()
		PWCT_APP.processevents()

	func RefreshSize 
		oView.win.resize(nWindowWidth,nWindowHeight)

	func Show 
		RefreshSize()
		if C_ENV_DEFAULT_STYLE <=4 {
			oView.oMsg.setstylesheet("color:#00007f;background-color:#ffebdc;")
		elseif C_ENV_DEFAULT_STYLE <= 8 
			oView.oMsg.setstylesheet("color:#ffffff;background-color:#000000;")
		else 
			oView.oMsg.setstylesheet("color:#000000;background-color:#ffffff;")
		}
		oView.win.show()

	func Hide 
		/*
			We tried the next code to do correct hide 
			And restore the original dimension of the window 
			And the label (After we display multi-lines/large message)
			But this doesn't work! (Maybe a Qt bug! in Layout Code)
				cMessage = ""
				oView.oMsg.setText("")	
				oView.oMsg.resize(10,10)
				nWindowWidth  = 650
				nWindowHeight = 48
				oView.win.resize(nWindowWidth,nWindowHeight)
				PWCT_APP.processevents()
				oView.win.hide()
			So we decided to close the window and create another object
		*/
		oView.win.close()
		oView = new quickmsgView

	func CloseMsg
		oView.win.close()
	

