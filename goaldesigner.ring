/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer Window
**	Date : 2016.10.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "stdlib.ring"
load "guilib.ring"
load "translation/english.ring"

if filename()  = sysargv[2] {
	Test_GoalDesigner()
}

func Test_GoalDesigner

	new qApp {
		oGoalDesignerController = new GoalDesignerController
		oGoalDesignerController.Start()
		exec()
	}

class GoalDesignerView

	win = new qWidget() {
		setWindowTitle(T_GD_WindowTitle) # "Goal Designer"
		StepsTree = new StepsTree(win)
		layout1 = new qVBoxLayout()
		{	
			AddWidget(StepsTree)
		}		
		SetLayout(Layout1)
	}

	func Show
		win {showMaximized()} 

class GoalDesignerController

	oView = new GoalDesignerView
	oModel = new GoalDesignerModel

	func Start
		oView.Show()

class GoalDesignerModel

class StepsTree from qtreewidget	

	oFirststep
	cFirststeptext  = "The First Step"
	cStepsTreeText = "Steps Tree"

	func Init win
		super.init(win)
		setcolumncount(1)
		oFirststep = new qtreewidgetitem()
		oFirststep.settext(0,cFirststeptext)
		addtoplevelitem(oFirststep)
		setheaderlabel(cStepsTreeText )

	func AddNode oParent,cText
		myitem = new qtreewidgetitem()
		myitem.settext(0,cText)
		oParent.addchild(myitem)
