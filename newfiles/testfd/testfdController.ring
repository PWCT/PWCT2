load "testfdview.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:testfdController)
			exec()
		}
}
class testfdController from WindowsControllerParent
	oView = new testfdView
	func one
		msginfo(:hello,:one)
	func two
		msginfo(:hello,:two)
	func three
		msginfo(:hello,:three)
private
