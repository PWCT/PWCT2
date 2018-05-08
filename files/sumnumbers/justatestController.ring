load "justatestView.ring"
import System.GUI
if isMainSourceFile() { 
	new App
		{
			StyleFusion()
			open_window(:justatestController)
			exec()
		}
}
class justatestController from WindowsControllerParent
	oView = new justatestView
	func AddName
		oView {
			listWidget1.AddItem(lineedit1.text())
		}
	func SumNumbers
		oView {
			nSum = 0
			for x = 1 to listWidget1.Count() step 1 { 
				nSum = nSum + listWidget1.item(x).text()
			}
			lineedit2.setText(""+nSum)
		}
private
