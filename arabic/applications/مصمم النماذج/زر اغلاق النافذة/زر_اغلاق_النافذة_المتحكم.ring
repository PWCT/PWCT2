load "زر_اغلاق_النافذة_العرض.ring"
import System.GUI
if IsMainSourceFile() {
تطبيق= new App {
	stylefusion()
	Open_Window(:زر_اغلاق_النافذة_المتحكم)
	exec()
}
}
class زر_اغلاق_النافذة_المتحكم from windowsControllerParent
oView = new زر_اغلاق_النافذةView
كائن_العرض = ref(oView)
addAttribute(oView,'نافذة')
oView.نافذة = oView.win
	func اغلاق_التطبيق  { 
		كائن_العرض {
			نافذة.close()
		}
	} 
