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

	func AddStep 
		oItem  = oView.oStepsTree.currentItem()
		nParentID = oView.oStepsTree.IDByObj(oItem)
 		nStepID = oModel.AddStep(nParentID,[:name = "test"])
		oView.oStepsTree.addnode(nParentID,nStepID,"test")

class GoalDesignerView

	win = new qWidget() {
		setWindowTitle(T_GD_WindowTitle) # "Goal Designer"
		oStepsTree = new StepsTreeView(win)
		btnAddStep = new qPushButton(win) {
			setText("New Step")
			setClickEvent($objname+".AddStep()")			
		}
		layout1 = new qVBoxLayout()
		{	
			AddWidget(btnAddStep)
			AddWidget(oStepsTree)
		}		
		SetLayout(Layout1)
	}

	func Show
		win { showMaximized() }

class StepsTreeView from qTreeWidget	

	oFirststep

	aTree = []	# Node ID , Node Object , Node Object.pObject

	func Init win
		super.init(win)
		setcolumncount(1)
		oFirststep = new qtreewidgetitem()
		oFirststep.settext(0,T_GD_FirstStep)
		addtoplevelitem(oFirststep)
		AddToTree(1,oFirstStep)
		setheaderlabel(T_GD_StepsTree)

	func AddNode nParentID,nID,cText
		oParent = objbyid(nParentID)
		oItem = new qtreewidgetitem()
		oItem.settext(0,cText)
		oParent.addchild(oItem)
		AddToTree(nID,oItem)
		return oItem

	func ObjByID id
		return aTree[std_find2(aTree,id,1)][2]

	func IDByObj oObj
		return aTree[std_find2(aTree,oObj.pObject,3)][1]

	func AddToTree nID,oObject
		aTree + [nID,oObject,oObject.pObject]

class GoalDesignerModel

	oStepsTreeModel = new TreeModel

	# Add the first step
	AddStep(0,[:name = T_GD_FirstStep])

	Func AddStep nParent,Content
		nID =  oStepsTreeModel.AddNode(nParent,Content)
		return nID

/*
	Tree Model Class
	nNodeID	-   nParentID   -  Content
*/

class TreeModel

	aList = []		# Tree Content
	nID = 0		# Automatic ID for each node

	Func AddNode  nParent,Content
		nID++	# Increase the Automatic ID by 1
		aList + [nID, nParent, Content]
		return nID	# Return the Node ID

