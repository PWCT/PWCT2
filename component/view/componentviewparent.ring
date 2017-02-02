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
		setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 
		oLayoutAll = new qVBoxLayout() 
		SetLayout(oLayoutAll)
		oWinFilter = new qallevents(win)
		oWinFilter.setKeyPressEvent(Method(:KeyPressAction))								
		installeventfilter(oWinFilter)
	}

	aVariables = []	# List contains the control + variable Name

	func Title cTitle
		oLabel = new qLabel(win) {
			setText(cTitle)
			setFixedHeight(50)
			setStyleSheet("font-size:16pt;color:white;background-color:purple;")
			setalignment(Qt_AlignHCenter |  Qt_AlignVCenter )
		}
		oLayoutAll.AddWidget(oLabel)

	func TextBox cTitle,cVariable
		oLabel = new qLabel(win) {
			setText(cTitle)
			setFixedHeight(40)
			setStyleSheet("font-size:16pt;")
		}
		oText = new qLineEdit(win) {
			setFixedHeight(40)
			setStyleSheet("font-size:16pt")
		}
		oLayout = new qHBoxLayout() {
			AddWidget(oLabel) AddWidget(oText)
		}
		oLayoutAll.AddLayout(oLayout)
		aVariables + [oText,cVariable,C_INTERACTION_CT_TEXTBOX ]

	func PageButtons
		oBtnAgain = new qPushButton(win) {
			setText("Again")
			setClickEvent( Method(:AgainAction) )
		}
		oBtnOk = new qPushButton(win) {
			setText("Ok")
			setClickEvent( Method(:OkAction) )
		}
		oBtnClose = new qPushButton(win) {
			setText("Cancel")
			setClickEvent( Method(:CloseAction) )
		}
		oLayoutButtons = new qHBoxLayout() {
			AddWidget(oBtnAgain) AddWidget(oBtnOk) AddWidget(oBtnClose)
		}
	 	oLayoutAll.AddLayout(oLayoutButtons)


	func Variable cVariable
		nPos = find(aVariables,cVariable,C_INTERACTION_VL_NAME)
		oObject = aVariables[nPos][C_INTERACTION_VL_OBJECT]
		cValue = NULL
		switch aVariables[nPos][C_INTERACTION_VL_TYPE] {
			case C_INTERACTION_CT_TEXTBOX 
				cValue = oObject.text()
		}
		return cValue
