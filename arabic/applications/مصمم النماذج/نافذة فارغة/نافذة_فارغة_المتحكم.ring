load "نافذة_فارغة_العرض.ring"
import System.GUI
if IsMainSourceFile() {
تطبيق= new App {
	stylefusion()
	Open_Window(:نافذة_فارغة_المتحكم)
	exec()
}
}
class نافذة_فارغة_المتحكم from windowsControllerParent
oView = new نافذة_فارغةView
كائن_العرض = ref(oView)
addAttribute(oView,'نافذة')
oView.نافذة = oView.win
