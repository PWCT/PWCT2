/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Environment Controller Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class EnvironmentController from WindowsControllerParent

	cCurrentDir = CurrentDir() + "/"	# The PWCT Folder
	cSettingsFile = cCurrentDir + "pwct.ini"
	cFont = "MS Shell Dlg 2,14,-1,5,50,0,0,0,0,0"
	nFontSize = 12

	lShowFilesManager = True
	lShowGoalDesigner = True
	lShowOutputWindow = True

	lDockForComponentsBrowserIsVisible = False
	nComponentsBrowserWindowID

	lTabifyOutputAndFiles = 0

	if PWCTIsMobile(:OpenFilesInNewTabs) {
		lOpenFilesInNewTabs = False 
	else 
		lOpenFilesInNewTabs = True
	}

	/* 
		[Dockable Window Object, 
		 Visual Source File Name, 
		 Steps Tree Object, 
		 Goal Designer Object   ]
	*/
		aActiveFiles = []	
		lActiveGoalDesignerChanged = True

	oView = new EnvironmentView

	SetParents()
	# Default Settings
		parent().activate()
	/*
		Purpose : Show the window
		Parameters : None
		Output : None
	*/
	func Start
		super.Start()
		LoadSettings()	
		# Add the Default file (NoName) to the Active Files List
			aActiveFiles + [oView.oDockGoalDesigner,parent().oVisualSourceFile.cFileName]
			aActiveFiles[len(aActiveFiles)] + parent().oView.oStepsTree
			aActiveFiles[len(aActiveFiles)] + parent()
		# Goal Designer - Default file 
			oView.oDockGoalDesigner.setWindowTitle(
				T_ENV_DOCK_GOALDESIGNER + " : " + parent().oVisualSourceFile.cFileName)
		if IsDockForComponentsBrowser() {
			oView.win.tabifydockwidget(oView.oDockOutputWindow,oView.oDockComponentsBrowser)
		}
		if lTabifyOutputAndFiles {
			if T_LAYOUTDIRECTION = 0 {
				oView.win.tabifydockwidget(oView.oDockOutputWindow,oView.oDockFilesManager)
			else 
				oView.win.tabifydockwidget(oView.oDockFilesManager,oView.oDockOutputWindow)
			}
			oView.oDockOutputWindow.raise()
		}

		if PWCTIsMobile(:Tabify) {
			oView.win.tabifydockwidget(oView.oDockOutputWindow,oView.oDockFilesManager)
			oView.win.tabifydockwidget(oView.oDockOutputWindow,oView.oDockGoalDesigner)
			oView.oDockGoalDesigner.raise()
		}

	/*
		Purpose : Set the Parent Object for Environment and goal designer
		Parameters : None
		Output : None
	*/

	func SetParents
		# Set the parent to be the Goal Designer Window	
			setParentObject(Last_Window())
		# Set the goal designer parent to be the Environment window
			Last_Window().setParentObject(self)


	/*
		Purpose : New File Action
		Parameters : None
		Output : None
	*/

	func NewAction
		parent().NewFileAction()

	/*
		Purpose : Open File Action
		Parameters : None
		Output : None
	*/

	func OpenAction
		parent().OpenFileAction()

	/*
		Purpose :  Save File Action
		Parameters : None
		Output : None
	*/

	func SaveAction
		parent().SaveCurrentFileAction()

	/*
		Purpose : File Save As Action
		Parameters : None
		Output : None
	*/

	func SaveAsAction
		parent().SaveFileAction()

	/*
		Purpose : Run File Action
		Parameters : None
		Output : None
	*/

	func RunAction
		parent().RunAction()

	/*
		Purpose : Run GUI Application Action
		Parameters : None
		Output : None
	*/

	func RunGUIAction
		parent().RunGUIAction()

	/*
		Purpose : Debug Program Action
		Parameters : None
		Output : None
	*/

	func DebugAction
		parent().DebugAction()

	/*
		Purpose : Change Opened File Action
		Parameters : None
		Output : None
	*/

	func ChangeFileAction	
		nClock = clock()
		oItem = oView.tree1.currentindex()
		if oView.oFile.isdir(oItem) {
			return
		}
		cFileName = oView.oFile.filepath(oItem)
		# If the file is already opened, Activate the window
			if lOpenFilesInNewTabs {
				nPos = find(aActiveFiles,cFileName,2)
				if nPos {
					aActiveFiles[nPos][1].show()
					aActiveFiles[nPos][1].raise()
					aActiveFiles[nPos][3].setfocus(0)
					oView.tree1.setfocus(0)
					SetParentForComponentsBrowser(aActiveFiles[nPos][4])
					return
				}
			}
		# Display Message
			open_windowandlink(:quickmsgController,self)
			# "Loading the Visual Source File..."
			QuickMsg().setText(T_ENV_LOADING)
			oView.Tree1.blocksignals(True)
			PWCT_APP.processevents()
			oView.Tree1.blocksignals(False)
		lActiveGoalDesignerChanged = false
		if (Parent().IsFileOpened() or not Parent().IsFileEmpty()) and lOpenFilesInNewTabs {
			oDock = oView.CreateGoalDesigner(oView.win)
			oDock.setWindowTitle(JustFileName(cFileName))
			SetParents()
			oView.win.tabifydockwidget(oView.oDockGoalDesigner,oDock)
			# We need both of them (Show & Raise)
				oDock.show()
				oDock.raise()
			# Set the Goal Designer Font
				GoalDesignerFont()
			# Add the file to the Active Files List 
				aActiveFiles + [oDock,cFileName]
		else
			oView.oDockGoalDesigner.setWindowTitle(JustFileName(cFileName))
			# Add the file to the Active Files List 
				aActiveFiles + [oView.oDockGoalDesigner,cFileName]
		}
		# Add the Steps Tree to the aActiveFiles list 
			aActiveFiles[len(aActiveFiles)] + parent().oView.oStepsTree
			aActiveFiles[len(aActiveFiles)] + parent()
		parent().oVisualSourceFile.cFileName = cFileName
		parent().OpenFileAction2()
		# Set focus to the Steps Tree to be used when we Run the application
			parent().oView.oStepsTree.setfocus(0)
		# Set focus to the Files Manager Tree
			oView.tree1.setfocus(0)
		lActiveGoalDesignerChanged = True
		if PWCTIsMobile(:OpenFilesInNewTabs) {
			oView.oDockGoalDesigner.show()
			oView.oDockGoalDesigner.raise()
		}
		showmessageInStatusBar("Change File Time: " + ( (clock()-nClock) / Clockspersecond() ) )
		QuickMsg().CloseMsg()

	/*
		Purpose : Remove file from the Active Files List
		Parameters : The File Name as String
		Output : None
	*/
	
	func RemoveFileFromActiveFilesList cFileName 
		nPos = find(aActiveFiles,cFileName,2)
		if nPos {
			del(aActiveFiles,nPos)
		}


	func ActiveGoalDesignerChanged
		if not lActiveGoalDesignerChanged {
			return
		}
		for aItem in aActiveFiles {
			if not aItem[1].visibleregion().isEmpty() {
				aItem[3].setfocus(0)
				SetParentForComponentsBrowser(aItem[4])
				return
			}
		}


	/*
		Purpose : Close Action - Close the window and the application 
		Parameters : None
		Output : None
	*/

	func CloseAction		
		saveSettings()
		PWCT_APP.Quit()

	/*
		Purpose : Print File Action
		Parameters : None
		Output : None
	*/

	func PrintAction
		parent().PrintStepsAction()

	/*
		Purpose : Cut Action
		Parameters : None
		Output : None
	*/

	func CutAction
		parent().CutStepsAction()

	/*
		Purpose : Copy Action
		Parameters : None
		Output : None
	*/

	func CopyAction
		parent().CopyStepsAction()

	/*
		Purpose : Paste Action
		Parameters : None
		Output : None
	*/

	func PasteAction
		parent().PasteStepsAction()

	/*
		Purpose :  Font Action
		Parameters : None
		Output : None
	*/

	func FontAction
		parent().FontAction()		

	/*
		Purpose : Colors Action 
		Parameters : None
		Output : None
	*/
	
	func ColorsAction
		parent().ColorsAction()

	/*
		Purpose : Find Action
		Parameters : None
		Output : None
	*/

	func FindAction
		parent().SearchAction()

	/*
		Purpose : Project Action
		Parameters : None
		Output : None
	*/

	func ProjectAction
		ToggleVisible(oView.oDockFilesManager)

	/*
		Purpose : Goal Designer Action
		Parameters : None
		Output : None
	*/

	func GoalDesignerAction
		ToggleVisible(oView.oDockGoalDesigner)

	/*
		Purpose : Output Window Action
		Parameters : None
		Output : None
	*/

	func OutputWindowAction
		ToggleVisible(oView.oDockOutputWindow)

	/*
		Purpose : ToggleVisible Action
		Parameters : None
		Output : None
	*/

	func ToggleVisible oObject
		if oObject.isvisible() {
			oObject.hide()
		else
			oObject.Show()
		}

	/*
		Purpose : Open Help - CHM File 
		Parameters : None
		Output : None
	*/

	func CHMAction
		new QDesktopServices {
			OpenURL(new qURL("file:///"+substr(exefolder(),"\","/")+"../docs/ring.chm") )
		}


	/*
		Purpose : Open Help - PDF File
		Parameters : None
		Output : None
	*/

	func PDFAction
		new QDesktopServices {
			OpenURL(new qURL("file:///"+substr(exefolder(),"\","/")+"../docs/ring.pdf") )
		}


	/*
		Purpose : Menubar - Language Item Action
		Parameters : None
		Output : None
	*/

	func LanguageAction
		ShowMessage("Programming Language",
		"This application developed using the Ring programming language")

	/*
		Purpose : Menubar - Help Menu - GUI Item Action
		Parameters : None
		Output : None
	*/

	func GUIAction
		ShowMessage("GUI Library",
		"This application uses the Qt GUI Library through RingQt")

	/*
		Purpose : Menubar - Help Menu - About Item Action
		Parameters : None
		Output : None
	*/

	func AboutAction
		ShowMessage("About",
		"2017, Mahmoud Fayed <msfclipper@yahoo.com>")	


	/*
		Purpose : Send Process Data
		Parameters : None
		Output : None
	*/

	func sendDataAction
		oView {
			if ISNULL(oProcess) { return }
			cText = oProcessText.text() + windowsnl()
			oProcess.write(cText ,len(cText))
			oProcessEditbox.insertplaintext(cText)
		}

	/*
		Purpose : Get Process Data
		Parameters : None
		Output : None
	*/

	func getDataAction
		oView {
			if ISNULL(oProcess) { return }
			cText = oProcess.readallstandardoutput().data()
 			oProcessEditbox.insertplaintext(cText)
		}

	/*
		Purpose : Save Settings 
		Parameters : None
		Output : None
	*/

	func SaveSettings
		cFont = parent().cFont
		nFontSize = parent().oView.oStepsTree.nFontSize
		cSettings = "C_STEPCOLOR_COMMENT_TEXT = '" + C_STEPCOLOR_COMMENT_TEXT + "'" + nl + 
				 "C_STEPCOLOR_COMMENT_BACKCOLOR = '" + C_STEPCOLOR_COMMENT_BACKCOLOR + "'" + nl + 
				"C_STEPCOLOR_ROOT_TEXT = '" + C_STEPCOLOR_ROOT_TEXT + "'" + nl + 
				"C_STEPCOLOR_ROOT_BACKCOLOR = '" + C_STEPCOLOR_ROOT_BACKCOLOR + "'" + nl + 
				"C_STEPCOLOR_ALLOWINTERACTION_TEXT = '" + C_STEPCOLOR_ALLOWINTERACTION_TEXT + "'" + nl + 
				"C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = '" + C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR + "'" + nl + 
				"C_STEPCOLOR_INFO_TEXT = '" + C_STEPCOLOR_INFO_TEXT + "'" + nl + 
				"C_STEPCOLOR_INFO_BACKCOLOR = '" + C_STEPCOLOR_INFO_BACKCOLOR + "'" + nl + 
				"C_STEPCOLOR_DATA_TEXT = '" + C_STEPCOLOR_DATA_TEXT + "'" + nl + 
				"C_STEPCOLOR_DATA_BACKCOLOR = '" + C_STEPCOLOR_DATA_BACKCOLOR + "'" + nl + 
				"cFont = '" + cFont + "'" + nl + 
			    "nFontSize = " + nFontSize  + nl + 
			    "lShowFilesManager = " + oView.oDockFilesManager.isvisible() + nl +
			    "lShowGoalDesigner = " + oView.oDockGoalDesigner.isvisible() + nl +
			    "lShowOutputWindow = " + oView.oDockOutputWindow.isvisible() + nl 
		cSettings = substr(cSettings,nl,char(13)+char(10))
		write(cSettingsFile,cSettings)

	/*
		Purpose : Load Settings
		Parameters : None
		Output : None
	*/

	func LoadSettings	
		if fexists(cSettingsFile) { 
			eval(read(cSettingsFile))
			RestoreSettings()	
		}

	/*
		Purpose : Restore Settings
		Parameters : None
		Output : None
	*/

	func RestoreSettings

 		if lShowFilesManager {
			oView.oDockFilesManager.show()
		else
			oView.oDockFilesManager.hide()
		}

		if lShowGoalDesigner {
			oView.oDockGoalDesigner.show()
		else
			oView.oDockGoalDesigner.hide()
		}

		if lShowOutputWindow {
			oView.oDockOutputWindow.show()
		else
			oView.oDockOutputWindow.hide()
		}
		GoalDesignerFont()

	func GoalDesignerFont
		# Set The Goal Designer Font
			parent().cFont = cFont
			parent().UpdateFont()
			parent().oView.oStepsTree.nFontSize = nFontSize			
			parent().UpdateFontSize()

	func IsDockForComponentsBrowser
		return oView.lDockForComponentsBrowser


	func SetParentForComponentsBrowser oParent
		# if we are using dockable window for the components browser 
		# Set the parent for the components browser window 
		if lDockForComponentsBrowserIsVisible {
			parent().componentsBrowserWindow().setParentObject(oParent)
		}

	func ShowMessageInStatusBar cMsg
		oView.oStatusBar.showMessage(cMsg,0)
