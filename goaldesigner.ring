/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer Window
**	Date : 2016.10.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "stdlib.ring"
load "guilib.ring"
load "general/globals.ring"
load "general/objects.ring"
load "translation/english.ring"

load "goaldesigner/goaldesignercontroller.ring"
load "goaldesigner/goaldesignerview.ring"
load "goaldesigner/stepcodeview.ring"
load "goaldesigner/htmlstyles.ring"
load "goaldesigner/stepstreeview.ring"
load "goaldesigner/treecontrol.ring"
load "goaldesigner/goaldesignermodel.ring"
load "goaldesigner/treemodel.ring"
load "goaldesigner/findstepcontroller.ring"
load "goaldesigner/findstepview.ring"
load "goaldesigner/printstepscontroller.ring"
load "goaldesigner/printstepsview.ring"

if filename()  = sysargv[2] {
	Test_GoalDesigner()
}

func Test_GoalDesigner

	new qApp {
		Open_Window(:GoalDesignerController)
		exec()
	}
