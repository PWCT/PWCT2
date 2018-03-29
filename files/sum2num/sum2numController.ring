load "sum2numview.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:sum2numController)
			exec()
		}
}
class sum2numController from WindowsControllerParent
	oView = new sum2numView
	func sum
		oView {
			LineEdit3.setText(""+(0+Lineedit1.text()+Lineedit2.text()))
		}
private
