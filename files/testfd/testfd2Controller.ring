load "testfd2view.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:testfd2Controller)
			exec()
		}
}
class testfd2Controller from WindowsControllerParent
	oView = new testfd2View
	func welcome
		msginfo(:hello,:welcome)
private
