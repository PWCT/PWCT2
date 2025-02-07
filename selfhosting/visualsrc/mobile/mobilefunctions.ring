#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  Functions for the PWCT on Mobile
#**	Date : 2018.05.05
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
C_MOBILEVERSION = "PWCT 2.0 For Mobile - 2021.08.16"
#/*
#	The next function to Control if we need to use the Mobile Settings or Not
#*/
func PWCTIsMobile cOption { 
	#/*
	#	 We can use cOption to have more control on settings
	#	 cOption can be
	#		:FontFamily		(Avoid Crash!)
	#		:Database		(Use Qt to access SQLite)
	#		:ComponentsBrowser	(Full Screen Window)
	#		:IPTitle		(Interaction Page Title Height)
	#		:Tabify			(GoalDesigner,Output,Project Files)
	#		:componentsfile		(Path to components file)
	#		:OpenFilesInNewTabs     (Open each PWCT file in separate Goal Designer)
	#		:StepsColorsMinimumWidth(Steps Colors - Label Minimum Width)
	#		:SplashScreen		(Splash Screen - Check for waiting)
	#		:UseComponentsFile	(Components Browser - Using Ring Code instead of SQLite)
	#		:RunApplication		(Run Application)
	#		:MobileAppLibs		(Loading Mobile Application Libs - guilib for mobile)
	#		:ComponentSelected	(Components Browser - After selecting a component)
	#		:DockForComponentsBrowser (Dockable window for components browser)
	#		:WindowDimensions	(PWCT Environment Window - Move() & Resize())
	#		:ToolsDistributeMenu	(PWCT Environment - Menubar - Tools/Distribute Menu)
	#		:StepsTreeScrollBars	(Goal Designer - Steps Tree - Horizontal Scrollbars)
	#		:GoalDesignerButtonsSize(Goal Designer - Buttons - Width and height)
	#		:GoalDesignerButtons	(Buttons that works on the steps tree)
	#		:DisplayLoadingMessage	(Environemnt - Change file - loading message)
	#		:ShowLoadingMessage	(Environment - Change file - Form File - loading message)
	#		:GoalDesignerFullScreen	(Goal Designer - Full Screen Button)
	#		:OnlyPWCTFilesFolder	(Show only PWCTFiles folder)
	#		:DefaultMode		(Default mode for the PWCT Environment dockable windows)
	#	*/
	#if cOption = :RunApplication or cOption = :SendDataToApplication  return True ok
	if isWebAssembly() { 
		switch cOption { 
			case :GoalDesignerButtonsSize
				return False
			case :ComponentsBrowser
				return False
			case :DockForComponentsBrowser
				return False
			case :ComponentSelected
				return False
			case :Tabify
				return False
			case :InteractionPagesInGoalDesigner
				return False
			case :IPTitle
				return False
			case :StepsTreeIndentation
				return False
			case :GoalDesignerButtons
				return False
			case :DefaultMode
				return False
			case :ComponentsBrowserFont
				return False
			case :ComponentsButtonsSize
				return False
			case :CloseCBAfterRingCode2PWCT
				return False
			case :SpecialSearchWindow
				return False
			case :ComponentsBrowserOkCancel
				return False
		} 
	} 
	return isMobile() | isWebAssembly() 
} 
func CreateMobileFiles  { 
	if isWebAssembly() { 
		oFile = new qFile()
		oFile.copy_2(":/mobileapp/mobileapplibs.ring","mobileapplibs.ring")
		oFile.copy_2(":/mobileapp/mobileapplibs2.ring","mobileapplibs2.ring")
		oFile.copy_2(":/mobileapp/mobileapplibs3.ring","mobileapplibs3.ring")
		oFile.copy_2(":/templates/formcontroller.pwct","formcontroller.pwct")
		oFile.copy_2(":/templates/arabic_formcontroller.pwct","arabic_formcontroller.pwct")
		oFile.copy_2(":/vpl/arabiccomponents.pwct","arabiccomponents.pwct")
		oFile.copy_2(":/vpl/components.pwct","components.pwct")
		return 
	} 
	cDir = currentdir()
	QStandardPaths_GenericDataLocation = 11
	oPath = new QStandardPaths
	cPath = oPath.writableLocation(QStandardPaths_GenericDataLocation)
	C_VERSIONFILE = cPath+"/PWCTApp/runtime/version.txt"
	if fexists(C_VERSIONFILE) { 
		if read(C_VERSIONFILE) = C_MOBILEVERSION { 
			return 
		} 
	} 
	oDir = new qDir()
	{
		setCurrent(cPath)
		MkDir("PWCTFiles")
		MkDir("PWCTApp")
		setCurrent(cPath+"/PWCTApp")
		MkDir("runtime")
		MkDir("templates")
	}
	oFile = new qFile()
	oFile.copy_2(":/mobileapp/mobileapplibs.ring",cPath+"/PWCTApp/runtime/mobileapplibs.ring")
	oFile.copy_2(":/mobileapp/mobileapplibs2.ring",cPath+"/PWCTApp/runtime/mobileapplibs2.ring")
	oFile.copy_2(":/mobileapp/mobileapplibs3.ring",cPath+"/PWCTApp/runtime/mobileapplibs3.ring")
	oFile.copy_2(":/templates/formcontroller.pwct",cPath+"/PWCTApp/templates/formcontroller.pwct")
	oFile.copy_2(":/templates/arabic_formcontroller.pwct",cPath+"/PWCTApp/templates/arabic_formcontroller.pwct")
	oFile.copy_2(":/vpl/arabiccomponents.pwct",cPath+"/PWCTApp/arabiccomponents.pwct")
	oFile.copy_2(":/vpl/components.pwct",cPath+"/PWCTApp/components.pwct")
	write(C_VERSIONFILE,C_MOBILEVERSION)
	#chdir(cPath)
	#remove("pwct.ringo")
	chdir(cDir)
} 
