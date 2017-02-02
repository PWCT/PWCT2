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

	aVariables = []	# List contains the [ Control Object , variable Name , Type ]

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
			setStyleSheet("font-size:14pt;color:white;background-color:purple;")
		}
		oText = new qLineEdit(win) {
			setStyleSheet("font-size:14pt")
		}
		oLayout = new qHBoxLayout() {
			AddWidget(oLabel) AddWidget(oText)
		}
		oLayoutAll.AddLayout(oLayout)
		aVariables + [oText,cVariable,C_INTERACTION_CT_TEXTBOX ]

	func ListBox cTitle,cVariable,aItems
		oLabel = new qLabel(win) {
			setText(cTitle)
			setStyleSheet("font-size:14pt;color:white;background-color:purple;")
		}
		oList = new qListWidget(win) {
			setStyleSheet("font-size:14pt")
			for item in aItems {		
				AddItem(Item)
			}
			setCurrentRow(0,2)
		}
		oLayout = new qHBoxLayout() {
			AddWidget(oLabel) AddWidget(oList)
		}
		oLayoutAll.AddLayout(oLayout)
		aVariables + [oList,cVariable,C_INTERACTION_CT_LISTBOX ]

	func PageButtons
		oBtnAgain = new qPushButton(win) {
			setText(T_IP_AGAIN)	# "Again"
			setClickEvent( Method(:AgainAction) )
		}
		oBtnOk = new qPushButton(win) {
			setText(T_IP_OK)		# "Ok"
			setClickEvent( Method(:OkAction) )
		}
		oBtnClose = new qPushButton(win) {
			setText(T_IP_CLOSE)    # "Close"
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
			case C_INTERACTION_CT_LISTBOX 
				cValue = oObject.currentrow() + 1
		}
		return cValue

	func GetVariablesValues
		cVariablesValues = ""
		for item in aVariables {
			oObject = item[C_INTERACTION_VL_OBJECT]
			switch item[C_INTERACTION_VL_TYPE] {
			case C_INTERACTION_CT_TEXTBOX 
				cValue = oObject.text()
			case C_INTERACTION_CT_LISTBOX 
				cValue = "" + (oObject.currentrow() + 1)
			}
			cVariablesValues += cValue + C_INTERACTIONVALUES_SEPARATOR
		}
		return cVariablesValues

	func SetVariablesValues cVariablesValues
		aValues = Split(cVariablesValues,C_INTERACTIONVALUES_SEPARATOR)
		for x = 1 to len( aVariables ) {
			item = aVariables[x]
			oObject = item[C_INTERACTION_VL_OBJECT]
			switch item[C_INTERACTION_VL_TYPE] {
			case C_INTERACTION_CT_TEXTBOX 
				oObject.settext(aValues[x])
			case C_INTERACTION_CT_LISTBOX 
				oObject.setcurrentrow((0+aValues[x])-1,2)
			}
		}
