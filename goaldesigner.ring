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
		oGoalDesigner = new GoalDesigner
		exec()
	}

class GoalDesigner
	win = new qWidget() {
		setWindowTitle(T_GD_WindowTitle) # "Goal Designer"
		tree1 = new qtreewidget(win) {
			setGeometry(0,0,400,400)
			setcolumncount(1)
			firststep = new qtreewidgetitem()
			firststep.settext(0,"The First Step")
			addtoplevelitem(firststep)
			setheaderlabel("Steps Tree")
		}		
		showMaximized()
	}
