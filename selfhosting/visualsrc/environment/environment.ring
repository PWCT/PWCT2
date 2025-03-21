#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  The Environment Main File
#**	Date : 2019.01.30
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
#Load the Environment Files
load "environmentcontroller.ring"
load "environmentview.ring"
load "treeviewcontrol.ring"
load "pwctdesktop.ring"
#/*
#	The next function run the PWCT Environment
#	This create the Main Window, Menubar, Toolbar, .. etc
#	Also the Project Files and Goal Designer Dockable windows
#	Parameters : None
#	Output : None
#*/
func StartEnvironment  { 
	#We have PWCT_APP as a global variable/object of the QApplication class
	PWCT_APP = new qApp
	{
		setLayoutDirection(T_LAYOUTDIRECTION)
		#Dispaly the splash screen
		DisplaySplashScreen(PWCT_APP)
		#Start the PWCT Environment Window
		Open_Window(:EnvironmentController)
		#Execute the Application (Give control to the GUI Loop)
		exec()
	}
} 
func EnvironmentWindow  { 
	return GetWindowByID( nEnvironmentWindowID ) 
	#/*
	#	The next function display the Splash Screen
	#	This screen display an image present the PWCT Logo for one second
	#	Parameters : QApplication Object
	#	Output : None
	#*/
} 
func DisplaySplashScreen oApp { 
	if !PWCTIsMobile(:SplashScreen) { 
		#Load the Image File
		#Create the Splash Screen Object
		oPixMap = new qPixMap(AppFile("images/oldpwctlogo.jpg"))
		oSplash = new qSplashScreen(oPixMap)
		#Wait for some time
		oSplash.Show()
		sleep(1.5)
		#Close the Splash Screen
		oSplash.Close()
		oPixMap.delete()
		else
			oSystemLog.addMessage("Create Mobile Files ... Started")
			CreateMobileFiles()
			oSystemLog.addMessage("Create Mobile Files ... Done")
	} 
	#/*
	#	The next function display a messagebox
	#	Parameters : The Window Title as String and The Message Content As String
	#	Output : None
	#*/
} 
func ShowMessage cTitle,cMessage { 
	msginfo(cTitle,cMessage)
} 
