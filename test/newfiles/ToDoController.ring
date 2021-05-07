load "ToDoView.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:ToDoController)
			exec()
		}
}
class ToDoController from WindowsControllerParent
	oView = new ToDoView
	func AddTask  { 
		oView {
			listWidget1.AddItem(LineEdit1.text())
		}
	} 
	func DeleteTask  { 
		oView {
			listWidget1.takeitem(ListWidget1.currentrow())
		}
	} 
	func test  { 
		oview {
			for t = 1 to 10 step 1 { 
				listWidget1.additem(""+t)
				if t = 3 { 
					lISTWIDGET1.ADDITEM("tHREE")
				} 
			} 
		}
	} 
	func TEST2  { 
		msginfo(:Wow,:nice)
	} 
	func test3  { 
		oView {
			listwidget1 {
				setstylesheet("color:white;Background-color:red;")
			}
		}
	} 
	func test4  { 
		oView.win.showMaximized()
	} 
private
