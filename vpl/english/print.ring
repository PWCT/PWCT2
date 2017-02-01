func PrintComponentStart oParent
	Open_Window(:PrintComponentController)
	Last_Window().setParentObject(oParent)

Class PrintComponentController from ComponentControllerParent 

	oView = new PrintComponentView

	func testAction 
		oParent = SaveParent()
		NewParentStep(:Test)
			NewStep(:one)
				SetStepCode("The one step code")
			NewStep(:two)
				SetStepCode("The two step code")
				oParent2 = SaveLast()
		SetParent(oParent)
		NewParentStep(:Test2)
			NewStep(:one2)
				SetStepCode("The one step code")
			NewStep(:two2)
				SetStepCode("The two step code")
		SetParent(oParent2)
		SetStepCode("Yes I'm the new code")

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
