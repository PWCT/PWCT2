/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Component View Parent Class
**	Date : 2017.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentViewParent from WindowsViewParent

	win = new qWidget() {
		resize(600,10)
		setWindowTitle("Interation Window")
		LayoutAll = new qVBoxLayout() 
		SetLayout(LayoutAll)
		oWinFilter = new qallevents(win)
		oWinFilter.setKeyPressEvent(Method(:KeyPressAction))								
		installeventfilter(oWinFilter)
	}

	func AddTitle cTitle
		oLabel = new qLabel(win) {
			setText(cTitle)
			setFixedHeight(50)
			setStyleSheet("font-size:16pt;color:white;background-color:purple;")
		}
		LayoutAll.AddWidget(oLabel)
