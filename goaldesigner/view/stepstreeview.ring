/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Steps Tree View Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class StepsTreeView from TreeControl

	oFirststep oStyle = new HTMLStyles

	oStepBuffer = NULL # Used for Cut,Copy & Paste operations

	lUseLabels = True	# Use QLabel for each Tree Item

	aLabels = []		# List of Labels controls	

	cControlHeader = T_GD_StepsTree 
	cStartPointText = T_GD_FirstStep

	func Init win
		super.init(win)
		AddStartPoint()
		return self

	func AddStartPoint
		setcolumncount(1)
		oFirststep = new qtreewidgetitem()
		addtoplevelitem(oFirststep)
		AddToTree(1,oFirstStep)
		setheaderlabel(cControlHeader)
		oLabel = new qLabel(self) {
			settext(this.oStyle.image(C_LABELIMAGE_NODEICON)+
				 this.oStyle.text(this.cStartPointText,"green",""))
			this.SetLabelFont(oLabel)
		}
		setItemWidget(oFirstStep,0, oLabel)	
		setCurrentItem(oFirstStep,0)

	func GetItemLabel oItem
		oLabel = new qLabel
		oLabel.pObject =  itemwidget(oItem,0).pObject
		return oLabel

	func AddStep nParentID,nID,cText
		return AddNode(nParentID,nID,cText)

	func InsertStep nParentID,nID,cText,nIndex
		InsertNode(nParentID,nID,cText,nIndex)

	func EditStep oItem,cText,lIgnoreStatus
		if lUseLabels = false {
			oItem.setText(0,cText)
		else
			oLabel = GetItemLabel(oItem)
			if lIgnoreStatus { 
				oLabel.SetText(this.oStyle.image(C_LABELIMAGE_IGNORESTEP)+
				this.oStyle.text(cText,this.cColor,this.cBackColor))
			else
				oLabel.SetText(this.oStyle.image(C_LABELIMAGE_NODEICON)+
				this.oStyle.text(cText,this.cColor,this.cBackColor))
			}
		}

	func SaveStep oItem
		if isObject(oStepBuffer) {
			oStepBuffer.Delete()
		}
		# Copy the Steps to the buffer
			oStepBuffer = oItem.Clone()
		# Save the Labels Controls
			SaveLabels(oItem)

	func PasteStep oParentStep
		oNewItems = oStepBuffer.Clone()
		oParentStep.AddChild(oNewItems)
		setCurrentItem(oNewItems,0)
		# Add the Labels Controls
			RestoreLabels(oNewItems,False)
		return oNewItems

	func SaveLabels oItem
		# Save the Labels Controls
			if lUseLabels {
				aItems = StepsList(oItem)
				/*
					Create new list in aLabels
					Because this feature is shared between
						Move Up / Move Down
						Cut, Copy and Paste
					We may copy/cut a step ---> this call saveLabels()
					Then we move a step up/down ---> this call saveLabels() 
									again then  restoreLabels()
					Then we call paste ---> this call restorelabels()					
				*/
				aLabels + []
				for item in aItems {
					oLabel = GetItemLabel(item)
					aLabels[len(aLabels)] + [oLabel.text(),oLabel.StyleSheet()]
				}
			}

	func RestoreLabels oNewItems,lDeleteLabels
		# Add the Labels Controls
			aItems = StepsList(oNewItems)
			aTempLabels = aLabels[len(aLabels)]
			for x=1 to len(aItems) {
				oItem = aItems[x]
				aLabel = aTempLabels[x]
				oLabel2 = new qLabel(Self) {
					setText(aLabel[C_NODELABEL_TEXT])
					setStyleSheet(aLabel[C_NODELABEL_STYLESHEET])					
				}
				setItemWidget(oItem,0,oLabel2)
			}
			/*
				We check the lDeleteLabels Variable
				We remove the list only if the value is true
				This means calling savelabels() then restorelabels() directly
				This happens in Move Up and Move Down operations
				While in Paste operation the lDeleteLabels will be false
				Because we may use paste more than one time.
			*/
			if lDeleteLabels {
				del(aLabels,len(aLabels))
			}

	func isbuffernotempty
		if isObject(oStepBuffer) {
			return true
		}
		return false

	/*
		The next method take a Step as input
		Then return a list of the step and the steps children in order
	*/
	func StepsList oParentStep
		aList = []
		SubStepsList(aList,oParentStep)
		return aList

	func SubStepsList aList,oParentStep
		aList + oParentStep
		for x=1 to oParentStep.childcount() {
			oItem = oParentStep.child(x-1)			
			SubStepsList(aList,oItem)
		}
		
	func IncreaseFontSize
		super.IncreaseFontSize()
		UpdateFontSize()		

	func DecreaseFontSize
		super.DecreaseFontSize()
		UpdateFontSize()		

	func UpdateFontSize
		if lUseLabels = false {
			return 
		}
		# Set the Font Size of the start point
			oLabel = GetItemLabel(oFirstStep)
			SetLabelFont(oLabel)
		# Set the Font Size of the sub steps
			aItems = stepsList(oFirstStep)
			for item in aItems {
				oLabel = GetItemLabel(item)
				SetLabelFont(oLabel)
			}

	func IgnoreStep oItem,nIgnore
		aItems = StepsList(oItem)
		if nIgnore {
			for item in aItems {
				oLabel = GetItemLabel(item)
				cText = ItemLabelTextWithoutImages(oLabel)
				oLabel.SetText(this.oStyle.image(C_LABELIMAGE_IGNORESTEP)+cText)
			}
		else 
			for item in aItems {
				oLabel = GetItemLabel(item)
				cText = ItemLabelTextWithoutImages(oLabel)
				oLabel.SetText(this.oStyle.image(C_LABELIMAGE_NODEICON)+cText)
			}
		}

	func ItemLabelTextWithoutImages oLabel
		cText = oLabel.Text()
		cText = substr(cText,this.oStyle.image(C_LABELIMAGE_NODEICON),"")
		cText = substr(cText,this.oStyle.image(C_LABELIMAGE_IGNORESTEP),"")
		return cText

	func SetStepColor nStepType
		switch nStepType {
		case C_STEPTYPE_COMMENT
			cColor = "green"
			cBackColor = ""
		case C_STEPTYPE_ROOT
			cColor = "blue"
			cBackColor = ""
		case C_STEPTYPE_ALLOWINTERACTION
			cColor = "black"
			cBackColor = "yellow"
		case C_STEPTYPE_INFO
			cColor = "black"
			cBackColor = ""
		}

	func currentitem
		oItem = super.currentitem()
		if PtrCmp(oItem.pObject,NULL) {
			return oFirststep
		}
		return oItem
