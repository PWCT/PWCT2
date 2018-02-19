/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  PWCT Main File
**	Date : 2016.10.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Load Ring Libraries
load "stdlib.ring"
load "guilib.ring"
load "tracelib.ring"

# Load General Libraries
load "general/globals/globals.ring"
load "general/mainlib.ring"

# Load the Translation File
load "translation/english.ring"

for item in sysargv item = lower(item) next 
if find(sysargv, :arabic) {
	eval( ' load "translation/arabic.ring" ' )
}

# We need this on macOS when we run the executable from finder!
if ismacosx() and justfilename(exefilename()) != "ring" {
	chdir(exefolder())
}

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
load "goaldesigner/controller/htmlfunctions.ring"

# Load Steps Colors Files
load "goaldesigner/controller/stepscolorscontroller.ring"
load "goaldesigner/view/stepscolorsview.ring"

# Load the Components Browser Files
load "componentsbrowser/controller/componentsbrowsercontroller.ring"
load "componentsbrowser/view/componentsbrowserview.ring"
load "componentsbrowser/view/componentstreeview.ring"
load "componentsbrowser/componentslist.ring"

# Load the component classes
load "component/controller/componentcontrollerparent.ring"
load "component/view/componentviewparent.ring"

# Load the File System Files
load "filesystem/databasesqlite.ring"
load "filesystem/databasesqliteqt.ring"
load "filesystem/database.ring"
load "filesystem/visualsourcefile.ring"

# Quick Message 
load "general/quickmsgController.ring"

# Load Components 
load "vpl/ringpwct/ringpwct.ring"

# Load the Form Designer 
	Load "../applications/formdesigner/formdesigner.ring"
	import formdesigner 

# Run PWCT Environment
Start_Environment()

/*
	The next function run the Goal Designer Alone
	It can be used for testing
	This function was used before creating the PWCT Environment
	Where everything started from creating the Goal Designer
	Parameters : None
	Output : None
*/

func Test_GoalDesigner

	new qApp {
		# Start the Goal Designer Window
			Open_Window(:GoalDesignerController)
		# Execute the Application (Give control to the GUI Loop)
			exec()
	}


/*
	The next function run the PWCT Environment
	This create the Main Window, Menubar, Toolbar, .. etc
	Also the Project Files and Goal Designer Dockable windows
	Parameters : None
	Output : None
*/

func Start_Environment

	# We have PWCT_APP as a global variable/object of the QApplication class
	PWCT_APP = new qApp {
		# We use the style with English User Interface only
			StyleFusion()
		# Dispaly the splash screen
			DisplaySplashScreen(PWCT_APP)
		# Start the PWCT Environment Window
			Open_Window(:EnvironmentController)
		# Execute the Application (Give control to the GUI Loop)
			exec()
	}

/*
	The next function display the Splash Screen
	This screen display an image present the PWCT Logo for one second
	Parameters : QApplication Object
	Output : None
*/

func DisplaySplashScreen oApp

	# Load the Image File
		oPixMap = new qPixMap(AppFile("images/pwctlogo.png"))
	# Create the Splash Screen Object
		oSplash = new qSplashScreen(oPixMap)
		oSplash.Show()
	# Wait for one second
		if ! PWCTIsMobile(:SplashScreen) {
			sleep(1)
		}		
	# Close the Splash Screen
		oSplash.Close()

/*
	The next function display a messagebox
	Parameters : The Window Title as String and The Message Content As String
	Output : None
*/

func ShowMessage cTitle,cMessage

	# Create the Messagebox Window
		win = new qmessagebox(NULL)
		{
			setwindowtitle(cTitle)
			settext(cMessage)
			setstandardbuttons(QMessageBox_Ok)
			setwindowflags(Qt_WindowStaysOnTopHint)
			setwinicon(win,AppFile("images/pwct.png"))
			result = exec()
		}


/*
	The next function to Control if we need to use the Mobile Settings or Not
*/

func PWCTIsMobile cOption	
	/*
	 We can use cOption to have more control on settings
	 cOption can be 
		:FontFamily		(Avoid Crash!)
		:Database		(Use Qt to access SQLite)
		:ComponentsBrowser	(Full Screen Window)
		:IPTitle		(Interaction Page Title Height)
		:Tabify			(GoalDesigner,Output,Project Files)
		:componentsfile		(Path to components file)
		:OpenFilesInNewTabs     (Open each PWCT file in separate Goal Designer)
		:StepsColorsMinimumWidth(Steps Colors - Label Minimum Width)
		:SplashScreen		(Splash Screen - Check for waiting)
		:UseComponentsFile	(Components Browser - Using Ring Code instead of SQLite)
		:RunApplication		(Run Application)
		:MobileAppLibs		(Loading Mobile Application Libs - guilib for mobile)
		:ComponentSelected	(Components Browser - After selecting a component)
		:DockForComponentsBrowser (Dockable window for components browser)
	*/
	//if cOption = :RunApplication or cOption = :SendDataToApplication  return True ok
	return isMobile()
