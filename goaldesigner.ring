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
			oView.oStepsTree.editstep(oItem,cText)
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

	func DecreaseSizeAction
		oView.oStepsTree.DecreaseFontSize()

	func IgnoreStepAction		
		if oView.checkIgnore.checkstate() { # True 
			nIgnore = True
		else
			nIgnore = False
		}
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		oModel.IgnoreStep(nStepID,nIgnore)
		oView.oStepsTree.IgnoreStep(oItem,nIgnore)
	
class GoalDesignerView

	win = new qWidget() {
		setWindowTitle(T_GD_WindowTitle) # "Goal Designer"
		oStepsTree = new StepsTreeView(win)
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
			AddWidget(oStepsTree)
		}		
		SetLayout(Layout1)
	}

	func Show
		win { showMaximized() }

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
			settext(this.oStyle.image("images/nodeicon.png")+ this.oStyle.text(T_GD_FirstStep,"green",""))
			setStyleSheet("font-size:" + this.nFontSize + "pt;")
		}
		setItemWidget(oFirstStep,0, oLabel)	

	func GetItemLabel oItem
		oLabel = new qLabel
		oLabel.pObject =  itemwidget(oItem,0).pObject
		return oLabel

	func AddStep nParentID,nID,cText
		AddNode(nParentID,nID,cText)

	func EditStep oItem,cText
		if lUseLabels = false {
			oItem.setText(0,cText)
		else
			oLabel = GetItemLabel(oItem)
			oLabel.SetText(this.oStyle.image("images/nodeicon.png")+this.oStyle.text(cText,"green",""))
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

class TreeControl from qTreeWidget	

	aTree = []	# Node ID , Node Object , Node Object.pObject

	font  nFontSize = 12	# The font object and the font size

	lUseLabels = False	# Use QLabel for each Tree Item

	func init win
		super.init(win)
		font = new qFont("",0,0,0)
		font.setpixelsize(nFontSize)

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
				settext(this.oStyle.image("images/nodeicon.png")+this.oStyle.text(cText,"green",""))
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

	func PrintSteps
		for x in oStepsTreeModel.getdata() {
			puts( x[C_TREEMODEL_CONTENT][:name] )
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
		# Set Ignore status for the parent step 
			oStepsTreeModel.GetNodeContent(nStepID)[:active]  = nIgnore
		# Set Ignore status for children steps
			aChildren = oStepsTreeModel.Children(nStepID)	
			for nIndex in aChildren {
				oStepsTreeModel.GetData()[nIndex][C_TREEMODEL_CONTENT][:active]  = nIgnore
			}
/*
	Tree Model Class
	We manage the tree data as a table
	The table contains the next columns
	nNodeID - nParentID - Content
*/

class TreeModel

	aList = []		# Tree Content [nNodeID - nParentID - Content]
	nID = 0		# Automatic ID for each node

	aBuffer = []		# List used for Cut, Copy & Paste operations

	/*
		The next method add new nodes to the tree
		The method check where to inset new nodes
		We have tree in the correct order (Top-Down)
	*/
	func AddNode  nParent,Content
		nID++	# Increase the Automatic ID by 1
		nPos = FindNewNodePosition(nParent)
		insert(aList,nPos, [nID, nParent, Content])
		return nID	# Return the Node ID

	/*
		The next method get the position of the new node
		We use the inset() function later to add new nodes
		The goal is to keep the tree in the correct order
		So we don't need to order the tree when we generate the code
	*/
	func FindNewNodePosition nParent
		for x = 1 to len(aList) {
			if aList[x][C_TREEMODEL_NODEID] = nParent {
				for x2 = x+1 to len(aList) {
					if aList[x2][C_TREEMODEL_PARENTID] != nParent {
						return x2-1
					}
				}
			}
		}
		return len(aList)

	/*
		The next method edit the node content in the tree
	*/
	func SetNodeContent nNodeID,Content
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)
		aList[nPos][C_TREEMODEL_CONTENT] = Content

	/*
		The next method get the node content from the tree
	*/
	func GetNodeContent nNodeID
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)
		return aList[nPos][C_TREEMODEL_CONTENT]

	/*
		The next method return the tree list
	*/
	func GetData
		return aList

	/*
		The next method return a list of the node children
		The list contains each node index
	*/
	func Children nNodeID
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)
		nSize = len(aList)
		aChildren = []
		aParents = []
		aParents + nNodeID
		for x = nPos + 1 to nSize {
			if find(aParents,aList[x][C_TREEMODEL_PARENTID]) {
				aChildren + x
				aParents + aList[x][C_TREEMODEL_NODEID]
			}
		}
		return aChildren

	/*
		Remove children from the Tree
		The input is a list of each node index
	*/
	func DeleteChildren aChildren
		# We remove from bottom to up to keep the node index valid during deletion
		for x = len(aChildren) to 1 step -1  {
			del(aList,aChildren[x])
		}
	
	/*
		The next method get a list of the Children data
		Input : Children list of indexes 
		Output : Children list of data
	*/
	func GetChildren aChildren
		aOutput = []
		for x in aChildren {
			aOutput + aList[x]
		}
		return aOutput

	/*
		Remove node and it's children
	*/
	func DeleteNode nNodeID
		# Delete Children
		DeleteChildren(Children(nNodeID)) 		
		# Delete the node itself
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)		
		del(aList,nPos)

	/*
		The next method find the sibling node (UP)
	*/
	func SiblingUp nNodeID
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)		
		nParentID = aList[nPos][C_TREEMODEL_PARENTID]
		# Find the sibling node (Up)
		nPos2 = 0
		for x=nPos-1 to 1 step -1 {
			if aList[x][C_TREEMODEL_PARENTID] = nParentID {
				nPos2 = x
				exit 
			}
		}
		return nPos2

	/*
		The next method find the sibling node (Down)
	*/
	func SiblingDown nNodeID
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)		
		nParentID = aList[nPos][C_TREEMODEL_PARENTID]
		# Find the sibiling node (Down)
		nPos2 = 0
		for x=nPos+1 to len(aList) {
			if aList[x][C_TREEMODEL_PARENTID] = nParentID {
				nPos2 = x
				exit 
			}
		}
		return nPos2

	/*
		The next method move a node up
	*/
	func MoveNodeUp nNodeID
		# Find the sibling node (Up)
			nPos = SiblingUp(nNodeID)
		# Get Children List
			aMove = GetChildren(Children(aList[nPos][C_TREEMODEL_NODEID]))
		# Add the Parent Node
			Insert(aMove,0,aList[nPos])
		# Delete The Node
			DeleteNode(aList[nPos][C_TREEMODEL_NODEID])
		# Get the Last Item in the Node children that we move up
			aChildren = children(nNodeID)
			if len(aChildren) > 0 {
				nPos2 = aChildren[Len(aChildren)]
			else 
				nPos2 = find(aList,nNodeID,C_TREEMODEL_NODEID)		
			}
		# Insert Items after the last item in the node children 
			for x = len(aMove) to 1 step -1 {
				Insert(aList,nPos2,aMove[x])
			}

	
	/*
		The next method move the Node down
	*/
	func MoveNodeDown nNodeID
		# Find the sibiling node (Down)
			nPos = SiblingDown(nNodeID)
		# Move The Sibling node (Up)
			MoveNodeUp(aList[nPos][C_TREEMODEL_NODEID])

	/*
		The next method Cut the Node
	*/
	func CutNode nNodeID
		# Copy the Node Data
			nPos = CopyNode(nNodeID)
		# Delete The Node
			DeleteNode(aList[nPos][C_TREEMODEL_NODEID])

	/*
		The next method Copy the Node
	*/
	func CopyNode nNodeID
		# Get the Node position
			nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)		
		# Get Children List
			aBuffer = GetChildren(Children(aList[nPos][C_TREEMODEL_NODEID]))
		# Add the Parent Node
			Insert(aBuffer,0,aList[nPos])
		return nPos

	/*
		The next method Paste the Node
		We have the nodes in the aBuffer List 
		When we paste, We must
			1 - Change the parent ID of the first node to the input of PasteNode method
			2 - Change the ID of each node to be a new and unique ID
	*/
	func PasteNode nParentNodeID
		nID++
		# Get the maximum ID value in the Buffer
		nMax = 0
		for node in aBuffer { 
			nMax = max(nMax,  node[C_TREEMODEL_NODEID] )
		}
		# Update Each Node ID
		for x=1 to len(aBuffer) { 			
			aBuffer[x][C_TREEMODEL_NODEID] += nID
			aBuffer[x][C_TREEMODEL_PARENTID] += nID
		}
		# Update the first node parent ID		
			aBuffer[1][C_TREEMODEL_PARENTID] = nParentNodeID
		# Update the ID
			nID = nID + nMax + 1
		# Copy the nodes
			aChildren = Children(nParentNodeID)
			if len(aChildren) > 0 {
				nPos = aChildren[len(aChildren)]
			else
				nPos = find(aList,nParentNodeID,C_TREEMODEL_NODEID)
			}
			for x = len(aBuffer) to 1 step -1 {
				node = aBuffer[x] 
				Insert(aList,nPos,node)
			}

	/*
		The next method return the tree list in the buffer that are used for Cut,Copy and Paste
	*/
	func GetBuffer
		return aBuffer

