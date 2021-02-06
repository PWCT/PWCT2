load "testView.ring"
load "test2Controller.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:testController)
			exec()
		}
}
class testController from WindowsControllerParent
	oView = new testView
	func test
		oView.ListWidget1.additem("TEST")
	func AddNumbers
		for x = 1 to 10 step 1 { 
			oView.ListWidget1.additem("Number : " + x)
		}
	func myAdd
		oView.ListWidget1.additem(oView.LineEdit1.text())
	func second
		open_window(:test2Controller)
private
