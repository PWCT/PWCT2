/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Loading the goal designer files
**	Date : 2019.01.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Load the Goal Designer Files

	load "controller/goaldesignercontroller.ring"
	load "controller/findstepcontroller.ring"
	load "controller/printstepscontroller.ring"
	load "controller/timemachinecontroller.ring"
	load "controller/programcontroller.ring"
	load "controller/htmlfunctions.ring"
	load "controller/stepscolorscontroller.ring"
	load "controller/playasmoviecontroller.ring"
	load "controller/automaticdocumentation.ring"
	load "controller/autocomplete.ring"
	load "controller/undocontroller.ring"
	load "controller/gotolinecontroller.ring"

	load "view/goaldesignerview.ring"
	load "view/stepcodeview.ring"
	load "view/htmlstyles.ring"
	load "view/stepstreeview.ring"
	load "view/treecontrol.ring"
	load "view/findstepview.ring"
	load "view/printstepsview.ring"
	load "view/timemachineview.ring"
	load "view/stepscolorsview.ring"
	load "view/gotolineview.ring"

	load "model/goaldesignermodel.ring"
	load "model/treemodel.ring"
	load "model/interactionmodel.ring"

/*
	The next function run the Goal Designer Alone
	It can be used for testing
	This function was used before creating the PWCT Environment
	Where everything started from creating the Goal Designer
*/

func Test_GoalDesigner

	new qApp {
		# Start the Goal Designer Window
			Open_Window(:GoalDesignerController)
		# Execute the Application (Give control to the GUI Loop)
			exec()
	}
