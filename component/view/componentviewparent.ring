/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Component View Parent Class
**	Date : 2017.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentViewParent from WindowsViewParent

	win = new qWidget() {
		setLayoutDirection(T_LAYOUTDIRECTION)
		resize(300,10)
		setWindowTitle(T_IP_WINDOWTITLE) # "Interation Window"
		setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 
		oLayoutAll = new qVBoxLayout() 
		SetLayout(oLayoutAll)
		oWinFilter = new qallevents(win)
		oWinFilter.setKeyPressEvent(Method(:KeyPressAction))								
		installeventfilter(oWinFilter)
	}

	aVariables = []	# List contains the [ Control Object , variable Name , Type ]

	lFirstTextBox = True 	# For Setting the focus
	oFirstText			# First Textbox

	/*
		Purpose : Display title in the Interaction Page
		Parameters : The Title as String
		Output : The Label Object
	*/

	func Title cTitle
		
		oLabel = new qLabel(win) {
			setText(cTitle)
			setFixedHeight(20)
			setStyleSheet("font-size:10pt;color:white;background-color:purple;")
			setalignment(Qt_AlignHCenter |  Qt_AlignVCenter )
		}
		oLayoutAll.AddWidget(oLabel)
		
		win.setWindowTitle(cTitle)
		return oLabel

	/*
		Purpose : Display Label+Textbox in the Interation page
		Parameters : The Label Title and the Variable Name
		Output : The Textbox Object
	*/

	func TextBox cTitle,cVariable
		oLabel = new qLabel(win) {
			setText(cTitle)
		}
		oText = new qLineEdit(win) {
			if this.lFirstTextBox {
				this.lFirstTextBox = False
				setFocus(0)
				this.oFirstText = oText
			}
		}
		oLayout = new qHBoxLayout() {
			AddWidget(oLabel) AddWidget(oText)
		}
		oLayoutAll.AddLayout(oLayout)
		aVariables + [oText,cVariable,C_INTERACTION_CT_TEXTBOX ]
		return oText

	/*
		Purpose : Display Checkbox in the Interation page
		Parameters : The Checkbox Title and the Variable Name
		Output : The Checkbox Object
	*/

	func CheckBox cText,cVariable
		oCheck = new qCheckBox(win) {
			setText(cText)
		}
		oLayout = new qHBoxLayout() {
			AddWidget(oCheck)
		}
		oLayoutAll.AddLayout(oLayout)
		aVariables + [oCheck,cVariable,C_INTERACTION_CT_CHECKBOX ]
		return oCheck

	/*
		Purpose : Add Label+ListBox in the interaction page
		Parameters : The label title, the variable name and the Listbox items
		Output : the listbox object
	*/

	func ListBox cTitle,cVariable,aItems
		oLabel = new qLabel(win) {
			setText(cTitle)
		}
		oList = new qListWidget(win) {
			#setStyleSheet("font-size:14pt")
			for item in aItems {		
				AddItem(Item)
			}
			setCurrentRow(0,3)
		}
		oLayout = new qHBoxLayout() {
			AddWidget(oLabel) AddWidget(oList)
		}
		oLayoutAll.AddLayout(oLayout)
		aVariables + [oList,cVariable,C_INTERACTION_CT_LISTBOX ]
		return oList

	/*
		Purpose : Add the page buttons (Ok, Again and Close) to the interaction page
		Parameters : None
		Output : None
	*/

	func PageButtons
		oBtnAgain = new qPushButton(win) {
			setText(T_IP_AGAIN)	# "Again"
			setClickEvent( Method(:AgainAction) )
		}
		setBtnImage(oBtnAgain,"images/ipagain.png")
		oBtnOk = new qPushButton(win) {
			setText(T_IP_OK)		# "Ok"
			setClickEvent( Method(:OkAction) )
		}
		setBtnImage(oBtnOk,"images/ipok.png")
		oBtnClose = new qPushButton(win) {
			setText(T_IP_CLOSE)    # "Close"
			setClickEvent( Method(:CloseBtnAction) )
		}
		setBtnImage(oBtnClose,"images/ipclose.png")
		oLayoutButtons = new qHBoxLayout() {
			AddWidget(oBtnAgain) AddWidget(oBtnOk) AddWidget(oBtnClose)
		}
	 	oLayoutAll.AddLayout(oLayoutButtons)
		oLayoutAll.insertStretch( -1, 1 )

	/*
		Purpose : Get Variable Value from the Interaction page
		Parameters : The Variable name as string
		Output : The variable value
	*/

	func Variable cVariable
		nPos = find(aVariables,cVariable,C_INTERACTION_VL_NAME)
		oObject = aVariables[nPos][C_INTERACTION_VL_OBJECT]
		cValue = NULL
		switch aVariables[nPos][C_INTERACTION_VL_TYPE] {
			case C_INTERACTION_CT_TEXTBOX 
				cValue = oObject.text()
			case C_INTERACTION_CT_CHECKBOX 
				cValue = oObject.checkstate()
			case C_INTERACTION_CT_LISTBOX 
				cValue = oObject.currentrow() + 1
		}
		return cValue

	/*
		Purpose : Get Interaction page variables values as string
		Parameters : None
		Output : String of varaibles values 
	*/

	func GetVariablesValues
		cVariablesValues = ""
		for item in aVariables {
			oObject = item[C_INTERACTION_VL_OBJECT]
			switch item[C_INTERACTION_VL_TYPE] {
			case C_INTERACTION_CT_TEXTBOX 
				cValue = oObject.text()
			case C_INTERACTION_CT_CHECKBOX 
				cValue = "" + oObject.checkstate()
			case C_INTERACTION_CT_LISTBOX 
				cValue = "" + (oObject.currentrow() + 1)
			}
			cVariablesValues += cValue + C_INTERACTIONVALUES_SEPARATOR
		}
		return cVariablesValues

	/*
		Purpose : Set the Interaction Page Variables Values
		Parameters : Variables Values as String
		Output : None
	*/

	func SetVariablesValues cVariablesValues
		aValues = Split(cVariablesValues,C_INTERACTIONVALUES_SEPARATOR)
		for x = 1 to len( aVariables ) {
			item = aVariables[x]
			oObject = item[C_INTERACTION_VL_OBJECT]
			switch item[C_INTERACTION_VL_TYPE] {
			case C_INTERACTION_CT_TEXTBOX 
				oObject.settext(aValues[x])
			case C_INTERACTION_CT_CHECKBOX
				oObject.setcheckstate(0+aValues[x])
			case C_INTERACTION_CT_LISTBOX 
				oObject.setcurrentrow((0+aValues[x])-1,2 | dec("10"))
			}
		}

 
