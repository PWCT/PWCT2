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
	load "general/log.ring"

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
	load "goaldesigner/goaldesigner.ring"

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
	load "formdesigner/formdesigner.ring"

# Load the Web Server - ServerPrepare Class
	load "../libdepwin/Apache2.2/ring/prepare.ring"

# Mobile functions 
	load "mobile/mobilefunctions.ring"

# Run PWCT Environment
	Start_Environment()


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
		else 
			CreateMobileFiles()
		}		
	# Close the Splash Screen
		oSplash.Close()
		oPixMap.delete()

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


