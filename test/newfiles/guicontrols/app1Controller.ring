load "app1View.ring"
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
	func test  { 
		oView {
			Label1.settext("wwwwwww")
			Button1.setstylesheet("background-color: yellow")
			LineEdit1.settext("great")
			TextEdit1.settext("wow")
			ListWidget1.additem("test")
			Checkbox1.setcheckstate(2)
			Slider1.setvalue(100)
			Progressbar1.setvalue(100)
			Spinbox1.setvalue(99)
			Combobox1.additem("wow",0)
			DateTimeEdit1.setdate(new QDate())
			TableWidget1.setrowcount(100)
			node1 = new QTreeWidgetItem()
			{
				setText(0,"Test")
			}
			lbl = new qLabel(NULL) { 
			setText("test")
			move(10,10)
			resize(100,30)
			setStyleSheet(" ")
			}
			TreeWidget1.addtoplevelitem(node1)
			TreeWidget1.setitemwidget(node1, 0, lbl)
			TreeWidget1.show()
			TreeWidget1.setstylesheet("background-color:purple")
			RadioButton1.setcheckable(True )
			WebView1.seturl(new QURL("https://www.google.com"))
			Dial1.setvalue(99)
			VideoWidget1.setstylesheet("background-color:Black;")
			Frame1.setframestyle(2)
			LCDNumber1.display(10)
		}
	} 
