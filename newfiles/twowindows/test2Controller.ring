load "test2View.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:test2Controller)
			exec()
		}
}
class test2Controller from WindowsControllerParent
	oView = new test2View
	func change
		oView.win.setwindowtitle("New Title!" + " Date : " + Date() + " Time : " + Time())
private
