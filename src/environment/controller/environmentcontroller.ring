/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Environment Controller Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class EnvironmentController from WindowsControllerParent

	cCurrentDir = CurrentDir() + "/"	# The PWCT Folder
	if PWCTISMobile(:INIFile) {
		cSettingsFile = cCurrentDir + "/PWCTApp/runtime/pwct.ini"
	else 
		cSettingsFile = cCurrentDir + "pwct.ini"
	}
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
		lOpenFilesInNewTabs = False
	}

	lUseOpenFilesTimer = False

	if PWCTIsMobile(:UseLoadingMessage) {
		lUseLoadingMessage	= True
	else 
		lUseLoadingMessage	= False
	}
	lDisplayLoadingMessage 	= True

	lUseSetModeWorkAround   = False

	/* 
		[Dockable Window Object, 
		 Visual Source File Name, 
		 Steps Tree Object, 
		 Goal Designer Object   ]
	*/
		aActiveFiles = []	
		lActiveGoalDesignerChanged = True

	cFormFile = ""

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
		oView.win.blocksignals(True)
		oView.win.setupdatesenabled(False)
		oView.win.showmaximized()
		super.Start()
		LoadSettings()	
		# Add the Default file (NoName) to the Active Files List
			aActiveFiles + [oView.oDockGoalDesigner,parent().oVisualSourceFile.cFileName]
			aActiveFiles[len(aActiveFiles)] + parent().oView.oStepsTree
			aActiveFiles[len(aActiveFiles)] + parent()
		# Goal Designer - Default file 
			oView.oDockGoalDesigner.setWindowTitle(
				T_ENV_DOCK_GOALDESIGNER + " : " + parent().oVisualSourceFile.cFileName)
		if IsDockForComponentsBrowser() and not oView.lOutpuWindowInBottom {
			if T_LAYOUTDIRECTION = 0 {
				oView.win.tabifydockwidget(oView.oDockOutputWindow,oView.oDockComponentsBrowser)
			else 
				oView.win.tabifydockwidget(oView.oDockOutputWindow,oView.oDockFilesManager)
			}
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

		if IsDockForFormDesigner() {
			FormDesignerDock()
			if PWCTIsMobile(:Tabify) {
				oView.win.tabifydockwidget(oView.oDockGoalDesigner,oView.oDockFormDesigner)
			else 
				oView.win.tabifydockwidget(oView.oDockFormDesigner,oView.oDockGoalDesigner)
			}
			oView.oDockGoalDesigner.raise()
		}

		# Set Focus to Steps Tree
			parent().SetFocusToStepsTree()

		oView.win.blocksignals(False)
		oView.win.setupdatesenabled(True)

		# WorkAround : We call this again to get the expected look
			if lUseSetModeWorkAround {
				if ! PWCTIsMobile(:DefaultMode) {
					SetMode(C_ENV_DEFAULT_MODE)			
				}
			}

		# We must update the font size here when the tree is visible 
			oView.oFilesTree.UpdateFontSize()

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
		if isWebAssembly() {
			UploadAction()
			return 
		}
		parent().OpenFileAction()

	/*
		Purpose :  Save File Action
		Parameters : None
		Output : None
	*/

	func SaveAction
		if isWebAssembly() {
			DownloadAction()
			return 
		}
		parent().SaveCurrentFileAction()

	/*
		Purpose : File Save As Action
		Parameters : None
		Output : None
	*/

	func SaveAsAction
		if isWebAssembly()
			DownloadAction()
			return 
		ok
		parent().SaveFileAction()

	/*
		Purpose : Save files before running
		Parameters : None
		Output : None
	*/

	func BeforeRun
		if parent().IsActiveFile() {
			SaveAction()
		}
		if isDockForFormDesigner() {
			FormDesigner().SaveIfOnlyFileIsOpened()
		}

	/*
		Purpose : Run File Action
		Parameters : None
		Output : None
	*/

	func RunAction
		BeforeRun()
		parent().RunAction()

	/*
		Purpose : Run GUI Application Action
		Parameters : None
		Output : None
	*/

	func RunGUIAction
		BeforeRun()
		parent().RunGUIAction()

	/*
		Purpose : Debug Program Action
		Parameters : None
		Output : None
	*/

	func DebugAction
		BeforeRun()
		parent().DebugAction()


	func RunInBrowser
		BeforeRun()
		parent().RunInBrowser()

	/*
		Purpose : Change Opened File Action
		Parameters : None
		Output : None
	*/

	func ChangeFileClickAction
		# We use a Timer because (Double Click) on QTreeView will fire the (Click) signal too!
		if lUseOpenFilesTimer and lOpenFilesInNewTabs = False {
			oView.treeTimer.Start()
			oView.oDockGoalDesigner.raise()
			oView.oDockGoalDesigner.show()
			oView.oDockGoalDesigner.setFocus(0)
		else 
			ChangeFileAction()
		}

	func ChangeFileDoubleClickAction
		oView.treeTimer.Stop()
		lOpenFilesInNewTabs = True
		ChangeFileAction()
		lOpenFilesInNewTabs = False

	func ChangeFileAction	
		oView.treeTimer.Stop()
		nClock = clock()
		oItem = oView.oFilesTree.currentindex()
		if oView.oFile.isdir(oItem) {
			return
		}
		cFileName = oView.oFile.filepath(oItem)
			showmessageInStatusBar("Loading File : " + cFileName)
		lFormFile = False
		if right(lower(cFileName),6) = ".rform" {
			openFormDesignerFile(cFileName)
			cFileName = substr(cFileName,".rform","controller.pwct")
			lFormFile = True
 		}
		if fexists(cFileName) {
			openVisualFile(cFileName)
			showmessageInStatusBar("Change File Time: " + ( (clock()-nClock) / Clockspersecond() ) )
		}
		if lFormFile {
			oView.oDockFormDesigner.raise()
			oView.oDockFormDesigner.show()
			oView.oDockFormDesigner.setfocus(0)
		}
		oView.win.show()
		PWCT_APP.processevents()
		
	func openVisualFile cFileName
		parent().CheckSavingTheFile()
		# Check the file size
			if len(read(cFileName)) < 50*1024 {	# file size less than 50 KB
				lDisplayLoadingMessage = False 
			else 
				lDisplayLoadingMessage = True
			}
			if PWCTIsMobile(:DisplayLoadingMessage) {
				lDisplayLoadingMessage = True
			}
		# If the file is already opened, Activate the window
			# We may have many files opened and (lOpenFilesInNewTabs = False)
			# So we check len(aActiveFiles) too 
			# This after supporting (Double Click) to open files in new tabs!
			if lOpenFilesInNewTabs or len(aActiveFiles) > 0 {
				aActiveFilesCopy = aActiveFiles 
				for item in aActiveFilesCopy { item[2] = lower(item[2]) }
					nPos = find(aActiveFilesCopy,lower(cFileName),2)
					if nPos {
						aActiveFiles[nPos][1].show()
						aActiveFiles[nPos][1].raise()
						aActiveFiles[nPos][3].setfocus(0)
						oView.oFilesTree.setfocus(0)
						SetParentForComponentsBrowser(aActiveFiles[nPos][4])
						return
					}
			}
		# If we open one file each time, clear the aActiveFiles list 
			if not lOpenFilesInNewTabs  {
				# Be sure that we don't have many files opened already !
				if len(aActiveFiles) = 1 {
					aActiveFiles = []
				else 
					# We already have many files opened (Using Mouse Double Click) 
					# When we change the file using (One Click)
					# Remove the old file from aActiveFiles 
					for x = 1 to len(aActiveFiles) {
						if ptrcmp(aActiveFiles[x][1].pObject,oView.oDockGoalDesigner.pObject) {
							del(aActiveFiles,x)
							exit
						}
					}
				}
			}
		# Display Message
			if lDisplayLoadingMessage and lUseLoadingMessage {
				open_windowandlink(:quickmsgController,self)
				# "Loading the Visual Source File..."
				QuickMsg().setText(T_ENV_LOADING)
				oView.oFilesTree.blocksignals(True)
				PWCT_APP.processevents()
				oView.oFilesTree.blocksignals(False)
			}
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
				aActiveFiles + [oView.oDockGoalDesigner,lower(cFileName)]
			oView.oDockGoalDesigner.raise()
			oView.oDockGoalDesigner.show()
		}
		# Add the Steps Tree to the aActiveFiles list 
			aActiveFiles[len(aActiveFiles)] + parent().oView.oStepsTree
			aActiveFiles[len(aActiveFiles)] + parent()
		parent().oVisualSourceFile.cFileName = cFileName
		oView.oFilesTree.blocksignals(True)
		parent().OpenFileAction2()
		oView.oFilesTree.blocksignals(False)
		# Set focus to the Steps Tree to be used when we Run the application
			parent().oView.oStepsTree.setfocus(0)
		# Set focus to the Files Manager Tree
			oView.oFilesTree.setfocus(0)
		lActiveGoalDesignerChanged = True
		if lDisplayLoadingMessage and lUseLoadingMessage {
			QuickMsg().CloseMsg()
		}
		if PWCTIsMobile(:OpenFilesInNewTabs) {
			oView.oDockGoalDesigner.raise()
			oView.oDockGoalDesigner.show()
			oView.oDockGoalDesigner.setfocus(0)
		}


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
		parent().CheckSavingTheFile()		
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
		Purpose : Form Designer Window Action
		Parameters : None
		Output : None
	*/

	func FormDesignerWindowAction
		ToggleVisible(oView.oDockFormDesigner)

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
		"2020, Mahmoud Fayed <msfclipper@yahoo.com>")	


	/*
		Purpose : Menubar - Help Menu - System Log Action
		Parameters : None
		Output : None
	*/

	func SystemLogAction
		oSystemLog.show()

	/*
		Purpose : Send Process Data
		Parameters : None
		Output : None
	*/

	func sendDataAction
		oView {
			if ISNULL(oProcess) { return }
			if isWindows() {
				cText = oProcessText.text() + windowsnl()
			else 
				cText = oProcessText.text() + nl
			}
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
			if isWindows() {
				cText += WindowsNL()
			}
 			oProcessEditbox.insertplaintext(cText)
			oCursor = oProcessEditbox.textcursor()
			nPos = max(len(oProcessEditbox.toplaintext())-1,0)
			oCursor.setPosition(nPos,QTextCursor_KeepAnchor)
			oCursor.setPosition(nPos,QTextCursor_MoveAnchor)
			oProcessEditbox.setTextCursor(oCursor)
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
				"C_STEPSTREE_SELECTIONCOLOR = '" + C_STEPSTREE_SELECTIONCOLOR + "'" + nl + 
				"C_STEPSTREE_SELECTIONBACKGROUND = '" + C_STEPSTREE_SELECTIONBACKGROUND + "'" + nl + 
				"C_STEPSTREE_BACKCOLOR = '" + C_STEPSTREE_BACKCOLOR + "'" + nl + 
				"C_STEPSTREE_SHOWLINES = " + C_STEPSTREE_SHOWLINES + nl + 
				"C_STEPSTREE_INDENTATION = " + C_STEPSTREE_INDENTATION + nl + 
				"C_COMPONENTSBROWSER_COLOR = '" + C_COMPONENTSBROWSER_COLOR + "'" + nl + 
				"C_INTERACTIONPAGE_TITLECOLOR = '" + C_INTERACTIONPAGE_TITLECOLOR + "'" + nl + 
				"C_INTERACTIONPAGE_TITLEBACKCOLOR = '" + C_INTERACTIONPAGE_TITLEBACKCOLOR + "'" + nl + 
				"C_ENV_DEFAULT_STYLE = " + C_ENV_DEFAULT_STYLE  + nl + 
				"C_ENV_DEFAULT_MODE = " + C_ENV_DEFAULT_MODE + nl + 
				"C_ENV_DEFAULT_LANG = " + C_ENV_DEFAULT_LANG + nl + 
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
		LoadSettingsFile()
		RestoreSettings()	

	func LoadSettingsFile
		if fexists(cSettingsFile) { 
			eval(read(cSettingsFile))
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

		if C_PROPERTIES_REFLECTCHANGEINFONTSIZE { 
			ComponentsBrowserFont()
			ComponentsFont()
			FilesTreeFont()
		}

		cColor = C_STEPSTREE_BACKCOLOR
		SetStyle(C_ENV_DEFAULT_STYLE)
		C_STEPSTREE_BACKCOLOR = cColor
		parent().refreshStepsTree()
		if ! PWCTIsMobile(:DefaultMode) {
			SetMode(C_ENV_DEFAULT_MODE)
		}

		if isWebAssembly() {
			SetMode(C_ENV_MODE_LEFT)
			oView.oDockFilesManager.hide()
		}


	func GoalDesignerFont
		# Set The Goal Designer Font
			parent().cFont = cFont
			parent().UpdateFont()
			parent().oView.oStepsTree.nFontSize = nFontSize			
			parent().UpdateFontSize()

	func ComponentsBrowserFont
		if isDockForComponentsBrowser() {
			parent().componentsBrowserWindow().UpdateFontSize(max(nFontSize-2,11))
		}

	func FilesTreeFont
		oView.oFilesTree.nFontSize = max(nFontSize-2,11)			
		oView.oFilesTree.UpdateFontSize()

	func ComponentsFont
		C_COMPONENT_CONTROLSFONTSIZE = nFontSize-2

	func IsDockForComponentsBrowser
		return oView.lDockForComponentsBrowser

	func IsDockForFormDesigner
		return oView.lDockForFormDesigner

	func SetParentForComponentsBrowser oParent
		# if we are using dockable window for the components browser 
		# Set the parent for the components browser window 
		if lDockForComponentsBrowserIsVisible {
			parent().componentsBrowserWindow().setParentObject(oParent)
		}

	func ShowMessageInStatusBar cMsg
		oView.oStatusBar.showMessage(cMsg,0)

	func FormDesignerDock
		cDir = CurrentDir()
		chdir(PWCT_FOLDER + "/src/formdesigner")
		import formdesigner 
		open_windowAndLink(:FormDesignerController,self)
		# We still use setParentObject() and avoid using
		# IsRNOTE() and RNote() in the Form Designer 
		# So we can reuse the Form Designer in other Projects
		# I.e. Ring Notepad need to know about the Form Designer 
		# But It's necessary for the Form Designer to Know that
		# It's used in another project!
		FormDesigner().setParentObject(self)
		oView.oDockFormDesigner.setWidget(FormDesigner().oView.win)
		chdir(cDir)

	func openFormDesignerFile cFileName	
		if not IsDockForFormDesigner() {
			return 
		}
		ShowMessageInStatusBar("Open the form file...")
		# Display Message
			if PWCTISMobile(:ShowLoadingMessage) and lDisplayLoadingMessage and lUseLoadingMessage {
				open_windowandlink(:quickmsgController,self)
				# "Loading the Visual Source File..."
				QuickMsg().setText(T_ENV_LOADING)
				oView.oFilesTree.blocksignals(True)
				PWCT_APP.processevents()
				oView.oFilesTree.blocksignals(False)
			}
		oView.oDockFormDesigner.show()
		if cFileName != cFormFile {
			cFormFile = cFileName
			FormDesigner().openFile(cFileName)		
		}
		oView.oDockFormDesigner.raise()
		# Hide Message 
			if  PWCTISMobile(:ShowLoadingMessage) and lDisplayLoadingMessage and lUseLoadingMessage {
				QuickMsg().CloseMsg()
			}
		ShowMessageInStatusBar("Ready!")

	func openfile cFileName
		cFileName = substr(cFileName,".ring",".pwct")
		if fexists(cFileName) {
			openVisualFile(cFileName)
		}

	func ClearActiveFormFile
		cFormFile = ""

	func GetActiveFolder
		return PWCT_FOLDER
	
	func GenerateControllerClass cFileName 
		cFileName = substr(cFileName,".ring",".pwct")
		cFormName = substr(JustFileName(cFileName),"Controller.pwct","")
		if fexists(cFileName) { return }
		oVisualFile = new VisualSourceFile {
			if PWCTIsMobile(:formcontrollerfile) {
				setfile(T_TEMPLATES_FORMCONTROLLER)
			else 
				setfile(PWCT_FOLDER+T_TEMPLATES_FORMCONTROLLER)
			}
			Open()
			LoadTables()
			setfile(cFileName)
			for aInteraction in aInteractionsTable {
				aInteraction[C_INTERACTIONRECORD_VARIABLESVALUES] = substr(
					aInteraction[C_INTERACTIONRECORD_VARIABLESVALUES],
					"filename_",cFormName
				)
			}
			for aStep in aStepsTable {
				aStep[C_TREEMODEL_CONTENT][:name] = substr(
					aStep[C_TREEMODEL_CONTENT][:name],
					"filename_",cFormName
				)
				aStep[C_TREEMODEL_CONTENT][:code] = substr(
					aStep[C_TREEMODEL_CONTENT][:code],
					"filename_",cFormName
				)
				aStep[C_TREEMODEL_CONTENT][:plainname] = substr(
					aStep[C_TREEMODEL_CONTENT][:plainname],
					"filename_",cFormName
				)
			}
			open()
			createTables()
			SaveTables()
			Close()
		}
		openVisualFile(cFileName)

	func SaveBeforeRunning
		parent().oProgramController.prepare(parent()) # Save before running 

	func Distribute nOption
		cActiveFileName = parent().GetActiveSourceFile()
		if cActiveFileName = Null {
			 return Nofileopened() 
		}
		SaveBeforeRunning() # Save before running 
		cAppToRun = exefolder()+"/ring2exe"
		cPara = cActiveFileName
		switch nOption {
			case 1	# ringo
				cAppToRun = exefolder()+"/ring"
				cPara += ",-go,-norun"
			case 2	# exe 
				cPara += ",-static"
			case 3	# dist allruntime
				cPara += ",-dist,-allruntime"
			case 4	# dist allruntime gui
				cPara += ",-dist,-allruntime,-gui"
			case 5	# ringqt
				cPara += ",-dist,-qt,-gui"
			case 6	# ringallegro 
				cPara += ",-dist,-allegro,-freeglut,-opengl,-gui"
			case 7	# qt project
				cPara += ",-dist,-allruntime,-gui,-mobileqt"
		}
		oView.oDockOutputWindow { show() raise() }		
		oView.oProcessEditbox.setplaintext("")
		chdir(JustFilePath(cActiveFileName))
		oView.oProcess = parent().oProgramController.RunProcess(cAppToRun,cPara,Method(:GetDataAction))
		OSFilesManager()
		chdir(PWCT_FOLDER)

	func Nofileopened
		New qMessageBox(oView.win) {
			setWindowTitle("Sorry")
			setText("Save/Select the file first!")
			show()
		}

	func UpdateCurrentDirectory
		cActiveFileName = parent().GetActiveSourceFile()
		if cActiveFileName != Null {
			this.cCurrentDir = justfilepath(cActiveFileName)
		}


	func OSTerminal
		UpdateCurrentDirectory()
		if isWindows() {
			cCommand = 'start cmd /K "cd ' + cCurrentDir + '"'
		elseif isLinux()
			cCommand = "gnome-terminal"
		elseif isMacosx()
			cCommand = "open /Applications/Utilities/Terminal.app"
		else 
			return
		}
		system(cCommand)

	func OSFilesManager 
		UpdateCurrentDirectory()
		new QDesktopServices {
			OpenURL(new qURL("file:///"+this.cCurrentDir))
		}

	func OpenFormDesigner	
		cFormFileName = PWCT_FOLDER + "/formdesigner/formdesigner.ring"
		RunTool(cFormFileName)

	func RunTool cFileName
		oView.oProcessEditbox.setplaintext("")
		oView.oProcessText.setFocus(0)
		chdir(JustFilePath(cFileName))
		cRingEXE = exefilename()
		oView.oProcess = parent().oProgramController.RunProcess(cRingEXE,cFileName,Method(:GetDataAction))
		chdir(PWCT_FOLDER)

	func RunToolConsole cFileName
		if iswindows()
			System('start '+exefolder()+'ring "' + cFileName + '"' + nl)
		else
			cCode = 'cd $(dirname "'+cFileName+'") ; ' + ' ring "' + cFileName + '"' + nl
			system(cCode)
		ok

	func REPLConsole
		cAppFileName = PWCT_FOLDER + "/ringrepl/repl.ring"
		RunToolConsole(cAppFileName)

	func REPLGUI
		cAppFileName = PWCT_FOLDER + "/ringrepl/replw.ring"
		# RunTool will split parameters using "," as separator 
		cAppFileName += ",1"	# Style Fusion White
		RunTool(cAppFileName)


	/*
		Main File Toolbar 
	*/

	func SetMainFile
		cActiveFileName = parent().GetActiveSourceFile()
		oView.oTxtMainFile.setText(cActiveFileName)
		# Generate the source code 
			oProgramController = new ProgramController
			oProgramController.cFileName = cActiveFileName
			oProgramController.prepare(parent())

	func GetMainFile
		cMainFileName = trim(oView.oTxtMainFile.text())
		if cMainFileName = NULL {
			SetMainFile() 
			cMainFileName = trim(oView.oTxtMainFile.text())
		}
		return cMainFileName

	func DebugMainFile
		cMainFileName = GetMainFile()
		if cMainFileName = Null { return Nofileopened() }
		if not fexists(cMainFileName) { return }
		oProgramController = new ProgramController
		oProgramController.cFileName = cMainFileName
		oProgramController.lMainFile = True
		oProgramController.debug(parent())

	func RunMainFile
		cMainFileName = GetMainFile()
		if cMainFileName = Null { return Nofileopened() }
		if not fexists(cMainFileName) { return }
		oProgramController = new ProgramController
		oProgramController.cFileName = cMainFileName
		oProgramController.lMainFile = True
		oProgramController.Run(parent())

	func RunGUIMainFile
		cMainFileName = GetMainFile()
		if cMainFileName = Null { return pNofileopened() }
		if not fexists(cMainFileName) { return }
		oView.oDockOutputWindow { show() raise() }		
		oProgramController = new ProgramController
		oProgramController.cFileName = cMainFileName
		oProgramController.lMainFile = True
		oProgramController.RunGUI(parent())

	func RunInBrowserMainFile
		BeforeRun()
		cMainFileName = GetMainFile()
		if cMainFileName = Null { return pNofileopened() }
		if not fexists(cMainFileName) { return }
		oView.oDockOutputWindow { show() raise() }		
		oProgramController = new ProgramController
		oProgramController.cFileName = cMainFileName
		oProgramController.lMainFile = True
		oProgramController.RunInBrowser(parent())

	func ShowDockableWindows
		oView.oDockFilesManager.Show()
		oView.oDockGoalDesigner.show()
		oView.oDockComponentsBrowser.show()
		oView.oDockOutputWindow.show()
		oView.oDockFormDesigner.show()

	func SetMode nMode
		C_ENV_DEFAULT_MODE = nMode
		switch nMode {
			on C_ENV_MODE_GENERAL
				ShowDockableWindows()
				oView.win {
					adddockwidget(Qt_LeftDockWidgetArea,this.oView.oDockFilesManager,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockGoalDesigner,2)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFormDesigner,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockOutputWindow,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockComponentsBrowser,1)
					tabifydockwidget(this.oView.oDockFormDesigner,this.oView.oDockGoalDesigner)
					tabifydockwidget(this.oView.oDockOutputWindow,this.oView.oDockComponentsBrowser)
				}
				oView.oDockGoalDesigner.raise()
				oView.oDockComponentsBrowser.raise()
			on C_ENV_MODE_TESTING
				ShowDockableWindows()
				oView.win {
					adddockwidget(Qt_LeftDockWidgetArea,this.oView.oDockFilesManager,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockGoalDesigner,2)
					adddockwidget(Qt_BottomDockWidgetArea,this.oView.oDockOutputWindow,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFormDesigner,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockComponentsBrowser,1)
					tabifydockwidget(this.oView.oDockFormDesigner,this.oView.oDockGoalDesigner)
				}
				oView.oDockGoalDesigner.raise()
			on C_ENV_MODE_LEFT
				ShowDockableWindows()
				oView.win {
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockGoalDesigner,2)
					adddockwidget(Qt_LeftDockWidgetArea,this.oView.oDockFilesManager,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockComponentsBrowser,1)
					adddockwidget(Qt_BottomDockWidgetArea,this.oView.oDockOutputWindow,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFormDesigner,1)
					tabifydockwidget(this.oView.oDockGoalDesigner,this.oView.oDockFormDesigner)
					tabifydockwidget(this.oView.oDockFilesManager,this.oView.oDockOutputWindow)
					tabifydockwidget(this.oView.oDockFilesManager,this.oView.oDockComponentsBrowser)
				}
				oView.oDockGoalDesigner.raise()
				oView.oDockFilesManager.raise()
			on C_ENV_MODE_RIGHT
				ShowDockableWindows()
				oView.win {
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockGoalDesigner,2)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFilesManager,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockComponentsBrowser,1)
					adddockwidget(Qt_BottomDockWidgetArea,this.oView.oDockOutputWindow,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFormDesigner,1)
					tabifydockwidget(this.oView.oDockGoalDesigner,this.oView.oDockFormDesigner)
					tabifydockwidget(this.oView.oDockFilesManager,this.oView.oDockOutputWindow)
					tabifydockwidget(this.oView.oDockFilesManager,this.oView.oDockComponentsBrowser)
				}
				oView.oDockGoalDesigner.raise()
				oView.oDockFilesManager.raise()
			on C_ENV_MODE_GD
				ShowDockableWindows()
				oView.oDockFilesManager.hide()
				oView.oDockFormDesigner.hide()
				oView.win {
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockGoalDesigner,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockComponentsBrowser,2)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockOutputWindow,2)
					tabifydockwidget(this.oView.oDockGoalDesigner,this.oView.oDockComponentsBrowser)
					tabifydockwidget(this.oView.oDockComponentsBrowser,this.oView.oDockOutputWindow)
				}
				oView.oDockGoalDesigner.raise()
			on C_ENV_MODE_GUI
				ShowDockableWindows()
				oView.oDockFilesManager.hide()
				oView.oDockOutputWindow.hide()
				oView.win {
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockGoalDesigner,2)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockComponentsBrowser,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFormDesigner,1)
					tabifydockwidget(this.oView.oDockGoalDesigner,this.oView.oDockComponentsBrowser)
				}
				oView.oDockGoalDesigner.raise()
				oView.oDockFormDesigner.raise()
		}

	func SetStyle nStyle
		C_ENV_DEFAULT_STYLE  = nStyle
		Switch nStyle {
			on C_ENV_STYLE_WINDOWS
				StyleWindows()	
				StyleColorWhite()		
				C_STEPSTREE_BACKCOLOR	= "white"
			on C_ENV_STYLE_WINDOWSB
				StyleWindows()	
				StyleColorBlocks()		
				C_STEPSTREE_BACKCOLOR	= "white"
			on C_ENV_STYLE_WHITE
				StyleFusionWhite()
				StyleColorWhite()
				C_STEPSTREE_BACKCOLOR	= "white"
			on C_ENV_STYLE_WHITEB
				StyleFusionWhite()
				StyleColorBlocks()
				C_STEPSTREE_BACKCOLOR	= "white"
			on C_ENV_STYLE_BLACK
				StyleFusionBlack()
				StyleColorBlack()
				C_STEPSTREE_BACKCOLOR	= "black"
			on C_ENV_STYLE_BLACKB
				StyleFusionBlack()
				StyleColorBlocks()
				C_COMPONENTSBROWSER_COLOR		= "white"
				C_STEPSTREE_BACKCOLOR	= "white"
		}
		parent().ComponentsBrowserWindow().oView.oComponentsTree.TreeStyle()
		parent().refreshStepsTree()
		oView.oFilesTree.UpdateFontSize()

	func StyleWindows
		if isWindows() {
			PWCT_APP.StyleWindowsVista()
		else 
			PWCT_APP.StyleWindows()
		}
		oView.oFilesTree.setStyleSheet("color:black;")

	func StyleColorBlocks()
		C_STEPCOLOR_COMMENT_TEXT = 'green'
		C_STEPCOLOR_COMMENT_BACKCOLOR = '#ffd572'
		C_STEPCOLOR_ROOT_TEXT = '#2a3178'
		C_STEPCOLOR_ROOT_BACKCOLOR = '#6fff67'
		C_STEPCOLOR_ALLOWINTERACTION_TEXT = '#ffffff'
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = '#418aff'
		C_STEPCOLOR_INFO_TEXT = '#333f68'
		C_STEPCOLOR_INFO_BACKCOLOR = '#ffbb5c'
		C_STEPCOLOR_DATA_TEXT = 'gray'
		C_STEPCOLOR_DATA_BACKCOLOR = '#60fff5'	
		C_STEPSTREE_SELECTIONCOLOR		= "black"
		C_STEPSTREE_SELECTIONBACKGROUND		= "cyan"	
		C_COMPONENTSBROWSER_COLOR		= "green"
		C_INTERACTIONPAGE_TITLECOLOR		= "white"
		C_INTERACTIONPAGE_TITLEBACKCOLOR	= "purple"

	func StyleFusionWhite
		PWCT_APP.Stylefusion()
		oView.oFilesTree.setStyleSheet("color:black;")

	func StyleColorWhite
		C_STEPCOLOR_COMMENT_TEXT = 'green'
		C_STEPCOLOR_COMMENT_BACKCOLOR = ''
		C_STEPCOLOR_ROOT_TEXT = 'blue'
		C_STEPCOLOR_ROOT_BACKCOLOR = ''
		C_STEPCOLOR_ALLOWINTERACTION_TEXT = 'black'
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = '#00ff00'
		C_STEPCOLOR_INFO_TEXT = 'black'
		C_STEPCOLOR_INFO_BACKCOLOR = ''
		C_STEPCOLOR_DATA_TEXT = 'gray'
		C_STEPCOLOR_DATA_BACKCOLOR = ''
		C_STEPSTREE_SELECTIONCOLOR		= "black"
		C_STEPSTREE_SELECTIONBACKGROUND		= "cyan"
		C_COMPONENTSBROWSER_COLOR		= "green"
		C_INTERACTIONPAGE_TITLECOLOR		= "white"
		C_INTERACTIONPAGE_TITLEBACKCOLOR	= "purple"

	func StyleFusionBlack
		PWCT_APP.Stylefusionblack()
		oView.oFilesTree.setStyleSheet("color:white;")

	func StyleColorBlack
		C_STEPCOLOR_COMMENT_TEXT = '#ffbfb2'
		C_STEPCOLOR_COMMENT_BACKCOLOR = ''
		C_STEPCOLOR_ROOT_TEXT = '#bbff1a'
		C_STEPCOLOR_ROOT_BACKCOLOR = ''
		C_STEPCOLOR_ALLOWINTERACTION_TEXT = 'silver'
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = 'RGB(50,100,50)'
		C_STEPCOLOR_INFO_TEXT = 'gray'
		C_STEPCOLOR_INFO_BACKCOLOR = ''
		C_STEPCOLOR_DATA_TEXT = 'white'
		C_STEPCOLOR_DATA_BACKCOLOR = ''
		C_STEPSTREE_SELECTIONCOLOR		= "white"
		C_STEPSTREE_SELECTIONBACKGROUND		= "#333333"
		C_COMPONENTSBROWSER_COLOR		= "white"
		C_INTERACTIONPAGE_TITLECOLOR		= "white"
		C_INTERACTIONPAGE_TITLEBACKCOLOR	= "black"

	func setLang nLanguage
		if C_ENV_DEFAULT_LANG = nLanguage {
			return
		}
		C_ENV_DEFAULT_LANG = nLanguage
		# Change the language
			switch nLanguage {
				case C_TRANSLATION_ENGLISH
					load again "../../translation/english.ring"
				case C_TRANSLATION_ARABIC 
					load again "../../translation/arabic.ring"
			}
		# Save Settings 
			saveSettings()
		# Hide the current environment 
			oView.win.hide()
		# Restore the environment folder 
			chdir(PWCT_FOLDER)
		# Open new environment 
			Open_Window(:EnvironmentController)


	func DownloadAction
		# Avoid _ in the start of the file name (Added by Qt!)
			cDownloadedFileName = parent().oVisualSourceFile.cFileName
			if len(cDownloadedFileName) > 1 {
				if ! isalnum(cDownloadedFileName[1]) {
					cDownloadedFileName = substr(cDownloadedFileName,2)
				}
			}
		parent().saveFileAction2()
		WebAssemblyDownload(cDownloadedFileName,read(parent().oVisualSourceFile.cFileName))

	func UploadAction 
		WebAssemblyUpload("PWCT Files (*.pwct)",Method(:FileLoaded))

	func FileLoaded
		if fexists( WebAssemblyUploadedFileName() ) {
			remove( WebAssemblyUploadedFileName() )
		}
		Write(   WebAssemblyUploadedFileName() ,
			 WebAssemblyUploadedFileContent()
		)
		openVisualFile( WebAssemblyUploadedFileName() )
		oView.win.show()
		PWCT_APP.processevents()


