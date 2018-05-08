load "test1View.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:test1Controller)
			exec()
		}
}
class test1Controller from WindowsControllerParent
	oView = new test1View
	func sayhello
		msginfo("Test ","Hello, World!")
	func saywelcome
		msginfo("Test ","Welcome ")
private
