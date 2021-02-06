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
	func سلام
		msginfo(" كيف الحال ","السلام عليكم ورحمة الله وبركاته ")
private
