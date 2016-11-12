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
 		nStepID = oModel.AddStep(nParentID,[:name = cStepName])
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
			settextvalue(oItem.text(0))
			lcheck = exec()
		}
		if lCheck  {
			cText = oInput.textvalue()
			oItem.setText(0,cText)
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
			oParent.TakeChild(nIndex)
			oParent.InsertChild(nIndex-1,oItem)
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
			oParent.TakeChild(nIndex)
			oParent.InsertChild(nIndex+1,oItem)
			oParent.SetExpanded(True)
			oItem.SetExpanded(True)	
			oModel.MoveStepDown(nStepID)	
		}

	func PrintStepsAction
		oModel.PrintSteps()

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
		layoutBtns = new qHBoxLayout()
		{	
			AddWidget(btnAddStep)
			AddWidget(btnEditStep)
			AddWidget(btnDeleteStep)
			AddWidget(btnMoveStepUp)
			AddWidget(btnMoveStepDown)
			AddWidget(btnPrintSteps)
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

class StepsTreeView from TreeControl

	oFirststep

	func Init win
		super.init(win)
		setcolumncount(1)
		oFirststep = new qtreewidgetitem()
		oFirststep.settext(0,T_GD_FirstStep)
		addtoplevelitem(oFirststep)
		AddToTree(1,oFirstStep)
		setheaderlabel(T_GD_StepsTree)

	func AddStep nParentID,nID,cText
		AddNode(nParentID,nID,cText)

class TreeControl from qTreeWidget	

	aTree = []	# Node ID , Node Object , Node Object.pObject

	func AddNode nParentID,nID,cText
		oParent = GetObjByID(nParentID)
		oItem = new qtreewidgetitem()
		oItem.settext(0,cText)
		oParent.addchild(oItem)
		AddToTree(nID,oItem)
		setCurrentItem(oItem,0)	# To Display the item (become visible)
		setCurrentItem(oParent,0)	# Focus on Parent Step
		return oItem

	func GetObjByID id
		return aTree[std_find2(aTree,id,1)][2]

	func GetIDByObj oObj
		return aTree[std_find2(aTree,oObj.pObject,3)][1]

	func AddToTree nID,oObject
		aTree + [nID,oObject,oObject.pObject]

class GoalDesignerModel

	oStepsTreeModel = new TreeModel

	# Add the first step
	AddStep(0,[:name = T_GD_FirstStep])

	func AddStep nParent,Content
		nID =  oStepsTreeModel.AddNode(nParent,Content)
		return nID

	func EditStepName nStepID,cStepName
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		aContent[:name] = cStepName
		oStepsTreeModel.SetNodeContent(nStepID,aContent)

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

/*
	Tree Model Class
	We manage the tree data as a table
	The table contains the next columns
	nNodeID - nParentID - Content
*/

class TreeModel

	aList = []		# Tree Content [nNodeID - nParentID - Content]
	nID = 0		# Automatic ID for each node

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
