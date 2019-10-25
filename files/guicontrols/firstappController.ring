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
	func test
		msginfo(" Welcome ","Nice ")
	func sayhello
		cText = oView.LineEdit1.text()
		msginfo("Welcome ","Hello " + cText)
	func close
		oView.win.close()
	func AddItems
		oView.listwidget1.additem("ONE")
	func ShowText
		cText = oView.textedit1.toplaintext()
		msginfo("Welcome ",cText)
	func increase
		nValue = oView.progressbar1.value()
		oView.progressbar1.setvalue(nValue+10)
	func decrease
		nValue = oView.progressbar1.value()
		oView.progressbar1.setvalue(nValue-10)
private
