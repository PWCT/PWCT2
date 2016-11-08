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
	


class GoalDesignerView

	win = new qWidget() {
		setWindowTitle(T_GD_WindowTitle) # "Goal Designer"
		oStepsTree = new StepsTreeView(win)
		btnAddStep = new qPushButton(win) {
			setText("New Step")
			setClickEvent($objname+".AddStepAction()")			
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

class TreeControl from qTreeWidget	

	aTree = []	# Node ID , Node Object , Node Object.pObject

	func AddStep nParentID,nID,cText
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

/*
	Tree Model Class
	We manage the tree data as a table
	The table contains the next columns
	nNodeID - nParentID - Content
*/

class TreeModel

	aList = []		# Tree Content
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
			if aList[x][1] = nParent {
				for x2 = x+1 to len(aList) {
					if aList[x2][2] != nParent {
						return x2-1
					}
				}
			}
		}
		return len(aList)



		
