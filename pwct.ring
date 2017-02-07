/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  PWCT Main File
**	Date : 2016.10.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Load Ring Libraries
load "stdlib.ring"
load "guilib.ring"

# Load General Libraries
load "general/globals/globals.ring"

# Load the Translation File
load "translation/english.ring"
#load "translation/arabic.ring"

# Load the Environment Files
load "environment/controller/environmentcontroller.ring"
load "environment/view/environmentview.ring"

# Load the Goal Designer Files
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
load "goaldesigner/view/timemachineview.ring"
load "goaldesigner/controller/timemachinecontroller.ring"
load "goaldesigner/controller/programcontroller.ring"

# Load the Components Browser Files
load "componentsbrowser/controller/componentsbrowsercontroller.ring"
load "componentsbrowser/view/componentsbrowserview.ring"
load "componentsbrowser/view/componentstreeview.ring"

# Load the component classes
load "component/controller/componentcontrollerparent.ring"
load "component/view/componentviewparent.ring"

# Load the File System Files
load "filesystem/databasesqlite.ring"
load "filesystem/database.ring"
load "filesystem/visualsourcefile.ring"

if IsMainSourceFile() {
	Start_Environment()
}

func Test_GoalDesigner

	new qApp {
		Open_Window(:GoalDesignerController)
		exec()
	}

func Start_Environment

	PWCT_APP = new qApp {
		StyleFusion()
		Open_Window(:EnvironmentController)
		exec()
	}

func ShowMessage cTitle,cMessage 

	new qmessagebox(NULL)
	{
		setwindowtitle(cTitle)
		settext(cMessage)
		setstandardbuttons(QMessageBox_Ok)
		result = exec()
	}
