/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Steps Tree View Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class StepsTreeView from TreeControl

	oFirststep  

	oStepBuffer = NULL 	# Used for Cut,Copy & Paste operations

	lUseLabels = True	# Use QLabel for each Tree Item

	aLabels = []		# List of Labels controls	

	cControlHeader = T_GD_StepsTree 
	cStartPointText = T_GD_FirstStep

	oHTMLFunctions = new HTMLFunctions

	if PWCTIsMobile(:StepsTreeScrollBars) {
		lShowScrollbars = True
	else 
		lShowScrollbars = False
	}

	func Init win
		if lUseLabels = False {
			init2(win)
		else
			super.init(win)
			AddStartPoint()
		}
		# When we have files with large lines 
		# Instead of manually changing the header width()		
		# We can change it using the next property
		if lShowScrollbars {
			sethorizontalscrollbarpolicy(Qt_ScrollBarAlwaysOn)
			setverticalscrollbarpolicy(Qt_ScrollBarAlwaysOn)
			setcolumnwidth(0,2000)
		}
		return self

	/*
		The next method is the same as Init 
		but uses AddStartPoint2() to create the item without 
		creating new qLabel object for it.
	*/
	func Init2 win
		super.init(win)
		AddStartPoint2()
		return self

	func AddStartPoint
		setcolumncount(1)
		oFirststep = new qtreewidgetitem()
		addtoplevelitem(oFirststep)
		AddToTree(1,oFirstStep)
		setheaderlabel(cControlHeader)
		oLabel = new qLabel(self) {
			resize(100,30)
			settext(this.NodeImage(C_LABELIMAGE_NODEICON)+
				 this.oStyle.text(this.cStartPointText,C_STEPCOLOR_STARTPOINT,""))
			this.SetLabelFont(oLabel)
		}
		setItemWidget(oFirstStep,0, oLabel)	
		setCurrentItem(oFirstStep,0)


	/*
		The next method is the same as AddStartPoint but doesn't
		create new qLabel object for the item.
	*/
	func AddStartPoint2
		setcolumncount(1)
		oFirststep = new qtreewidgetitem()
		addtoplevelitem(oFirststep)
		AddToTree(1,oFirstStep)
		setheaderlabel(cControlHeader)
		oFirstStep.settext(0,this.cStartPointText)
		setCurrentItem(oFirstStep,0)

	func ActivateTheFirstStep
		setCurrentItem(oFirstStep,0)

	func GetItemLabel oItem
		oLabel = new qLabel
		oLabel.pObject =  itemwidget(oItem,0).pObject
		return oLabel

	func AddStep nParentID,nID,cText
		return AddNode(nParentID,nID,cText)

	func InsertStep nParentID,nID,cText,nIndex
		return InsertNode(nParentID,nID,cText,nIndex)

	func EditStep oItem,cText,lIgnoreStatus
		cText = PrepareNodeText(cText)
		if lUseLabels = false {
			oItem.setText(0,cText)
		else
			oLabel = GetItemLabel(oItem)
			if lIgnoreStatus { 
				cImage = this.NodeImage(C_LABELIMAGE_IGNORESTEP)
				if cImage = "" {
					cImage = C_COMMENTMARK
				}
				oLabel.SetText(cImage+
				this.oStyle.text(cText,this.cColor,this.cBackColor))
			else
				cImage = this.NodeImage(C_LABELIMAGE_NODEICON)
				oLabel.SetText(cImage+
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
		return PasteStepAfterStep(oParentStep,-1)

	func PasteStepAfterStep oParentStep,nIndex
		oNewItems = oStepBuffer.Clone()
		if nIndex = -1 { 
			oParentStep.AddChild(oNewItems)	
		else 
			oParentStep.InsertChild(nIndex,oNewItems)
		}
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
		if not lUseLabels {
			return
		}

		# Add the Labels Controls
			aItems = StepsList(oNewItems)
			aTempLabels = aLabels[len(aLabels)]
			for x=1 to len(aItems) {
				oItem = aItems[x]
				aLabel = aTempLabels[x]
				oLabel2 = new qLabel(Self) {
					resize(100,30)
					setText(this.prepareNodeText(aLabel[C_NODELABEL_TEXT]))
					setStyleSheet(aLabel[C_NODELABEL_STYLESHEET])					
				}
				setLabelFont(oLabel2)
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
				if lUseLabels = true {		
					oLabel = GetItemLabel(item)
					cText = ItemLabelTextWithoutImages(oLabel)
					cText = PrepareNodeText(cText)
					cImage = this.NodeImage(C_LABELIMAGE_IGNORESTEP)
					if cImage = "" {
						cImage = C_COMMENTMARK
					}
					oLabel.SetText(cImage+cText)
				else 
					cText = item.text(0)
					if left(cText,C_COMMENTMARKSIZE) != C_COMMENTMARK {
						item.settext(0,C_COMMENTMARK + item.text(0))
					}
				}
			}
		else 
			for item in aItems {
				if lUseLabels = true {		
					oLabel = GetItemLabel(item)
					cText = ItemLabelTextWithoutImages(oLabel)
					cText = PrepareNodeText(cText)
					cImage = this.NodeImage(C_LABELIMAGE_NODEICON)
					oLabel.SetText(cImage+cText)
				else 
					cText = item.text(0)
					if left(cText,C_COMMENTMARKSIZE) = C_COMMENTMARK {
						cText = substr(cText,4)
					}
					item.settext(0,cText)
				}
			}
		}

	func ItemLabelTextWithoutImages oLabel
		cText = oLabel.Text()
		if C_STEPSTREE_NODEICON {		
			cText = substr(cText,this.NodeImage(C_LABELIMAGE_NODEICON),"")
			cText = substr(cText,this.NodeImage(C_LABELIMAGE_IGNORESTEP),"")
		else 
			if left(cText,C_COMMENTMARKSIZE) = C_COMMENTMARK {
				cText = substr(cText,C_COMMENTMARKSIZE+1)
			}
		}
		return cText

	func SetStepColor nStepType
		switch nStepType {
		case C_STEPTYPE_COMMENT
			cColor = C_STEPCOLOR_COMMENT_TEXT 				# "green"
			cBackColor = C_STEPCOLOR_COMMENT_BACKCOLOR			# ""
		case C_STEPTYPE_ROOT
			cColor = C_STEPCOLOR_ROOT_TEXT 					# "blue"
			cBackColor = C_STEPCOLOR_ROOT_BACKCOLOR 			# ""
		case C_STEPTYPE_ALLOWINTERACTION
			cColor = C_STEPCOLOR_ALLOWINTERACTION_TEXT 			#"black"
			cBackColor = C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR 	#"yellow"
		case C_STEPTYPE_INFO
			cColor = C_STEPCOLOR_INFO_TEXT					# "black"
			cBackColor = C_STEPCOLOR_INFO_BACKCOLOR			# ""
		}

	func PrepareNodeText cText
		cText = substr(cText,"C_STEPCOLOR_DATA_TEXT",C_STEPCOLOR_DATA_TEXT)
		cText = substr(cText,"C_STEPCOLOR_DATA_BACKCOLOR",C_STEPCOLOR_DATA_BACKCOLOR)
		return cText 

	func currentitem
		oItem = super.currentitem()
		if PtrCmp(oItem.pObject,NULL) {
			return oFirststep
		}
		return oItem

	func prepareStepName cStepName
		if lUseLabels = true {		
			return cStepName 
		else 
			return oHTMLFunctions.plainText(cStepName)
		}
