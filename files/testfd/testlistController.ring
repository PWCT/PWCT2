load "testlistview.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:testlistController)
			exec()
		}
}
class testlistController from WindowsControllerParent
	oView = new testlistView
	func AddItem
		oView {
			cText = LineEdit1.text()
			ListWidget1.additem(cText)
		}
	func DeleteItem
		oView {
			nRow = ListWidget1.currentrow()
			ListWidget1.takeitem(nRow)
		}
private
