load "myfirstappView.ring"
import System.GUI
if isMainSourceFile() { 
	new App
	{
		StyleFusion()
		open_window(:myfirstappController)
		exec()
	}
}
class myfirstappController from WindowsControllerParent
	oView = new myfirstappView
	oView {
		this.mybuttonSettings(Button1)
	}
	func SayHello  { 
		oView {
			msginfo("Hi","Hello")
		}
	} 
	func mybuttonSettings oButton { 
		oButton {
			setminimumheight(height())
			setminimumwidth(width())
		}
	} 
