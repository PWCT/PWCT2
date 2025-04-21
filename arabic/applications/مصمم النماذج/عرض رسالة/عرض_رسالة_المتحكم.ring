load "عرض_رسالة_العرض.ring"
import System.GUI
if IsMainSourceFile() {
تطبيق= new App {
	stylefusion()
	Open_Window(:عرض_رسالة_المتحكم)
	exec()
}
}
class عرض_رسالة_المتحكم from windowsControllerParent
oView = new عرض_رسالةView
كائن_العرض = ref(oView)
addAttribute(oView,'نافذة')
oView.نافذة = oView.win
	func مرحبا  { 
		كائن_العرض {
			msginfo("السلام عليكم","كيف حالكم جميعا!")
		}
	} 
	func اغلاق  { 
		كائن_العرض {
			نافذة.close()
		}
	} 
