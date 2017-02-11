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
		Purpose : 
		Parameters :
		Output : 
	*/

	func SetParents
		# Set the parent to be the Goal Designer Window	
			setParentObject(Last_Window())
		# Set the goal designer parent to be the Environment window
			Last_Window().setParentObject(self)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SetFocusToStepsTree
		Last_Window().oView.win.ActivateWindow()
		Last_Window().oView.oStepsTree.SetFocus(0)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func NewAction
		parent().NewFileAction()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func OpenAction
		parent().OpenFileAction()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SaveAction
		parent().SaveCurrentFileAction()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SaveAsAction
		parent().SaveFileAction()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func RunAction
		parent().RunAction()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func RunGUIAction
		parent().RunGUIAction()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func DebugAction
		parent().DebugAction()

	/*
		Purpose : 
		Parameters :
		Output : 
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
		Purpose : 
		Parameters :
		Output : 
	*/

	func CloseAction
		Super.CloseAction()
		PWCT_APP.Quit()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func PrintAction
		parent().PrintStepsAction()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func CutAction
		parent().CutStepsAction()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func CopyAction
		parent().CopyStepsAction()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func PasteAction
		parent().PasteStepsAction()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func FontAction
		parent().FontAction()		

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func FindAction
		parent().SearchAction()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func ProjectAction
		ToggleVisible(oView.oDockFilesManager)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GoalDesignerAction
		ToggleVisible(oView.oDockGoalDesigner)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func ToggleVisible oObject
		if oObject.isvisible() {
			oObject.hide()
		else
			oObject.Show()
		}

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func CHMAction
		System( "start " + exefolder()+"/../docs/ring.chm" )

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func PDFAction
		System( "start " + exefolder()+"/../docs/ring.pdf" )

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func LanguageAction
		ShowMessage("Programming Language",
		"This application developed using the Ring programming language")

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GUIAction
		ShowMessage("GUI Library",
		"This application uses the Qt GUI Library through RingQt")

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func AboutAction
		ShowMessage("About",
		"2017, Mahmoud Fayed <msfclipper@yahoo.com>")	
