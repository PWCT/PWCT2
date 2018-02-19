load "sayhelloview.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:SayHelloController)
			exec()
		}
}
class sayHelloController from WindowsControllerParent
	oView = new SayHelloView
	func sayHello
		oView {
			label2.setText("Hello Mr. " + lineedit1.text())
		}
	func test
		oView {
			win.setwindowtitle("Nice test")
		}
private
