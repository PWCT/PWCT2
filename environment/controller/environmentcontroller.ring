/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Environment Controller Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


class EnvironmentController from WindowsControllerParent

	oView = new EnvironmentView

	SetParents()

	Last_Window().oView.win.ActivateWindow()
	Last_Window().oView.oStepsTree.SetFocus(0)

	func SetParents
		# Set the parent to be the Goal Designer Window	
			setParentObject(Last_Window())
		# Set the goal designer parent to be the Environment window
			Last_Window().setParentObject(self)

	func NewAction
		parent().NewFileAction()

	func OpenAction
		parent().OpenFileAction()

	func SaveAction
		parent().SaveCurrentFileAction()

	func SaveAsAction
		parent().SaveFileAction()

	func RunAction
		parent().RunAction()

	func RunGUIAction
		parent().RunGUIAction()

	func DebugAction
		parent().DebugAction()

	func ChangeFileAction
		oItem = oView.tree1.currentindex()
		if oView.oFile.isdir(oItem) {
			return
		}
		cFileName = oView.oFile.filepath(oItem)
		if Parent().IsFileOpened() {
			oDock = oView.CreateGoalDesigner(oView.win)
			oDock.setWindowTitle(cFileName)
			SetParents()
		}
		parent().oVisualSourceFile.cFileName = cFileName
		parent().OpenFileAction2()

	func CloseAction
		Super.CloseAction()
		PWCT_APP.Quit()

	func PrintAction
		parent().PrintStepsAction()

	func CutAction
		parent().CutStepsAction()

	func CopyAction
		parent().CopyStepsAction()

	func PasteAction
		parent().PasteStepsAction()

	func FontAction
		parent().FontAction()		

	func FindAction
		parent().SearchAction()

	func ProjectAction
		ToggleVisible(oView.oDock1)

	func GoalDesignerAction
		ToggleVisible(oView.oDock2)

	func ToggleVisible oObject
		if oObject.isvisible() {
			oObject.hide()
		else
			oObject.Show()
		}

	func CHMAction
		System( "start " + exefolder()+"/../docs/ring.chm" )

	func PDFAction
		System( "start " + exefolder()+"/../docs/ring.pdf" )

	func LanguageAction
		ShowMessage("Programming Language",
		"This application developed using the Ring programming language")

	func GUIAction
		ShowMessage("GUI Library",
		"This application uses the Qt GUI Library through RingQt")

	func AboutAction
		ShowMessage("About",
		"2017, Mahmoud Fayed <msfclipper@yahoo.com>")	
