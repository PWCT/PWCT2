/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Environment Controller Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


class EnvironmentController from WindowsControllerParent

	oView = new EnvironmentView

	# Set the parent to be the Goal Designer Window	
		setParentObject(Last_Window())
	 
	func NewAction

	func OpenAction
		parent().OpenFileAction()

	func SaveAction

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
		parent().oVisualSourceFile.cFileName = oView.oFile.filepath(oItem)
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
