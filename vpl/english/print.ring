Class PrintComponentController from ComponentControllerParent 

	oView = new PrintComponentView

	func GenerateAction 

		NewStep("Print " + Variable(:text))
		if Variable(:type) = 1 {
			SetStepCode("See " + CHAR(34) + Variable(:text) + CHAR(34) )
		else
			SetStepCode("See " + Variable(:text) )	
		}

class PrintComponentView from ComponentViewParent
	 
		Title("Print Component")
		TextBox("Text : " , :text)
		ListBox("Type :", :type , ["Literal","Expression"])
		PageButtons()
