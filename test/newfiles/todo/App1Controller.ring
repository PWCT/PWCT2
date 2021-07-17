load "App1View.ring"
import System.GUI
if isMainSourceFile() { 
	new App
	{
		StyleFusion()
		open_window(:App1Controller)
		exec()
	}
}
class App1Controller from WindowsControllerParent
	oView = new App1View
	func sayhello  { 
		oView {
			ListWidget1.additem(LineEdit1.text())
		}
	} 
