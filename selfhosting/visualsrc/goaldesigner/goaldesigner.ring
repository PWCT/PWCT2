#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  Loading the goal designer files
#**	Date : 2019.01.31
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
#Load the Goal Designer Files
load "goaldesignercontroller.ring"
load "findstepcontroller.ring"
load "printstepscontroller.ring"
load "timemachinecontroller.ring"
load "programcontroller.ring"
load "htmlfunctions.ring"
load "stepscolorscontroller.ring"
load "playasmoviecontroller.ring"
load "automaticdocumentation.ring"
load "autocomplete.ring"
load "undocontroller.ring"
load "gotolinecontroller.ring"
load "goaldesignerview.ring"
load "stepcodeview.ring"
load "htmlstyles.ring"
load "stepstreeview.ring"
load "treelabel.ring"
load "treecontrol.ring"
load "findstepview.ring"
load "printstepsview.ring"
load "timemachineview.ring"
load "stepscolorsview.ring"
load "gotolineview.ring"
load "goaldesignermodel.ring"
load "treemodel.ring"
load "interactionmodel.ring"
#/*
#	The next function run the Goal Designer Alone
#	It can be used for testing
#	This function was used before creating the PWCT Environment
#	Where everything started from creating the Goal Designer
#*/
func Test_GoalDesigner  { 
	new qApp
	{
		#Start the Goal Designer Window
		Open_Window(:GoalDesignerController)
		#Execute the Application (Give control to the GUI Loop)
		exec()
	}
} 
