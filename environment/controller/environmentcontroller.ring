/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Environment Controller Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


class EnvironmentController from WindowsControllerParent

	oView = new EnvironmentView

	SetParents()
	SetFocusToStepsTree()

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
		Purpose : Set the focus to the steps tree
		Parameters : None
		Output : None
	*/

	func SetFocusToStepsTree
		Last_Window().oView.win.ActivateWindow()
		Last_Window().oView.oStepsTree.SetFocus(0)

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
		oItem = oView.tree1.currentindex()
		if oView.oFile.isdir(oItem) {
			return
		}
		cFileName = oView.oFile.filepath(oItem)
		if Parent().IsFileOpened() or not Parent().IsFileEmpty() {
			oDock = oView.CreateGoalDesigner(oView.win)
			oDock.setWindowTitle(cFileName)
			SetParents()
		else
			oView.oDockGoalDesigner.setWindowTitle(cFileName)
		}
		parent().oVisualSourceFile.cFileName = cFileName
		parent().OpenFileAction2()

	/*
		Purpose : Close Action - Close the window and the application 
		Parameters : None
		Output : None
	*/

	func CloseAction		
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
		System( "start " + exefolder()+"/../docs/ring.chm" )

	/*
		Purpose : Open Help - PDF File
		Parameters : None
		Output : None
	*/

	func PDFAction
		System( "start " + exefolder()+"/../docs/ring.pdf" )

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

