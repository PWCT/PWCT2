/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  The Environment Main File
**	Date : 2019.01.30
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Load the Environment Files
	load "controller/environmentcontroller.ring"
	load "view/environmentview.ring"

/*
	The next function run the PWCT Environment
	This create the Main Window, Menubar, Toolbar, .. etc
	Also the Project Files and Goal Designer Dockable windows
	Parameters : None
	Output : None
*/

func StartEnvironment

	# We have PWCT_APP as a global variable/object of the QApplication class
	PWCT_APP = new qApp {
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
		if ! PWCTIsMobile(:SplashScreen) {
			# Load the Image File
				oPixMap = new qPixMap(AppFile("images/pwctlogo.png"))
			# Create the Splash Screen Object
				oSplash = new qSplashScreen(oPixMap)
				oSplash.Show()
			# Wait for one second
				sleep(1)
			# Close the Splash Screen
				oSplash.Close()
				oPixMap.delete()		
		else 
			oSystemLog.addMessage("Create Mobile Files ... Started")
			CreateMobileFiles()
			oSystemLog.addMessage("Create Mobile Files ... Done")
		}		

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


