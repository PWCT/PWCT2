/*
**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose 	: Component View Parent Class
**	Date 		: 2017.02.01
**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
*/

C_COMPONENT_CONTROLSFONTSIZE = 16

class ComponentViewParent from WindowsViewParent

	aVariables = []		# List contains the [ Control Object , variable Name , Type ]

	lFirstTextBox = True 	# For Setting the focus
	oFirstText		# First Textbox

	nTitleFontSize 		= 18
	nTitleFixedHeight 	= 40
	nControlsFontSize	= C_COMPONENT_CONTROLSFONTSIZE
	nButtonsFontSize	= 12

	nWindowWidth		= 300
	nWindowHeight		= 200

	cssText    = "border:1px solid black;border-radius:7px;"

	win = new QWidget() {
		resize(nWindowWidth,nWindowHeight)
		setLayoutDirection(T_LAYOUTDIRECTION)
		setWindowTitle(T_IP_WINDOWTITLE) # "Interation Window"
		setWindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 
		oLayoutAll = new QVBoxLayout() 
		SetLayout(oLayoutAll)
		oWinFilter = new QAllEvents(win)
		oWinFilter.setKeyPressEvent(Method(:KeyPressAction))								
		installEventFilter(oWinFilter)
	}

	oDesktop = new qDesktopwidget() 
	CenterTheWindow()

	/*
		Center the window
	*/
	
	func CenterTheWindow 
		win.move((oDesktop.width()-nWindowWidth)/2,(oDesktop.height()-nWindowHeight)/2)
		win.resize(nWindowWidth,nWindowHeight)

	/*
		Purpose : Display title in the Interaction Page
		Parameters : The Title as String
		Output : The Label Object
	*/

	func Title cTitle
		
		oLabel = new qLabel(win) {
			setText(cTitle)
			if PWCTisMobile(:IPTitle) {
				setFixedHeight(this.nTitleFixedHeight*3)
			else
				setFixedHeight(this.nTitleFixedHeight)
			}
			setStyleSheet("font-size:"+this.nTitleFontSize+
				"pt;color:"+C_INTERACTIONPAGE_TITLECOLOR+
				";background-color:"+C_INTERACTIONPAGE_TITLEBACKCOLOR+";")
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
			setStyleSheet("font-size:"+this.nControlsFontSize+"pt;")
		}
		oText = new qLineEdit(win) {
			setStyleSheet(this.cssText+"font-size:"+this.nControlsFontSize+"pt;")
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
		Textbox with init. value 
	*/
	func TextBoxValue cTitle,cVariable,cValue 
		oText = Textbox(cTitle,cVariable) {
			setStyleSheet(this.cssText+"font-size:"+this.nControlsFontSize+"pt;")
			setText(cValue)
		}
		return oText

	/*
		Purpose : Display Checkbox in the Interation page
		Parameters : The Checkbox Title and the Variable Name
		Output : The Checkbox Object
	*/

	func CheckBox cText,cVariable
		oCheck = new qCheckBox(win) {
			setStyleSheet("font-size:"+this.nControlsFontSize+"pt;")
			setText(cText)
		}
		oLayout = new qHBoxLayout() {
			AddWidget(oCheck)
		}
		oLayoutAll.AddLayout(oLayout)
		aVariables + [oCheck,cVariable,C_INTERACTION_CT_CHECKBOX ]
		return oCheck

	/*
		Purpose : Display Checkbox and Textbox
		Parameters : The Title and the Variable Name
		Output : list [The Checkbox Object,The ListBox Object]
	*/

	func CheckBoxTextBox cText,cVariable
		oCheck = new qCheckBox(win) {
			setStyleSheet("font-size:"+this.nControlsFontSize+"pt;")
			setText(cText)
		}
		oText = new qLineEdit(win) {
			setStyleSheet(this.cssText+"font-size:"+this.nControlsFontSize+"pt;")
			if this.lFirstTextBox {
				this.lFirstTextBox = False
				setFocus(0)
				this.oFirstText = oText
			}
		}
		oLayout = new qHBoxLayout() {
			AddWidget(oCheck)
			AddWidget(oText)
		}
		oLayoutAll.AddLayout(oLayout)
		aVariables + [oCheck,"l"+cVariable,C_INTERACTION_CT_CHECKBOX ]
		aVariables + [oText,cVariable,C_INTERACTION_CT_TEXTBOX ]
		return [oCheck,oText]
		


	/*
		Purpose : Add Label+ListBox in the interaction page
		Parameters : The label title, the variable name and the Listbox items
		Output : the listbox object
	*/

	func ListBox cTitle,cVariable,aItems
		oLabel = new qLabel(win) {
			setStyleSheet("font-size:"+this.nControlsFontSize+"pt;")
			setText(cTitle)
		}
		oList = new qListWidget(win) {
			setStyleSheet("font-size:"+this.nControlsFontSize+"pt;")
			for item in aItems {		
				AddItem(Item)
			}
			setCurrentRow(0,3)
			setminimumwidth(250)
			setminimumheight(100)			
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
			setStyleSheet("font-size:"+this.nButtonsFontSize+"pt;")
			setText(T_IP_AGAIN)	# "Again"
			setClickEvent( Method(:AgainAction) )
			this.MobileButtonSize(self)
		}
		oBtnOk = new qPushButton(win) {
			setStyleSheet("font-size:"+this.nButtonsFontSize+"pt;")
			setText(T_IP_OK)		# "Ok"
			setClickEvent( Method(:OkAction) )
			this.MobileButtonSize(self)
		}
		oBtnClose = new qPushButton(win) {
			setStyleSheet("font-size:"+this.nButtonsFontSize+"pt;")
			setText(T_IP_CLOSE)    # "Close"
			setClickEvent( Method(:CloseBtnAction) )
			this.MobileButtonSize(self)
		}
		if not T_LAYOUTDIRECTION {
			setBtnImage(oBtnAgain,AppFile("images/ipagain.png"))
			setBtnImage(oBtnOk,AppFile("images/ipok.png"))
			setBtnImage(oBtnClose,AppFile("images/ipclose.png"))
		}
		oLayoutButtons = new qHBoxLayout() {
			AddWidget(oBtnAgain) AddWidget(oBtnOk) AddWidget(oBtnClose)
		}
	 	oLayoutAll.AddLayout(oLayoutButtons)
		if C_PROPERTIES_REMOVEVERTICALSPACESBETWEENCONTROLSININTERACTIONPAGES {
			oLayoutAll.insertStretch( -1, 1 )
		}

	func MobileButtonSize oButton
		oButton {
			if PWCTIsMobile(:ComponentsButtonsSize) {
				setMinimumHeight(150)
			}
		}

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
			cVariablesValues += 
				item[C_INTERACTION_VL_NAME] + C_INTERACTIONVALUES_SEPARATOR +
				cValue + C_INTERACTIONVALUES_SEPARATOR
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
			if len(aValues) = len(aVariables) {
				# Support old files that doesn't store the variable name
				cValue = aValues[x]
			else 
				cValue = GetVariableValue(aValues,item[C_INTERACTION_VL_NAME])
			}
			oObject = item[C_INTERACTION_VL_OBJECT]
			switch item[C_INTERACTION_VL_TYPE] {
			case C_INTERACTION_CT_TEXTBOX 
				oObject.settext(cValue)
			case C_INTERACTION_CT_CHECKBOX
				oObject.setcheckstate(0+cValue)
			case C_INTERACTION_CT_LISTBOX 
				oObject.setcurrentrow((0+cValue)-1,2 | dec("10"))
			}
		}

	func GetVariableValue aValues,cName
 		nPos = find(aValues,cName)
		if nPos {
			return aValues[nPos+1]
		}