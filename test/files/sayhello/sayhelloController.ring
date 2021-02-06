load "sayhelloView.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:sayhelloController)
			exec()
		}
}
class sayhelloController from WindowsControllerParent
	oView = new sayhelloView
	func sayhello
		msginfo("First Application","Hello!")
private
