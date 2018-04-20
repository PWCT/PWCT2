load "app1view.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:app1Controller)
			exec()
		}
}
class app1Controller from WindowsControllerParent
	oView = new app1View
	func رسالة
		msginfo(" مرحبا "," كيف حالك يارجال ! ")
	func خروج
		oView.win.close()
private
