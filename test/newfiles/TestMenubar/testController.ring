load "testView.ring"
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
	func about
		msginfo("About","Using the Menubar")
	func closeapp
		oView.win.close()
