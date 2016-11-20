/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer Window
**	Date : 2016.10.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "stdlib.ring"
load "guilib.ring"
load "globals.ring"
load "translation/english.ring"

load "goaldesigner/treemodel.ring"

if filename()  = sysargv[2] {
	Test_GoalDesigner()
}

func Test_GoalDesigner

	new qApp {
		$objname = "$GoalDesigner"
		$GoalDesigner = new GoalDesignerController
		$GoalDesigner.Start()
		exec()
	}

class GoalDesignerController

	oView = new GoalDesignerView
	oModel = new GoalDesignerModel

	func Start
		oView.Show()

	func AddStep cStepName
		oItem  = oView.oStepsTree.currentItem()
		nParentID = oView.oStepsTree.GetIDByObj(oItem)
 		nStepID = oModel.AddStep(nParentID,[
				:name = cStepName,
				:active = True , 
				:code = "" , 
			 	:date = date() ,
				:time = time()
			]
		)
		oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)

	func AddStepAction
		oInput = New QInputDialog(oView.win)
		{
			setwindowtitle("Enter the step name?")
			setgeometry(100,100,400,50)
			setlabeltext("Step Name")
			settextvalue("")
			lcheck = exec()
		}
		if lCheck  {
			AddStep(oInput.textvalue())
		}
	
	func EditStepAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oInput = New QInputDialog(oView.win)
		{
			setwindowtitle("Enter the step name?")
			setgeometry(100,100,400,50)
			setlabeltext("Step Name")
			settextvalue(this.oModel.GetStepName(nStepID))
			lcheck = exec()
		}
		if lCheck  {
			cText = oInput.textvalue()
			oView.oStepsTree.editstep(oItem,cText,this.oModel.GetStepIgnoreStatus(nStepID))
			oModel.EditStepName(nStepID,cText)
		}		

	func DeleteStepAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oItem.parent().takechild(oItem.parent().indexofchild(oItem))
		oModel.DeleteStep(nStepID)

	func MoveStepUpAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oParent = oItem.Parent()
		nIndex = oParent.IndexofChild(oItem)
		if nIndex > 0 {	# Not The First Item
			oView.oStepsTree.SaveLabels(oItem)
			oParent.TakeChild(nIndex)
			oParent.InsertChild(nIndex-1,oItem)
			oView.oStepsTree.RestoreLabels(oItem,True)
			oParent.SetExpanded(True)
			oItem.SetExpanded(True)
			oModel.MoveStepUp(nStepID)	
		}

	func MoveStepDownAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oParent = oItem.Parent()
		nIndex = oParent.IndexofChild(oItem)
		if nIndex < oParent.ChildCount() - 1 { # Not the Last Item
			oView.oStepsTree.SaveLabels(oItem)
			oParent.TakeChild(nIndex)
			oParent.InsertChild(nIndex+1,oItem)
			oView.oStepsTree.RestoreLabels(oItem,True)
			oParent.SetExpanded(True)
			oItem.SetExpanded(True)	
			oModel.MoveStepDown(nStepID)	
		}

	func PrintStepsAction
		oModel.PrintSteps()

	func CutStepsAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oModel.CutStep(nStepID)
		oView.oStepsTree.SaveStep(oItem)
		oItem.parent().takechild(oItem.parent().indexofchild(oItem))

	func CopyStepsAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oModel.CopyStep(nStepID)
		oView.oStepsTree.SaveStep(oItem)

	func PasteStepsAction
		if oView.oStepsTree.isbuffernotempty() = false {
			return
		}
		oParentItem  = oView.oStepsTree.currentItem()
		nParentStepID = oView.oStepsTree.GetIDByObj(oParentItem)
		oModel.PasteStep(nParentStepID)
		oNewParentItem = oView.oStepsTree.PasteStep(oParentItem)
		# Update the Object|StepID List
			aStepsObjectsList = oView.oStepsTree.StepsList(oNewParentItem)
			aStepsDataList = oModel.GetBuffer()
			oView.oStepsTree.AddNodesFromBuffer(aStepsObjectsList,aStepsDataList)

	func IncreaseSizeAction
		oView.oStepsTree.IncreaseFontSize()
		oView.oStepCode.IncreaseFontSize()

	func DecreaseSizeAction
		oView.oStepsTree.DecreaseFontSize()
		oView.oStepCode.DecreaseFontSize()

	func IgnoreStepAction		
		# We uses if statement because CheckState() output = 2 when True
		if oView.checkIgnore.checkstate() { 
			nIgnore = True
		else
			nIgnore = False
		}
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		oModel.IgnoreStep(nStepID,nIgnore)
		oView.oStepsTree.IgnoreStep(oItem,nIgnore)

	func StepChangedAction
		if not oView.oStepsTree.isEnabled() {
			return
		}
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		# Check if it's the start point
			if nStepID = 1 {	# Avoid start point
				# Set Ignore Checkbox status
					oView.checkIgnore.setCheckstate(0)
				# Set the step code
					oView.oStepCode.setText("")
					oView.oStepCode.setEnabled(False)
				return
			}
		# Change the Ignore CheckBox Status
			if oModel.GetStepIgnoreStatus(nStepID) {
				oView.checkIgnore.setCheckstate(2)
			else
				oView.checkIgnore.setCheckstate(0)
			}	
		# Change the Step Code Value
			oView.oStepCode.setEnabled(True)
			oView.oStepCode.setText(oModel.GetStepCode(nStepID))

	func StepCodeChangedAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point			
			return
		}	
		oModel.SaveStepCode(nStepID,oView.oStepCode.ToPlainText())

class GoalDesignerView

	win = new qWidget() {
		setWindowTitle(T_GD_WindowTitle) # "Goal Designer"
		oPageDesign = new qWidget() {
			oStepsTree = new StepsTreeView(oPageDesign) {
				setCurrentItemChangedEvent($objname+".StepChangedAction()") 			
			}
			oPageDesignLayout = new qVBoxLayout() {
				AddWidget(oStepsTree)
			}
			SetLayout(oPageDesignLayout)
		}
		oPageCode = new qWidget() {
			oStepCode = new StepCodeView(oPageCode)  {
				setTextChangedEvent($objname+".StepCodeChangedAction()")
			}
			oPageCodeLayout= new qVBoxLayout() {
				AddWidget(oStepCode)
			}
			SetLayout(oPageCodeLayout)
		}		
		oTab = new qtabwidget(win) {
			InsertTab(0,oPageDesign,"Steps Tree")
			InsertTab(1,oPageCode,"Step Code")
		}
		btnAddStep = new qPushButton(win) {
			setText("New Step")
			setClickEvent($objname+".AddStepAction()")			
		}
		setBtnImage(btnAddStep,"images/new.png")
		btnEditStep = new qPushButton(win) {
			setText("Edit Step")
			setClickEvent($objname+".EditStepAction()")			
		}		
		setBtnImage(btnEditStep,"images/edit.png")
		btnDeleteStep = new qPushButton(win) {
			setText("Delete Step")
			setClickEvent($objname+".DeleteStepAction()")			
		}
		setBtnImage(btnDeleteStep,"images/delete.png")
		btnMoveStepUp = new qPushButton(win) {
			setText("Move Up")
			setClickEvent($objname+".MoveStepUpAction()")			
		}
		setBtnImage(btnMoveStepUp,"images/up.png")
		btnMoveStepDown = new qPushButton(win) {
			setText("Move Down")
			setClickEvent($objname+".MoveStepDownAction()")			
		}
		setBtnImage(btnMoveStepDown,"images/down.png")
		btnPrintSteps = new qPushButton(win) {
			setText("Print Steps")
			setClickEvent($objname+".PrintStepsAction()")			
		}
		setBtnImage(btnPrintSteps,"images/print.png")
		btnCutSteps = new qPushButton(win) {
			setText("Cut")
			setClickEvent($objname+".CutStepsAction()")			
		}
		setBtnImage(btnCutSteps,"images/cut.png")
		btnCopySteps = new qPushButton(win) {
			setText("Copy")
			setClickEvent($objname+".CopyStepsAction()")			
		}
		setBtnImage(btnCopySteps,"images/copy.png")
		btnPasteSteps = new qPushButton(win) {
			setText("Paste")
			setClickEvent($objname+".PasteStepsAction()")			
		}
		setBtnImage(btnPasteSteps,"images/paste.png")
		btnIncreaseSize = new qPushButton(win) {
			setText("Increase Size")
			setClickEvent($objname+".IncreaseSizeAction()")			
		}
		setBtnImage(btnIncreaseSize,"images/zoomin.png")
		btnDecreaseSize = new qPushButton(win) {
			setText("Decrease Size")
			setClickEvent($objname+".DecreaseSizeAction()")			
		}
		setBtnImage(btnDecreaseSize,"images/zoomout.png")
		checkIgnore = new qCheckBox(win) {
			setText("x")
			setstateChangedEvent($objname+".IgnoreStepAction()")		
		}
		layoutBtns = new qHBoxLayout()
		{	
			AddWidget(btnAddStep)
			AddWidget(btnEditStep)
			AddWidget(btnDeleteStep)
			AddWidget(btnMoveStepUp)
			AddWidget(btnMoveStepDown)
			AddWidget(btnPrintSteps)
			AddWidget(btnCutSteps)
			AddWidget(btnCopySteps)
			AddWidget(btnPasteSteps)
			AddWidget(btnIncreaseSize)
			AddWidget(btnDecreaseSize)
			AddWidget(checkIgnore)
		}
		layout1 = new qVBoxLayout()
		{	
			AddLayout(layoutBtns)
			AddWidget(oTab)
		}		
		SetLayout(Layout1)
		/*
			We set the focus on the steps tree to enable setting the current item
			This is important after creating the Tabs
		*/
		oStepsTree.SetFocus(0)
	}

	func Show
		win { showMaximized() }

class StepCodeView from QTextEdit

	font  nFontSize = 12	# The font object and the font size

	func init win
		super.init(win)
		font = new qFont("",0,0,0)
		font.setpixelsize(nFontSize)
		return self

	func IncreaseFontSize
		if nFontSize >= 72 { return }
		nFontSize += 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

	func DecreaseFontSize
		if nFontSize <= 12 { return }
		nFontSize -= 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

class HTMLStyles

	func text cText,cTextColor,cBackColor
		cHTML =  "<span style='background-color:#{backcolor}'><font color='#{textcolor}'>#{text}</font></span>"
		cHTML = substr(cHTML,"#{backcolor}",cBackColor)
		cHTML = substr(cHTML,"#{textcolor}",cTextColor)
		cHTML = substr(cHTML,"#{text}",cText)
		return cHTML

	func image cFile
		return "<img src='"+cFile+"'> "

class StepsTreeView from TreeControl

	oFirststep oStyle = new HTMLStyles

	oStepBuffer = NULL # Used for Cut,Copy & Paste operations

	lUseLabels = True	# Use QLabel for each Tree Item

	aLabels = []		# List of Labels controls	

	func Init win
		super.init(win)
		setcolumncount(1)
		oFirststep = new qtreewidgetitem()
		addtoplevelitem(oFirststep)
		AddToTree(1,oFirstStep)
		setheaderlabel(T_GD_StepsTree )
		oLabel = new qLabel(self) {
			settext(this.oStyle.image(C_LABELIMAGE_NODEICON)+ this.oStyle.text(T_GD_FirstStep,"green",""))
			setStyleSheet("font-size:" + this.nFontSize + "pt;")
		}
		setItemWidget(oFirstStep,0, oLabel)	
		return self

	func GetItemLabel oItem
		oLabel = new qLabel
		oLabel.pObject =  itemwidget(oItem,0).pObject
		return oLabel

	func AddStep nParentID,nID,cText
		AddNode(nParentID,nID,cText)

	func EditStep oItem,cText,lIgnoreStatus
		if lUseLabels = false {
			oItem.setText(0,cText)
		else
			oLabel = GetItemLabel(oItem)
			if lIgnoreStatus { 
				oLabel.SetText(this.oStyle.image(C_LABELIMAGE_IGNORESTEP)+this.oStyle.text(cText,"green",""))
			else
				oLabel.SetText(this.oStyle.image(C_LABELIMAGE_NODEICON)+this.oStyle.text(cText,"green",""))
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
		/*
			We uses setEnabled() to use isEnabled() later in StepChangedAction 
			The idea is to disable the action during PasteStep() Execution
			Because this will lead to errors in finding the step data 
			Because we update the view first then the model
			Also executing the StepChangedAction during this process is not necessary
		*/
		setEnabled(False)
		oNewItems = oStepBuffer.Clone()
		oParentStep.AddChild(oNewItems)
		setCurrentItem(oNewItems,0)
		# Add the Labels Controls
			RestoreLabels(oNewItems,False)
		setEnabled(True)
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
			SubStepsList(aList,oParentStep.child(x-1))
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
		aItems = stepsList(oFirstStep)
		for item in aItems {
			oLabel = GetItemLabel(item)
			oLabel.setStyleSheet("font-size:" + nFontSize + "pt;")
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


class TreeControl from qTreeWidget	

	aTree = []	# Node ID , Node Object , Node Object.pObject

	font  nFontSize = 12	# The font object and the font size

	lUseLabels = False	# Use QLabel for each Tree Item

	func init win
		super.init(win)
		font = new qFont("",0,0,0)
		font.setpixelsize(nFontSize)
		return self

	func AddNode nParentID,nID,cText
		oParent = GetObjByID(nParentID)
		oItem = new qtreewidgetitem()
		if lUseLabels = False {	
			oItem.settext(0,cText)
		}
		oParent.addchild(oItem)
		AddToTree(nID,oItem)
		setCurrentItem(oItem,0)	# To Display the item (become visible)
		setCurrentItem(oParent,0)	# Focus on Parent Step
		if lUseLabels = True {
			oLabel = new qLabel(self) {			
				settext(this.oStyle.image(C_LABELIMAGE_NODEICON)+this.oStyle.text(cText,"green",""))
				setStyleSheet("font-size:" + this.nFontSize + "pt;")
			}
			setItemWidget(oItem,0,oLabel)
		}		 

	func GetObjByID id
		nPos = std_find2(aTree,id,C_TREECONTROL_ID)
		if nPos = 0 {
			raise("GetObjByID() - Can't find the object!")
		}
		return aTree[nPos][C_TREECONTROL_OBJECT]

	func GetIDByObj oObj
		nPos = std_find2(aTree,oObj.pObject,C_TREECONTROL_OBJECTPOINTER)
		if nPos = 0 {
			raise("GetIDByObj() - Can't find the ID!")
		}
		return aTree[nPos][C_TREECONTROL_ID]

	func AddToTree nID,oObject
		aTree + [nID,oObject,oObject.pObject]

	/*
		The next method is used after Paste operation to update the Tree list
		With the new nodes data
	*/
	func AddNodesFromBuffer aNodesObjectsList,aNodesDataList
		for x = 1 to len(aNodesObjectsList) {
			AddToTree(aNodesDataList[x][C_TREEMODEL_NODEID],aNodesObjectsList[x])
		}

	func IncreaseFontSize
		if nFontSize >= 72 { return }
		nFontSize += 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

	func DecreaseFontSize
		if nFontSize <= 12 { return }
		nFontSize -= 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

class GoalDesignerModel

	oStepsTreeModel = new TreeModel

	# Add the first step
	AddStep(0,[:name = T_GD_FirstStep ,
		      :active = True , 
		      :code = "" , 
		      :date = date() ,
		      :time = time()])

	func AddStep nParent,Content
		nID =  oStepsTreeModel.AddNode(nParent,Content)
		return nID

	func EditStepName nStepID,cStepName
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		aContent[:name] = cStepName
		oStepsTreeModel.SetNodeContent(nStepID,aContent)

	func GetStepName nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		return aContent[:name] 

	func GetStepIgnoreStatus nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		# The Ignore Status is the reverse of the Active Status
		return not aContent[:active] 

	func GetStepCode nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		return aContent[:code] 

	func PrintSteps
		for x in oStepsTreeModel.getdata() {
			puts( x[C_TREEMODEL_CONTENT][:name] +
				 " .. Ignore : " +
				x[C_TREEMODEL_CONTENT][:active])
		}

	func DeleteStep nStepID
		oStepsTreeModel.DeleteNode(nStepID)

	func MoveStepUp nStepID
		oStepsTreeModel.MoveNodeUp(nStepID)

	func MoveStepDown nStepID
		oStepsTreeModel.MoveNodeDown(nStepID)

	func CutStep nStepID
		oStepsTreeModel.CutNode(nStepID)

	func CopyStep nStepID
		oStepsTreeModel.CopyNode(nStepID)

	func PasteStep nParentStepID
		oStepsTreeModel.PasteNode(nParentStepID)

	func GetBuffer
		return oStepsTreeModel.GetBuffer()

	/*
		The next function  ignore step (Enable/Disable step)
	*/
	func IgnoreStep nStepID,nIgnore
		# The Active Status is the reverse of the Ignore Status
			nActive = not nIgnore
		# Set Ignore status for the parent step 
			oStepsTreeModel.GetNodeContent(nStepID)[:active]  = nActive
		# Set Ignore status for children steps
			aChildren = oStepsTreeModel.Children(nStepID)	
			for nIndex in aChildren {
				oStepsTreeModel.GetData()[nIndex][C_TREEMODEL_CONTENT][:active]  = nActive
			}

	/*
		The next function save the step code
	*/
	func SaveStepCode nStepID,cCode
		oStepsTreeModel.GetNodeContent(nStepID)[:code]  = cCode

