func PrintComponentStart oParent
	Open_Window(:PrintComponentController)
	Last_Window().setParentObject(oParent)

Class PrintComponentController from ComponentControllerParent 

	oView = new PrintComponentView

	func testAction 
		oItem = parent().AddStep('test')
		parent().oView.oStepsTree.SetCurrentItem(oItem,0)
		oItem = parent().AddStep('one')
		nStepID = parent().oView.oStepsTree.GetIDByObj(oItem)
		parent().oModel.SaveStepCode(nStepID,"The one step code")
		oItem = parent().AddStep('two')
		nStepID = parent().oView.oStepsTree.GetIDByObj(oItem)
		parent().oModel.SaveStepCode(nStepID,"The two step code")

class PrintComponentView from ComponentViewParent
	win = new qWidget() {
		resize(400,400)
		setWindowTitle("Print Component")
		#setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint) 
		new qPushButton(win) {
			setText(:test)
			setClickEvent( Method(:TestAction) )
		}
	}
