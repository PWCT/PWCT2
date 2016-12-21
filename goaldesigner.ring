/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer Window
**	Date : 2016.10.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "stdlib.ring"
load "guilib.ring"

load "general/globals/globals.ring"
load "general/objectslib/objects.ring"
load "general/objectslib/subwindows.ring"

load "translation/english.ring"

load "goaldesigner/controller/goaldesignercontroller.ring"
load "goaldesigner/view/goaldesignerview.ring"
load "goaldesigner/view/stepcodeview.ring"
load "goaldesigner/view/htmlstyles.ring"
load "goaldesigner/view/stepstreeview.ring"
load "goaldesigner/view/treecontrol.ring"
load "goaldesigner/model/goaldesignermodel.ring"
load "goaldesigner/model/treemodel.ring"
load "goaldesigner/controller/findstepcontroller.ring"
load "goaldesigner/view/findstepview.ring"
load "goaldesigner/controller/printstepscontroller.ring"
load "goaldesigner/view/printstepsview.ring"
load "goaldesigner/model/interactionmodel.ring"

if filename()  = sysargv[2] {
	Test_GoalDesigner()
}

func Test_GoalDesigner

	new qApp {
		Open_Window(:GoalDesignerController)
		exec()
	}
