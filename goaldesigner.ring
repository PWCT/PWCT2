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

class GoalDesignerView

	win = new qWidget() {
		setWindowTitle(T_GD_WindowTitle) # "Goal Designer"
		StepsTree = new StepsTree(win)
		btnAddStep = new qPushButton(win) {
			setText("New Step")
			setClickEvent($objname+".AddStep()")
		}
		layout1 = new qVBoxLayout()
		{	
			AddWidget(btnAddStep)
			AddWidget(StepsTree)
		}		
		SetLayout(Layout1)
	}

	func Show
		win { showMaximized() }


class GoalDesignerController

	oView = new GoalDesignerView
	oModel = new GoalDesignerModel

	func Start
		oView.Show()

	func AddStep 
 

class GoalDesignerModel

	oStepsTreeModel = new TreeModel

	# Add the first step
	AddStep(0,[:name = T_GD_FirstStep])

	Func AddStep nParent,Content
		return oStepsTreeModel.AddNode(nParent,Content)


class StepsTree from qTreeWidget	

	oFirststep

	func Init win
		super.init(win)
		setcolumncount(1)
		oFirststep = new qtreewidgetitem()
		oFirststep.settext(0,T_GD_FirstStep)
		addtoplevelitem(oFirststep)
		addnode(oFirststep,"test")
		oNode = addnode(oFirststep,"test 2")
		addnode(oNode,"test 3")
		setheaderlabel(T_GD_StepsTree)

	func AddNode oParent,cText
		oItem = new qtreewidgetitem()
		oItem.settext(0,cText)
		oParent.addchild(oItem)
		return oItem

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

