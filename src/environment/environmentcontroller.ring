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
	if isWebAssembly() {
		cFont = "MS Shell Dlg 2,16,-1,5,50,0,0,0,0,0"
		nFontSize = 16
	else 
		cFont = "MS Shell Dlg 2,12,-1,5,50,0,0,0,0,0"
		nFontSize = 12
	}

	lDockForComponentsBrowserIsVisible = False
	nComponentsBrowserWindowID

	lTabifyOutputAndFiles = 0

	if PWCTIsMobile(:OpenFilesInNewTabs) {
		lOpenFilesInNewTabs = False 
	else 
		lOpenFilesInNewTabs = C_STEPSTREE_OPENFILESINNEWTABS
	}

	lUseOpenFilesTimer = False

	if PWCTIsMobile(:UseLoadingMessage) {
		lUseLoadingMessage	= True
	else 
		lUseLoadingMessage	= False
	}
	lDisplayLoadingMessage 	= True

	lUseSetModeWorkAround   = True

	/* 
		[Dockable Window Object, 
		 Visual Source File Name, 
		 Steps Tree Object, 
		 Goal Designer Object   ]
	*/
		aActiveFiles = []	
		lActiveGoalDesignerChanged = True

	cFormFile = ""

	lNoMoreOutputData = False 

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
		# Save the Window ID 
			nEnvironmentWindowID = ObjectID()
		oView.win.blocksignals(True)
		oView.win.setupdatesenabled(False)
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
		oView.win.showmaximized()

		# WorkAround : We call this again to get the expected look
			if lUseSetModeWorkAround {
				if ! PWCTIsMobile(:DefaultMode) {
					oView.win.Hide()
					SetMode(C_ENV_DEFAULT_MODE)	
					oView.win.showmaximized()		
				}
			}
		# We must update the font size here when the tree is visible 
			oView.oFilesTree.UpdateFontSize()

		if isWebAssembly() {
			oView.win.Hide()
			oView.win.setWindowFlags(Qt_Window | Qt_CustomizeWindowHint)
			oView.win.showmaximized()
		}

		if ! PWCTIsMobile(:DockSize) {
			prepareDockSize()
		}

	func prepareDockSize

		aDocksData = [
			[oView.oDockOutputWindow,nOutputWindowWidth,nOutputWindowHeight],
			[oView.oDockGoalDesigner,nGoalDesignerWidth,nGoalDesignerHeight],
			[oView.oDockFilesManager,nFilesManagerWidth,nFilesManagerHeight],
			[oView.oDockComponentsBrowser,nComponentsBrowserWidth,nComponentsBrowserHeight]
		]

		aDocksData = sort(aDocksData,2)
		for oDockItem in aDocksData {
			if oDockItem[1].isVisible() {
				if oDockItem[2]  {
					setDockWidth(oDockItem[1],oDockItem[2])
				}
			}
		}

		aDocksData = sort(aDocksData,3)
		for oDockItem in aDocksData {
			if oDockItem[1].isVisible() {
				if oDockItem[3] {
					setDockHeight(oDockItem[1],oDockItem[3])
				}
			}
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
		if isWebAssembly() {
			UploadAction()
			return 
		}
		UpdateCurrentDirectory()
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
		UpdateCurrentDirectory()
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
		UpdateCurrentDirectory()
		parent().SaveFileAction()

	/*
		Purpose : Save files before running
		Parameters : None
		Output : None
	*/

	func BeforeRun
		parent().lSaveFlag = False 
		if isWebAssembly() {
			return 
		}
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
		if right(lower(cFileName),len(T_PWCT_FORMDESIGNER_FILEEXTENSION)+1) = "." + T_PWCT_FORMDESIGNER_FILEEXTENSION {
			openFormDesignerFile(cFileName)
			cFileName = substr(cFileName,"." + T_PWCT_FORMDESIGNER_FILEEXTENSION,T_VSF_CONTROLLER+"." + T_VSF_EXTENSION)
			lFormFile = True
 		}
		if fexists(cFileName) {
			openVisualFile(cFileName)
			showmessageInStatusBar(T_ENV_STATUSBAR_CHANGEFILETIME + ( (clock()-nClock) / Clockspersecond() ) )
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
			if len(read(FileNameEncoding(cFileName))) < 50*1024 {	# file size less than 50 KB
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
			oView.oDockFilesManager.raise()
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
		if isWebAssembly() {
			PWCT_APP.Quit()
			return 
		}
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
		Purpose : Undo Action
		Parameters : None
		Output : None
	*/


	func UndoAction 
		parent().undo()

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
		Activating Windows 
	*/

	func ShowAndRaiseObject oObject
		oObject.show()
		oObject.raise()
		oObject.setFocus(0)

	func ProjectActivate
		ShowAndRaiseObject(oView.oDockFilesManager)
		oView.oFilesTree.setFocus(0)

	func GoalDesignerActivate
		ShowAndRaiseObject(oView.oDockGoalDesigner)
		# Set Focus to Steps Tree
			parent().SetFocusToStepsTree()

	func OutputWindowActivate
		ShowAndRaiseObject(oView.oDockOutputWindow)
		oView.oProcessText.setFocus(0)

	func FormDesignerWindowActivate
		ShowAndRaiseObject(oView.oDockFormDesigner)

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


	func FilesToolBarAction
		ToggleVisible(oView.oToolBarFiles)

	func MainFileToolBarAction
		ToggleVisible(oView.oToolBarMainFile)

	func StatusBarAction
		ToggleVisible(oView.oStatusBar)

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


	func PWCTCHMAction
		new QDesktopServices {
			OpenURL(new qURL("file:///"+substr(PWCT_FOLDER,"\","/")+"/documents/PWCT.chm") )
		}

	func PWCTPDFAction
		new QDesktopServices {
			OpenURL(new qURL("file:///"+substr(PWCT_FOLDER,"\","/")+"/documents/PWCT.pdf") )
		}

	func PWCTOpenVideo nVideo
		aVideos = [
			"https://www.youtube.com/watch?v=zd2jUEIlr8Y&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7",
			"https://www.youtube.com/watch?v=f9fbPKSiP4k&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=2",
			"https://www.youtube.com/watch?v=GMlbc9bVIc0&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=3",
			"https://www.youtube.com/watch?v=3yd72YrXxF0&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=4",
			"https://www.youtube.com/watch?v=4KgNXz-DxcY&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=5",
			"https://www.youtube.com/watch?v=OfzMfK_NukA&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=6",
			"https://www.youtube.com/watch?v=gtL8m_-0F5o&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=7",
			"https://www.youtube.com/watch?v=EVPwn6lgsDM&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=8",
			"https://www.youtube.com/watch?v=rTJubpy7TiA&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=9",
			"https://www.youtube.com/watch?v=8Q75DgY-m1s&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=10",
			"https://www.youtube.com/watch?v=TtuWCah2FfY&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=11",
			"https://www.youtube.com/watch?v=qLqIOlP90EY&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=12",
			"https://www.youtube.com/watch?v=sLTrBXMYurw&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=13",
			"https://www.youtube.com/watch?v=3hOFTkd0Ul8&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=14",
			"https://www.youtube.com/watch?v=CPlyA9wo8RQ&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=15",
			"https://www.youtube.com/watch?v=nnFKa4MShoE&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=16",
			"https://www.youtube.com/watch?v=Bzd1Gkass5E&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=17",
			"https://www.youtube.com/watch?v=kJXGIUoczXQ&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=18",
			"https://www.youtube.com/watch?v=9KctZM6zmuA&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=19",
			"https://www.youtube.com/watch?v=A9w4bOvQLBc&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=20",
			"https://www.youtube.com/watch?v=LQdKeQRW2CM&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=21",
			"https://www.youtube.com/watch?v=o88THX8766o&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=22",
			"https://www.youtube.com/watch?v=zFhWc_k3MoI&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=23",
			"https://www.youtube.com/watch?v=T6cXrW3Ob8M&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=24",
			"https://www.youtube.com/watch?v=fceWa4_DvyQ&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=25",
			"https://www.youtube.com/watch?v=cOdgpprb3_U&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=26",
			"https://www.youtube.com/watch?v=kR5LCPPm89c&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=27",
			"https://www.youtube.com/watch?v=ZC99W16KEJM&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=28",
			"https://www.youtube.com/watch?v=d8GhoeTm1WE&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=29",
			"https://www.youtube.com/watch?v=w2S48C2QXvw&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=30",
			"https://www.youtube.com/watch?v=p3OP676l_W4&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=31",
			"https://www.youtube.com/watch?v=0M1I2llBLrc&list=PLpQiqjcu7CuFFulJW0IdG8xmAXaDC2oC7&index=32"
		]
		new QDesktopServices {
			OpenURL(new qURL(aVideos[nVideo]) )
		}
	

	func PWCTOpenGame nGame
		aGamesFiles = [
			"applications/StarsFighter/starsfighter.ring",
			"applications/FlappyBird3000/flappybird3000.ring",
			"applications/SuperMan2016/superman.ring",
			"applications/Snake/snake.ring",
			"applications/Escape/EscapeGame.ring",
			"applications/Tetris/tetris.ring",
			"applications/Maze/maze.ring",
			"applications/Sokoban/sokoban.ring",
			"applications/SquaresPuzzle/SquaresPuzzle.ring",
			"applications/GoldMagic800/goldmagic800.ring",
			"applications/Pairs/PairsGame.ring",
			"applications/Game2048/game2048.ring",
			"applications/Cards/cards.ring",
			"applications/MoneyBoxes/moneyController.ring",
			"applications/KnightTour/KnightTour.ring",
			"applications/Tessera/tessera.ring",
			"applications/Matching/MatchingGame.ring",
			"applications/OthelloGame/OthelloGame.ring"
		]
		cGameFile = aGamesFiles[nGame]
		cGameFileName = PWCT_FOLDER + "/" + cGameFile
		RunTool(cGameFileName)


	/*
		Purpose : Open Help - CHM File 
		Parameters : None
		Output : None
	*/

	func CHMAction
		new QDesktopServices {
			OpenURL(new qURL("file:///"+substr(exefolder(),"\","/")+"../documents/ring.chm") )
		}


	/*
		Purpose : Open Help - PDF File
		Parameters : None
		Output : None
	*/

	func PDFAction
		new QDesktopServices {
			OpenURL(new qURL("file:///"+substr(exefolder(),"\","/")+"../documents/ring.pdf") )
		}


	/*
		Purpose : Menubar - Language Item Action
		Parameters : None
		Output : None
	*/

	func LanguageAction
		MsgBox(T_PL_TITLE, # "Programming Language"
		T_PL_INFO) # "This application developed using the Ring programming language"

	/*
		Purpose : Menubar - Help Menu - GUI Item Action
		Parameters : None
		Output : None
	*/

	func GUIAction
		MsgBox(T_GUILIB_TITLE, # "GUI Library"
		T_GUILIB_INFO) # "This application uses the Qt GUI Library through RingQt"

	/*
		Purpose : Menubar - Help Menu - About Item Action
		Parameters : None
		Output : None
	*/


	Func MsgBox cTitle,cMessage
		if isWebAssembly() {
			new QMessagebox(oView.win) {
				setWindowFlags(Qt_Popup | Qt_WindowTitleHint | Qt_CustomizeWindowHint)
				setwindowtitle(cTitle)
				setText(cMessage)
				show()
			}
		else 
			MsgInfo(cTitle,cMessage)
		}

	func AboutAction
		MsgBox(T_ABOUT_TITLE,	# "About"
		T_ABOUT_DEVELOPER)	# "2022, PWCT Software


	/*
		Purpose : Menubar - Help Menu - System Log Action
		Parameters : None
		Output : None
	*/

	func SystemLogAction
		oSystemLog.show()


	func FAQ
		oFAQ.show()

	func ChangeLog
		oChangeLog.show()

	/*
		Purpose : Send Process Data
		Parameters : None
		Output : None
	*/

	func sendDataAction
		oView {
			if ISNULL(oProcess) { return }
			if isWindows() {
				cSysNL = windowsnl()
			else 
				cSysNL = nl
			}
			cText = oProcessText.text() + cSysNL
			oProcess.write(cText ,len(cText))
			oProcessEditbox.insertplaintext(">> " + cText)
		}

	/*
		Purpose : Kill the current Process OR Clear the Data
		Parameters : None
		Output : None
	*/

	func KillAppAction
		oView {
			oProcessEditbox.clear()
			if ISNULL(oProcess) { return }
			oProcess.setreadyreadstandardoutputevent("")
			oProcess.kill()
			oProcessEditbox.clear()
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
			cText = this.translateErrorMessages(cText)
 			oProcessEditbox.insertplaintext(cText)
			oCursor = oProcessEditbox.textcursor()
			nPos = max(len(oProcessEditbox.toplaintext())-1,0)
			oCursor.setPosition(nPos,QTextCursor_KeepAnchor)
			oCursor.setPosition(nPos,QTextCursor_MoveAnchor)
			oProcessEditbox.setTextCursor(oCursor)
		}

	/*
		Purpose : Translate runtime error messages 
		Parameters : String (Program output)
		Output : String (Program output after translation)
	*/

	func translateErrorMessages cText
		for aList in T_OUTPUT_ERRORMSG {
			cText = subStr(cText,aList[1],aList[2])
		}
		return cText 

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
				"C_STEPSTREE_AUTORUN = " + C_STEPSTREE_AUTORUN + nl + 
				"C_STEPSTREE_INDENTATION = " + C_STEPSTREE_INDENTATION + nl + 
				"C_STEPSTREE_OPENFILESINNEWTABS = " + C_STEPSTREE_OPENFILESINNEWTABS + nl + 
				"C_STEPSTREE_OPENINTERACTIONSINNEWWINDOWS = " + C_STEPSTREE_OPENINTERACTIONSINNEWWINDOWS + nl + 
				"C_STEPSTREE_SHOWTIMEMACHINE = " + C_STEPSTREE_SHOWTIMEMACHINE + nl + 
				"C_STEPSTREE_AVOIDCOMPONENTSBROWSER = " + C_STEPSTREE_AVOIDCOMPONENTSBROWSER + nl + 
				"C_STEPSTREE_AVOIDCOMPONENTSBROWSERAUTOCOMPLETE = " + C_STEPSTREE_AVOIDCOMPONENTSBROWSERAUTOCOMPLETE + nl + 
				"C_STEPSTREE_COMPONENTSBROWSERALWAYSSHOWSEARCHWINDOW = " + C_STEPSTREE_COMPONENTSBROWSERALWAYSSHOWSEARCHWINDOW + nl + 
				"C_STEPSTREE_LIGHTTREELINES = " + C_STEPSTREE_LIGHTTREELINES + nl + 
				"C_STEPSTREE_ALLOWSYNTAXERRORS = " + C_STEPSTREE_ALLOWSYNTAXERRORS + nl + 
				"C_STEPSTREE_NODEICON = " + C_STEPSTREE_NODEICON + nl + 
				"C_STEPSTREE_HIDESTEPCODETAB = " + C_STEPSTREE_HIDESTEPCODETAB + nl + 
				"C_PROPERTIES_REFLECTCHANGEINFONTSIZE = " + C_PROPERTIES_REFLECTCHANGEINFONTSIZE + nl + 
				"C_PROPERTIES_BORDERSAROUNDSTEPS = " + C_PROPERTIES_BORDERSAROUNDSTEPS + nl + 
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
				"lShowFormDesigner = " + oView.oDockFormDesigner.isvisible() + nl +
				"lShowOutputWindow = " + oView.oDockOutputWindow.isvisible() + nl +
				"lShowFilesToolBar = " + oView.oToolBarFiles.isvisible() + nl +
				"lShowMainFileToolBar = " + oView.oToolBarMainFile.isvisible() + nl +
				"lShowStatusBar = " + oView.oStatusBar.isvisible() + nl +
				"nOutputWindowWidth = " + oView.oDockOutputWindow.width() + nl +
				"nOutputWindowHeight = " + oView.oDockOutputWindow.height() + nl +
				"nFilesManagerWidth = " + oView.oDockFilesManager.width() + nl +
				"nFilesManagerHeight = " + oView.oDockFilesManager.height() + nl +
				"nComponentsBrowserWidth = " + oView.oDockComponentsBrowser.width() + nl +
				"nComponentsBrowserHeight = " + oView.oDockComponentsBrowser.height() + nl +
				"nGoalDesignerWidth = " + oView.oDockgoalDesigner.width() + nl +
				"nGoalDesignerHeight = " + oView.oDockgoalDesigner.height() + nl 

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

		GoalDesignerFont()

		if C_PROPERTIES_REFLECTCHANGEINFONTSIZE { 
			ComponentsBrowserFont()
			OutputWindowFont()
			ComponentsFont()
			FilesTreeFont()
		}

		cColor = C_STEPSTREE_BACKCOLOR

		cColor2 = C_STEPCOLOR_COMMENT_TEXT
		cColor3 = C_STEPCOLOR_COMMENT_BACKCOLOR
		cColor4 = C_STEPCOLOR_ROOT_TEXT
		cColor5 = C_STEPCOLOR_ROOT_BACKCOLOR
		cColor6 = C_STEPCOLOR_ALLOWINTERACTION_TEXT
		cColor7 = C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR
		cColor8 = C_STEPCOLOR_INFO_TEXT
		cColor9 = C_STEPCOLOR_INFO_BACKCOLOR
		cColor10 = C_STEPCOLOR_DATA_TEXT
		cColor11 = C_STEPCOLOR_DATA_BACKCOLOR

		SetStyle(C_ENV_DEFAULT_STYLE)

		C_STEPSTREE_BACKCOLOR = cColor

		C_STEPCOLOR_COMMENT_TEXT 		= cColor2
		C_STEPCOLOR_COMMENT_BACKCOLOR 		= cColor3
		C_STEPCOLOR_ROOT_TEXT 			= cColor4
		C_STEPCOLOR_ROOT_BACKCOLOR 		= cColor5
		C_STEPCOLOR_ALLOWINTERACTION_TEXT 	= cColor6
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR 	= cColor7
		C_STEPCOLOR_INFO_TEXT 			= cColor8
		C_STEPCOLOR_INFO_BACKCOLOR 		= cColor9
		C_STEPCOLOR_DATA_TEXT 			= cColor10
		C_STEPCOLOR_DATA_BACKCOLOR 		= cColor11

		parent().refreshStepsTree()
		if ! PWCTIsMobile(:DefaultMode) {
			SetMode(C_ENV_DEFAULT_MODE)
		}

		if isWebAssembly() {
			setStyle(C_ENV_STYLE_WHITEB)
			oView.oDockFilesManager.hide()
		}

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

		if lShowFormDesigner {
			oView.oDockFormDesigner.show()
		else
			oView.oDockFormDesigner.hide()
		}

		if lShowOutputWindow {
			oView.oDockOutputWindow.show()
		else
			oView.oDockOutputWindow.hide()
		}

		if lShowFilesToolBar {
			oView.oToolBarFiles.show()
		else
			oView.oToolBarFiles.hide()
		}

		if ! PWCTIsMobile(:MainToolBar) {

			if lShowMainFileToolBar {
				oView.oToolBarMainFile.show()
			else
				oView.oToolBarMainFile.hide()
			}
	
		}

		if lShowStatusBar {
			oView.oStatusBar.show()
		else
			oView.oStatusBar.hide()
		}

	func GoalDesignerFont
		# Set The Goal Designer Font
			parent().cFont = cFont
			parent().UpdateFont()
			parent().oView.oStepsTree.nFontSize = nFontSize			
			parent().UpdateFontSize()

	func ComponentsBrowserFont
		if isDockForComponentsBrowser() {
			parent().componentsBrowserWindow().UpdateFontSize(max(nFontSize-4,11))
		}

	func OutputWindowFont
		oView.oProcessEditbox.setStyleSheet("font-size:"+(nFontSize-4)+"pt;background-color:;")

	func FilesTreeFont
		oView.oFilesTree.nFontSize = max(nFontSize-4,11)			
		oView.oFilesTree.UpdateFontSize()

	func ComponentsFont
		C_COMPONENT_CONTROLSFONTSIZE = nFontSize-4

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
		cFileName = substr(cFileName,".ring","." + T_VSF_EXTENSION)
		if fexists(cFileName) {
			openVisualFile(cFileName)
		}

	func ClearActiveFormFile
		cFormFile = ""

	func GetActiveFolder
		return PWCT_FOLDER
	
	func GenerateControllerClass cFileName 
		cFileName = substr(cFileName,".ring","." + T_VSF_EXTENSION)
		cFormName = substr(JustFileName(cFileName),T_VSF_CONTROLLER+"."+ T_VSF_EXTENSION,"")
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

		if T_LANGUAGE != :English {
			cPara = substr(cPara, justFileName(cActiveFileName), "PWCT2_Ring_App.ring")
			write(cPara, read(cActiveFileName))
		}

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
			case 8	# qt project webassembly
				cPara += ",-dist,-allruntime,-gui,-webassemblyqt"
			case 9	# light guilib (QtCore, QtGui & QtWidgets)
				cPara += ",-dist,-gui,-lightguilib"
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
		if (cActiveFileName != Null) and (cActiveFileName != "noname.ring") {
			this.cCurrentDir = justfilepath(cActiveFileName)
		else 
			this.cCurrentDir = PWCT_FOLDER + T_APPLICATIONSFOLDER
		}

	func OSTerminal
		cDir = currentDir()
		UpdateCurrentDirectory()
		oDir = new QDir() 
		oDir.setCurrent(cCurrentDir)
		if isWindows() {
			cCommand = 'start cmd'
		elseif isLinux()
			cCommand = "gnome-terminal"
		elseif isMacosx()
			cCommand = "open /Applications/Utilities/Terminal.app"
		else 
			return
		}
		system(cCommand)
		chdir(cDir)

	func OSFilesManager 
		UpdateCurrentDirectory()
		new QDesktopServices {
			OpenURL(new qURL("file:///"+this.cCurrentDir))
		}

	func OpenFormDesigner	
		cFormFileName = exefolder() + "/../tools/formdesigner/formdesigner.ring"
		RunTool(cFormFileName)

	func OpenRingNotepad	
		cAppPath = exefolder() + "/../tools/ringnotepad/rnote.ring"
		RunTool(cAppPath)

	func RunEXE cFileName 
		oView.oProcessEditbox.setplaintext("")
		oView.oProcessText.setFocus(0)
		chdir(JustFilePath(cFileName))
		oView.oProcess = parent().oProgramController.RunProcess(cFileName,"",Method(:GetDataAction))
		chdir(PWCT_FOLDER)

	func RunTool cFileName
		oView.oProcessEditbox.setplaintext("")
		oView.oProcessText.setFocus(0)
		chdir(JustFilePath(cFileName))
		cRingEXE = exefilename()
		oView.oProcess = parent().oProgramController.RunProcess(cRingEXE,cFileName,Method(:GetDataAction))
		chdir(PWCT_FOLDER)

	func RunToolConsole cFileName
		if isWindows() {
			System('start call "'+exefolder()+'ring" "' + cFileName + '"' + nl)
		elseif isLinux()
			cCode = 'cd $(dirname "'+cFileName+'") ; x-terminal-emulator -e ' +
			 "'" + 'ring "' + cFileName + '";' + "' &" + nl
			system(cCode)
		elseif isMacosx()
			cCode = 'cd $(dirname "'+cFileName+'") ; osascript -e ' +
			 `'tell application "Terminal" to do script "ring \"`+cFileName+`\" "'`
			system(cCode)
		else
			cCode = 'cd $(dirname "'+cFileName+'") ; ' + ' ring "' + cFileName + '"' + nl
			system(cCode)
		}

	func REPLConsole
		cAppFileName = exefolder() + "/../tools/ringrepl/ringrepl.ring"
		RunToolConsole(cAppFileName)

	func REPLGUI
		cAppFileName = exefolder() + "/../tools/ringrepl/ringreplw.ring"
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
					adddockwidget(Qt_LeftDockWidgetArea,this.oView.oDockComponentsBrowser,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockGoalDesigner,2)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFormDesigner,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFilesManager,1)
					tabifydockwidget(this.oView.oDockFormDesigner,this.oView.oDockGoalDesigner)
					if lUseArabic {
						adddockwidget(Qt_LeftDockWidgetArea,this.oView.oDockOutputWindow,1)
						tabifydockwidget(this.oView.oDockFilesManager,this.oView.oDockComponentsBrowser)
					else 
						adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockOutputWindow,1)
						tabifydockwidget(this.oView.oDockOutputWindow,this.oView.oDockFilesManager)
						tabifydockwidget(this.oView.oDockComponentsBrowser,this.oView.oDockFilesManager)
					}
				}
				oView.oDockGoalDesigner.raise()
				oView.oDockComponentsBrowser.raise()
			on C_ENV_MODE_TESTING
				ShowDockableWindows()
				oView.win {
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockGoalDesigner,2)
					adddockwidget(Qt_BottomDockWidgetArea,this.oView.oDockOutputWindow,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFormDesigner,1)
					tabifydockwidget(this.oView.oDockFormDesigner,this.oView.oDockGoalDesigner)
					if lUseArabic {
						adddockwidget(Qt_LeftDockWidgetArea,this.oView.oDockFilesManager,1)
						adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockComponentsBrowser,1)
					else 
						adddockwidget(Qt_LeftDockWidgetArea,this.oView.oDockComponentsBrowser,1)
						adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFilesManager,1)
					}
					tabifydockwidget(this.oView.oDockComponentsBrowser,this.oView.oDockFilesManager)
				}
				oView.oDockGoalDesigner.raise()
				oView.oDockComponentsBrowser.raise()
			on C_ENV_MODE_LEFT
				ShowDockableWindows()
				oView.win {
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockGoalDesigner,2)
					adddockwidget(Qt_LeftDockWidgetArea,this.oView.oDockFilesManager,1)
					adddockwidget(Qt_LeftDockWidgetArea,this.oView.oDockComponentsBrowser,1)
					adddockwidget(Qt_BottomDockWidgetArea,this.oView.oDockOutputWindow,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFormDesigner,1)
					tabifydockwidget(this.oView.oDockGoalDesigner,this.oView.oDockFormDesigner)
					tabifydockwidget(this.oView.oDockComponentsBrowser,this.oView.oDockOutputWindow)
					tabifydockwidget(this.oView.oDockComponentsBrowser,this.oView.oDockFilesManager)
				}
				oView.oDockGoalDesigner.raise()
				oView.oDockComponentsBrowser.raise()
			on C_ENV_MODE_RIGHT
				ShowDockableWindows()
				oView.win {
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockGoalDesigner,2)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockComponentsBrowser,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFilesManager,1)
					adddockwidget(Qt_BottomDockWidgetArea,this.oView.oDockOutputWindow,1)
					adddockwidget(Qt_RightDockWidgetArea,this.oView.oDockFormDesigner,1)
					tabifydockwidget(this.oView.oDockGoalDesigner,this.oView.oDockFormDesigner)
					tabifydockwidget(this.oView.oDockComponentsBrowser,this.oView.oDockOutputWindow)
					tabifydockwidget(this.oView.oDockComponentsBrowser,this.oView.oDockFilesManager)
				}
				oView.oDockGoalDesigner.raise()
				oView.oDockComponentsBrowser.raise()
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
		if isWebAssembly() {
			oView.oDockFilesManager.hide()
			oView.win.Hide()
			oView.win.ShowMaximized()
		}

	func SetStyle nStyle
		C_ENV_DEFAULT_STYLE  = nStyle
		# This strange loop that repeat the code two times 
		# Is a workaround a bug in Qt when we change the style 
		# While many interaction pages are opened 
		for nTimes = 1 to 2 {
			Switch nStyle {
				on C_ENV_STYLE_WINDOWS
					StyleWindows()	
					StyleColorWhite()		
					C_STEPSTREE_BACKCOLOR	= '#ffffff'
					C_STEPCOLOR_STARTPOINT  = '#006400'
					C_STEPSTREE_LIGHTTREELINES = 0
				on C_ENV_STYLE_WINDOWSB
					StyleWindows()	
					StyleColorBlocks()		
					C_STEPSTREE_BACKCOLOR	= '#ffffff'
					C_STEPCOLOR_STARTPOINT  = '#006400'
					C_STEPSTREE_LIGHTTREELINES = 0
				on C_ENV_STYLE_WHITE
					StyleFusionWhite()
					StyleColorWhite()
					C_STEPSTREE_BACKCOLOR	= '#ffffff'
					C_STEPCOLOR_STARTPOINT  = '#006400'
					C_STEPSTREE_LIGHTTREELINES = 0
				on C_ENV_STYLE_WHITEB
					StyleFusionWhite()
					StyleColorBlocks()
					C_STEPSTREE_BACKCOLOR	= '#ffffff'
					C_STEPCOLOR_STARTPOINT  = '#006400'
					C_STEPSTREE_LIGHTTREELINES = 0
				on C_ENV_STYLE_BLACK
					StyleFusionBlack()
					StyleColorBlack()
					C_STEPSTREE_BACKCOLOR = '#212121'
					C_STEPCOLOR_STARTPOINT  = '#ffffff'
					C_STEPSTREE_LIGHTTREELINES = 2
				on C_ENV_STYLE_BLACKB
					StyleFusionBlack()
					StyleColorBlackBlocks()
					C_COMPONENTSBROWSER_COLOR = '#ffffff'
					C_STEPSTREE_BACKCOLOR = '#212121'
					C_STEPCOLOR_STARTPOINT  = '#ffffff'
					C_STEPSTREE_LIGHTTREELINES = 2
				on C_ENV_STYLE_MODERNBLACK
					StyleFusionBlack()
					StyleColorModernBlack()
					C_COMPONENTSBROWSER_COLOR = '#ffffff'
					C_STEPSTREE_BACKCOLOR = '#272822'
					C_STEPCOLOR_STARTPOINT  = '#ffffff'
					C_STEPSTREE_LIGHTTREELINES = 2
				on C_ENV_STYLE_SIMPLEBLACK
					StyleFusionBlack()
					StyleColorSimpleBlack()
					C_COMPONENTSBROWSER_COLOR = '#ffffff'
					C_STEPSTREE_BACKCOLOR = '#212121'
					C_STEPCOLOR_STARTPOINT  = '#ffffff'
					C_STEPSTREE_LIGHTTREELINES = 2
				on C_ENV_STYLE_BLUE
					StyleFusionBlue()
					StyleColorBlue()
					C_STEPCOLOR_STARTPOINT  = '#ffffff'
					C_STEPSTREE_LIGHTTREELINES = 2
				on C_ENV_STYLE_BLUE2
					StyleFusionBlue()
					StyleColorBlue2()
					C_STEPCOLOR_STARTPOINT  = '#ffffff'
					C_STEPSTREE_LIGHTTREELINES = 2
			}
		}
		parent().ComponentsBrowserWindow().oView.oComponentsTree.TreeStyle()
		parent().refreshStepsTree()
		if C_PROPERTIES_REFLECTCHANGEINFONTSIZE { 
			oView.oFilesTree.UpdateFontSize()
			OutputWindowFont()
		}
		parent().RefreshInteractionPagesColors()

	func StyleWindows
		if isWindows() {
			PWCT_APP.StyleWindowsVista()
		else 
			PWCT_APP.StyleWindows()
		}
		oView.oFilesTree.setTreeColor("black")

	func StyleColorBlocks()
		C_STEPCOLOR_COMMENT_TEXT = '#006400'
		C_STEPCOLOR_COMMENT_BACKCOLOR = '#ffd572'
		C_STEPCOLOR_ROOT_TEXT = '#2a3178'
		C_STEPCOLOR_ROOT_BACKCOLOR = '#6fff67'
		C_STEPCOLOR_ALLOWINTERACTION_TEXT = '#ffffff'
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = '#418aff'
		C_STEPCOLOR_INFO_TEXT = '#333f68'
		C_STEPCOLOR_INFO_BACKCOLOR = '#ffbb5c'
		C_STEPCOLOR_DATA_TEXT = '#808080'
		C_STEPCOLOR_DATA_BACKCOLOR = '#60fff5'	
		C_STEPSTREE_SELECTIONCOLOR		= '#000000'
		C_STEPSTREE_SELECTIONBACKGROUND		= "#00ffff"	
		C_COMPONENTSBROWSER_COLOR		= '#006400'
		C_INTERACTIONPAGE_TITLECOLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLEBACKCOLOR	= "#800080"

	func StyleColorBlackBlocks
		C_STEPCOLOR_COMMENT_TEXT = '#55007f'
		C_STEPCOLOR_COMMENT_BACKCOLOR = '#ffaaff'
		C_STEPCOLOR_ROOT_TEXT = '#00007f'
		C_STEPCOLOR_ROOT_BACKCOLOR = '#d1c060'
		C_STEPCOLOR_ALLOWINTERACTION_TEXT = '#55007f'
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = '#e1e1e1'
		C_STEPCOLOR_INFO_TEXT = '#afafaf'
		C_STEPCOLOR_INFO_BACKCOLOR = '#464646'
		C_STEPCOLOR_DATA_TEXT = '#000000'
		C_STEPCOLOR_DATA_BACKCOLOR = '#00ff00'
		C_STEPSTREE_SELECTIONCOLOR = '#ffffff'
		C_STEPSTREE_SELECTIONBACKGROUND = '#333333'
		C_COMPONENTSBROWSER_COLOR = '#ffffff'
		C_INTERACTIONPAGE_TITLECOLOR = '#ffffff'
		C_INTERACTIONPAGE_TITLEBACKCOLOR = '#000000'

	func StyleFusionWhite
		PWCT_APP.Stylefusion()
		oView.oFilesTree.setTreeColor("black")

	func StyleColorWhite
		C_STEPCOLOR_COMMENT_TEXT = '#00A100'
		C_STEPCOLOR_COMMENT_BACKCOLOR = ''
		C_STEPCOLOR_ROOT_TEXT = '#0000ff'
		C_STEPCOLOR_ROOT_BACKCOLOR = ''
		C_STEPCOLOR_ALLOWINTERACTION_TEXT = "#000000"
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = '#00FF00'
		C_STEPCOLOR_INFO_TEXT = "#000000"
		C_STEPCOLOR_INFO_BACKCOLOR = ''
		C_STEPCOLOR_DATA_TEXT = '#808080'
		C_STEPCOLOR_DATA_BACKCOLOR = ''
		C_STEPSTREE_SELECTIONCOLOR		= '#000000'
		C_STEPSTREE_SELECTIONBACKGROUND		= "#00ffff"
		C_COMPONENTSBROWSER_COLOR		= '#006400'
		C_INTERACTIONPAGE_TITLECOLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLEBACKCOLOR	= "#800080"

	func StyleFusionBlack
		PWCT_APP.Stylefusionblack()
		oView.oFilesTree.setTreeColor("white")

	func StyleColorBlue
		C_STEPCOLOR_COMMENT_TEXT = '#55007f'
		C_STEPCOLOR_COMMENT_BACKCOLOR = '#ffaaff'
		C_STEPCOLOR_ROOT_TEXT = '#e3e3e3'
		C_STEPCOLOR_ROOT_BACKCOLOR = '#55557f'
		C_STEPCOLOR_ALLOWINTERACTION_TEXT = '#55007f'
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = '#d6d6d6'
		C_STEPCOLOR_INFO_TEXT = '#808080'
		C_STEPCOLOR_INFO_BACKCOLOR = '#213146'
		C_STEPCOLOR_DATA_TEXT = '#00007f'
		C_STEPCOLOR_DATA_BACKCOLOR = '#3cb6b6'
		C_STEPSTREE_BACKCOLOR = '#0000A7'
		C_STEPSTREE_SELECTIONCOLOR = '#ffffff'
		C_STEPSTREE_SELECTIONBACKGROUND = "#000064"
		C_COMPONENTSBROWSER_COLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLECOLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLEBACKCOLOR	= "#000064"

	func StyleColorBlue2
		C_STEPCOLOR_COMMENT_TEXT = '#55007f'
		C_STEPCOLOR_COMMENT_BACKCOLOR = '#ffaaff'
		C_STEPCOLOR_ROOT_TEXT = '#00007f'
		C_STEPCOLOR_ROOT_BACKCOLOR = '#d1c060'
		C_STEPCOLOR_ALLOWINTERACTION_TEXT = '#55007f'
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = '#e1e1e1'
		C_STEPCOLOR_INFO_TEXT = '#afafaf'
		C_STEPCOLOR_INFO_BACKCOLOR = '#464646'
		C_STEPCOLOR_DATA_TEXT = '#000000'
		C_STEPCOLOR_DATA_BACKCOLOR = '#00ff00'
		C_STEPSTREE_BACKCOLOR = '#0000A7'
		C_STEPSTREE_SELECTIONCOLOR = '#ffffff'
		C_STEPSTREE_SELECTIONBACKGROUND = "#000064"
		C_COMPONENTSBROWSER_COLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLECOLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLEBACKCOLOR	= "#000064"

	func StyleFusionBlue 
		PWCT_APP.StylefusionCustom(
			new qColor() { setrgb(0,0,167,255) },
			new qColor() { setrgb(255,255,255,255) },
			new qColor() { setrgb(0,0,167,255) },
			new qColor() { setrgb(0,0,167,255) },
			new qColor() { setrgb(255,255,255,255) },
			new qColor() { setrgb(255,255,255,255) },
			new qColor() { setrgb(255,255,255,255) },
			new qColor() { setrgb(0,0,167,255) },
			new qColor() { setrgb(255,255,255,255) },
			new qColor() { setrgb(255,0,0,255) },
			new qColor() { setrgb(0,0,100,255) },
			new qColor() { setrgb(255,255,255,255)}
		)
		oView.oFilesTree.setTreeColor("white")

	func StyleColorBlack
		C_STEPCOLOR_COMMENT_TEXT = '#3e6677'
		C_STEPCOLOR_COMMENT_BACKCOLOR = ''
		C_STEPCOLOR_ROOT_TEXT = '#1dd1a6'
		C_STEPCOLOR_ROOT_BACKCOLOR = ''
		C_STEPCOLOR_ALLOWINTERACTION_TEXT = '#e2e2e2'
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = ""
		C_STEPCOLOR_INFO_TEXT = "#808080"
		C_STEPCOLOR_INFO_BACKCOLOR = ''
		C_STEPCOLOR_DATA_TEXT = '#e6bf4d'
		C_STEPCOLOR_DATA_BACKCOLOR = ''
		C_STEPSTREE_SELECTIONCOLOR = '#ffffff'
		C_STEPSTREE_SELECTIONBACKGROUND = '#333333'
		C_COMPONENTSBROWSER_COLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLECOLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLEBACKCOLOR	= '#000000'

	func StyleColorModernBlack
		C_STEPCOLOR_COMMENT_TEXT = '#75715e'
		C_STEPCOLOR_COMMENT_BACKCOLOR = ''
		C_STEPCOLOR_ROOT_TEXT = '#a6e22d'
		C_STEPCOLOR_ROOT_BACKCOLOR = ''
		C_STEPCOLOR_ALLOWINTERACTION_TEXT = '#f8f8f2'
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = '#272822'
		C_STEPCOLOR_INFO_TEXT = '#f92672'
		C_STEPCOLOR_INFO_BACKCOLOR = ''
		C_STEPCOLOR_DATA_TEXT = '#66d9ef'
		C_STEPCOLOR_DATA_BACKCOLOR = ''
		C_STEPSTREE_SELECTIONCOLOR = '#ffffff'
		C_STEPSTREE_SELECTIONBACKGROUND = '#333333'
		C_COMPONENTSBROWSER_COLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLECOLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLEBACKCOLOR	= '#000000'

	func StyleColorSimpleBlack
		C_STEPCOLOR_COMMENT_TEXT = '#55007f'
		C_STEPCOLOR_COMMENT_BACKCOLOR = '#ffaaff'
		C_STEPCOLOR_ROOT_TEXT = '#e3e3e3'
		C_STEPCOLOR_ROOT_BACKCOLOR = '#55557f'
		C_STEPCOLOR_ALLOWINTERACTION_TEXT = '#55007f'
		C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = '#d6d6d6'
		C_STEPCOLOR_INFO_TEXT = '#808080'
		C_STEPCOLOR_INFO_BACKCOLOR = '#213146'
		C_STEPCOLOR_DATA_TEXT = '#00007f'
		C_STEPCOLOR_DATA_BACKCOLOR = '#3cb6b6'
		C_STEPSTREE_SELECTIONCOLOR = '#ffffff'
		C_STEPSTREE_SELECTIONBACKGROUND = '#333333'
		C_COMPONENTSBROWSER_COLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLECOLOR		= '#ffffff'
		C_INTERACTIONPAGE_TITLEBACKCOLOR	= '#000000'

	func setLang nLanguage
		if C_ENV_DEFAULT_LANG = nLanguage {
			return
		}
		C_ENV_DEFAULT_LANG = nLanguage
		# Change the language
			switch nLanguage {
				case C_TRANSLATION_ENGLISH
					load again "../translation/english.ring"
				case C_TRANSLATION_ARABIC 
					load again "../translation/arabic.ring"
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

	func CloseTabsExceptTheFirstOne
		nMax = len(aActiveFiles)
		if nMax < 2 {
			return 
		}
		for t=2 to nMax {
			aActiveFiles[2][1].close()
			del(aActiveFiles,2)
		}
		setParentObject(aActiveFiles[1][4])


	func GotoLineAction
		parent().GoToLine()

	func NewEventName cFunctionName
		parent().newEventName(cFunctionName)

	func AppsCheckbox 

		nState = oView.oFTAppsCheckbox.checkstate()

		if nState {
				myindex2 = oView.ofile.index(oView.oDir.currentpath()+T_APPLICATIONSFOLDER,0)	
				oView.oFilesTree.setrootindex(myindex2)
		else 
				myindex2 = oView.ofile.index("",0)
				oView.oFilesTree.setrootindex(myindex2)
				myindex2 = oView.ofile.index(oView.oDir.currentpath()+T_APPLICATIONSFOLDER,0)
				oView.oFilesTree.setExpanded(myindex2,true)		
				oView.oFilesTree.setCurrentIndex(myindex2)	
		}		

	func setDockWidth oDock,nWidth 

		nWidthMin = oDock.minimumWidth()
		nWidthMax = oDock.maximumWidth()

		oDock.setMinimumWidth(nWidth)
		oDock.setMaximumWidth(nWidth)

		PWCT_App.processevents()

		if nWidthMin < nWidth {
			oDock.setMinimumWidth(nWidthMin)
		}
		if nWidthMax > nWidth {
			oDock.setMaximumWidth(nWidthMax)
		}


	func setDockHeight oDock,nHeight 

		nHeightMin = oDock.minimumHeight()
		nHeightMax = oDock.maximumHeight()

		oDock.setMinimumHeight(nHeight)
		oDock.setMaximumHeight(nHeight)

		PWCT_App.processevents()

		if nHeightMin < nHeight {
			oDock.setMinimumHeight(nHeightMin)
		}
		if nHeightMax > nHeight {
			oDock.setMaximumHeight(nHeightMax)
		}
