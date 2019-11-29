load "welcomeView.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:welcomeController)
			exec()
		}
}
class welcomeController from WindowsControllerParent
	oView = new welcomeView
	func hello
		msginfo("Koko","Hello")
	func print
private
