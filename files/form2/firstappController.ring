load "firstappView.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:firstappController)
			exec()
		}
}
class firstappController from WindowsControllerParent
	oView = new firstappView
	func SayHello
		msginfo("PWCT","Hello, World")
private
