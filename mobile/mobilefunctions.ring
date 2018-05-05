/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Functions for the PWCT on Mobile 
**	Date : 2018.05.05
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


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
		:WindowDimensions	(PWCT Environment Window - Move() & Resize())
		:ToolsDistributeMenu	(PWCT Environment - Menubar - Tools/Distribute Menu)
		:StepsTreeScrollBars	(Goal Designer - Steps Tree - Horizontal Scrollbars)
		:GoalDesignerButtonsSize(Goal Designer - Buttons - Width and height)
		:GoalDesignerButtons	(Buttons that works on the steps tree)
		:DisplayLoadingMessage	(Environemnt - Change file - loading message)
		:ShowLoadingMessage	(Environment - Change file - Form File - loading message)
	*/
	//if cOption = :RunApplication or cOption = :SendDataToApplication  return True ok
	return isMobile()

/*
	This function will create the PWCT folder on the mobile
	Then will add the application files from resources to this folder 
*/

func CreateMobileFiles
	cDir = currentdir()
	QStandardPaths_GenericDataLocation = 11
	oPath = new QStandardPaths
	cPath = oPath.writableLocation(QStandardPaths_GenericDataLocation)
	oDir = new qDir() {
		setCurrent(cPath)
		MkDir("PWCTApp")
		setCurrent(cPath+"/PWCTApp")
		MkDir("runtime")
		MkDir("templates")
	}	
	oFile = new qFile()
	oFile.copy_2(":/mobileapp/mobileapplibs.ring",cPath+"/PWCTApp/runtime/mobileapplibs.ring")
	oFile.copy_2(":/templates/formcontroller.pwct",cPath+"/PWCTApp/templates/formcontroller.pwct")
	oFile.copy_2(":/templates/arabic_formcontroller.pwct",cPath+"/PWCTApp/templates/arabic_formcontroller.pwct")
	chdir(cPath)
	remove("pwct.ringo")
	chdir(cDir)
