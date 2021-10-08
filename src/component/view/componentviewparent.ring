/*
**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose 	: Component View Parent Class
**	Date 		: 2017.02.01
**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
*/

C_COMPONENT_CONTROLSFONTSIZE = 12

class ComponentViewParent from WindowsViewParent

	aVariables = []		# List contains the [ Control Object , variable Name , Type ]

	oTitleLabel

	lFirstTextBox		= True		# For Setting the focus
	oFirstText				# First Textbox

	lEnableListBoxSort	= True 		# Sort ListBox Items

	nTitleFontSize 		= C_COMPONENT_CONTROLSFONTSIZE 
	nTitleFixedHeight 	= C_COMPONENT_CONTROLSFONTSIZE * 2.5
	nControlsFontSize	= C_COMPONENT_CONTROLSFONTSIZE
	nButtonsFontSize	= max(C_COMPONENT_CONTROLSFONTSIZE - 2,9)

	nWindowWidth		= 300
	nWindowHeight		= 100

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
		nWindowWidth		= win.width()
		nWindowHeight		= win.height()
		win.move((oDesktop.width()-nWindowWidth)/2,(oDesktop.height()-nWindowHeight)/2)
		win.resize(nWindowWidth,nWindowHeight)

	/*
		Purpose : Display title in the Interaction Page
		Parameters : The Title as String
		Output : The Label Object
	*/

	func Title cTitle
		
		oTitleLabel = new qLabel(win) {
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
		oLayoutAll.AddWidget(oTitleLabel) 
		win.setWindowTitle(cTitle)
		return oTitleLabel

	func setTitleColors
		oTitleLabel {
			setStyleSheet("font-size:"+this.nTitleFontSize+
				"pt;color:"+C_INTERACTIONPAGE_TITLECOLOR+
				";background-color:"+C_INTERACTIONPAGE_TITLEBACKCOLOR+";")
		}

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
		Purpose : Display Label+Editbox in the Interation page
		Parameters : The Label Title and the Variable Name
		Output : The Editbox Object
	*/

	func EditBox cTitle,cVariable
		oLabel = new qLabel(win) {
			setText(cTitle)
			setStyleSheet("font-size:"+this.nControlsFontSize+"pt;")
		}
		oText = new qTextEdit(win) {
			setacceptrichtext(False)
			setStyleSheet("font-size:"+this.nControlsFontSize+"pt;")
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
		aVariables + [oText,cVariable,C_INTERACTION_CT_EDITBOX ]
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
		Editbox with init. value 
	*/
	func EditBoxValue cTitle,cVariable,cValue 
		oText = Editbox(cTitle,cVariable) {
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

	func CheckBoxValue cText,cVariable,nValue
		CheckBox(cText,cVariable) {
			setCheckState(nValue)
		}

	/*
		Purpose : Display Checkbox and Textbox
		Parameters : The Title and the Variable Name
		Output : list [The Checkbox Object,The Textbox Object]
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
		Purpose : Display Checkbox and Editbox
		Parameters : The Title and the Variable Name
		Output : list [The Checkbox Object,The EditBox Object]
	*/

	func CheckBoxEditBox cText,cVariable
		oCheck = new qCheckBox(win) {
			setStyleSheet("font-size:"+this.nControlsFontSize+"pt;")
			setText(cText)
		}
		oText = new qTextEdit(win) {
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
		aVariables + [oText,cVariable,C_INTERACTION_CT_EDITBOX ]
		return [oCheck,oText]

	/*
		Purpose : Add Label+ListBox in the interaction page
		Parameters : The label title, the variable name and the Listbox items
		Output : the listbox object
	*/

	func ListBox cTitle,cVariable,aItems
		# Process the List Items (We need each item to be [id,value])
		if not isList(aItems[1]) {
			# We get items as ["item1","item2",...,"itemN"] without IDs
			aNewItems = []
			nItemID = 0
			for item in aItems {
				nItemID++
				aNewItems + [nItemID, item]
			}
			# Update the List 
				aItems = aNewItems
			# Sort the List according to the second column (Item Text)
				if lEnableListBoxSort {
					aItems = Sort(aItems,2)
				}
		}
		
		oLabel = new qLabel(win) {
			setStyleSheet("font-size:"+this.nControlsFontSize+"pt;")
			setText(cTitle)
		}
		lSearchTextbox = len(aItems) > 5
		if lSearchTextbox {
			oLineEdit = new qLineEdit(win) {
				setTextChangedEvent(Method("searchinlistbox('"+cVariable+"')"))
			}
		}
		oList = new qListWidget(win) {
			setStyleSheet("font-size:"+this.nControlsFontSize+"pt;")
			if this.lFirstTextBox {
				this.lFirstTextBox = False
				if lSearchTextbox {
					oLineEdit.setFocus(0)
					this.oFirstText = oLineEdit
				else
					setFocus(0)
					this.oFirstText = oList
				}
			}
			for item in aItems {		
				AddItem(Item[2])
			}
			setCurrentRow(0,3)
			setminimumwidth(200)
			setminimumheight(100)	
			setitemdoubleclickedevent(Method(:OkAction))
		}
		if lSearchTextbox {
			oLayoutV = new qVBoxLayout() {
				addWidget(oLineEdit)
				addWidget(oList)
			}			
		}
		oLayout = new qHBoxLayout() {
			AddWidget(oLabel) 
			if lSearchTextbox {
				addLayout(oLayoutV)
			else 
				addWidget(oList)
			}
		}
		oLayoutAll.AddLayout(oLayout)
		if lSearchTextbox {
			aVariables + [oList,cVariable,C_INTERACTION_CT_LISTBOX,oLineEdit, aItems ]
		else 
			aVariables + [oList,cVariable,C_INTERACTION_CT_LISTBOX,NULL, aItems ]
		}
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
				# Get the Index of the selected Item
					cValue = oObject.currentrow() + 1
				# Get the ID of the selected item
					cValue = aVariables[nPos][C_INTERACTION_VL_LISTITEMS][cValue][1]
			case C_INTERACTION_CT_EDITBOX 
				cValue = oObject.toplaintext()
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
				# Get the Index 
					cValue = oObject.currentrow() + 1
				# Get the ID
					cValue = item[C_INTERACTION_VL_LISTITEMS][cValue][1]
				cValue = "" + cValue
			case C_INTERACTION_CT_EDITBOX 
				cValue = oObject.toplaintext()
			}
			cVariablesValues += 
				item[C_INTERACTION_VL_NAME] + C_INTERACTIONVALUES_SEPARATOR +
				cValue + C_INTERACTIONVALUES_SEPARATOR
		}
		return cVariablesValues

	/*
		Split function that take in mind having many lines between seperators
		We use this function because the original Split() in StdLib separate 
		the Split() output to many items for each string that have many lines 
		While customSplit() return one item for each multi-line string 
	*/
	
	func customSplit cString,cSeparator
		aList = []
		nPos = substr(cString,cSeparator)
		while nPos {
			aList + left(cString,nPos-1)
			cString = substr(cString,nPos+len(cSeparator))
			nPos = substr(cString,cSeparator)
		}
		return aList


	/*
		Purpose : Set the Interaction Page Variables Values
		Parameters : Variables Values as String
		Output : None
	*/

	func SetVariablesValues cVariablesValues
		aValues = customSplit(cVariablesValues,C_INTERACTIONVALUES_SEPARATOR)
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
				aListItems = item[C_INTERACTION_VL_LISTITEMS]
				# Convert ID to Index 
					cValue = find(aListItems,(0+cValue),1)
				oObject.setcurrentrow((0+cValue)-1,2 | dec("10"))
			case C_INTERACTION_CT_EDITBOX 
				oObject.setPlainText(cValue)
			}
		}

	func GetVariableValue aValues,cName
 		nPos = find(aValues,cName)
		if nPos {
			return aValues[nPos+1]
		}

	func GetVariableObject cVariable
		nPos = find(aVariables,cVariable,C_INTERACTION_VL_NAME)
		oObject = aVariables[nPos][C_INTERACTION_VL_OBJECT]
		return oObject

	func GetVariableExtraObject cVariable
		nPos = find(aVariables,cVariable,C_INTERACTION_VL_NAME)
		oObject = aVariables[nPos][C_INTERACTION_VL_EXTRAOBJECT]
		return oObject

	func EnableListBoxSort 
		lEnableListBoxSort = True 

	func DisableListBoxSort 
		lEnableListBoxSort = False
