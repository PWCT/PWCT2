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

	aVariables = []	# List contains the control + variable Name

	func Title cTitle
		oLabel = new qLabel(win) {
			setText(cTitle)
			setFixedHeight(50)
			setStyleSheet("font-size:16pt;color:white;background-color:purple;")
		}
		LayoutAll.AddWidget(oLabel)

	func TextBox cTitle,cVariable
		oLabel = new qLabel(win) {
			setText(cTitle)
			setFixedHeight(50)
			setStyleSheet("font-size:16pt;color:white;background-color:purple;")
		}
		oText = new qLineEdit(win) {
			setFixedHeight(50)
			setStyleSheet("font-size:16pt")
		}
		oLayout = new qHBoxLayout() {
			AddWidget(oLabel) AddWidget(oText)
		}
		LayoutAll.AddLayout(oLayout)
		aVariables + [oText,cVariable,C_INTERACTION_CT_TEXTBOX ]

	func Variable cVariable
		nPos = find(aVariables,cVariable,C_INTERACTION_VL_NAME)
		oObject = aVariables[nPos][C_INTERACTION_VL_OBJECT]
		cValue = NULL
		switch aVariables[nPos][C_INTERACTION_VL_TYPE] {
			case C_INTERACTION_CT_TEXTBOX 
				cValue = oObject.text()
		}
		return cValue
