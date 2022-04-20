load "App1View.ring"
load "csvlib.ring"
import System.GUI
if isMainSourceFile() { 
	new App
	{
		StyleFusion()
		open_window(:App1Controller)
		exec()
	}
}
class App1Controller from WindowsControllerParent
	oView = new App1View
	aList
	process()
	func process 
		alist = []
		for t = 1 to 10 step 1 { 
			aList+[t,t*t]
		} 
		oView.tablewidget1.addList(aList)
	func Save_to_CSV  { 
		oView {
			cFile = list2csv(this.aList)
			write("myfile.csv",cFile)
			system("start myfile.csv")
		}
	} 
