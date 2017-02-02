func PrintComponentStart oParent
	Open_Window(:PrintComponentController)
	Last_Window().setParentObject(oParent)

Class PrintComponentController from ComponentControllerParent 

	oView = new PrintComponentView

	func GenerateAction 
		NewParentStep("Print Text : " + Variable(:text))
		SetStepCode("See " + Variable(:text) )

class PrintComponentView from ComponentViewParent
	 
		Title("Print Component")
		TextBox("Enter text : " , :text)
		PageButtons()
