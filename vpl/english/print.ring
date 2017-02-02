func PrintComponentStart oParent
	Open_Window(:PrintComponentController)
	Last_Window().setParentObject(oParent)

Class PrintComponentController from ComponentControllerParent 

	oView = new PrintComponentView

	func GenerateAction 
		if Variable(:type) = 1 {
			NewParentStep("Print Text : " + Variable(:text))
			SetStepCode("See " + CHAR(34) + Variable(:text) + CHAR(34) )
		else
			NewParentStep("Print Expression : " + Variable(:text))	
			SetStepCode("See " + Variable(:text) )	
		}

class PrintComponentView from ComponentViewParent
	 
		Title("Print Component")
		TextBox("Enter text : " , :text)
		ListBox("Type :", :type , ["Literal","Expression"])
		PageButtons()
