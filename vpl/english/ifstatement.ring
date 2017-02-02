Class IfStatementComponentController from ComponentControllerParent 

	oView = new IfStatementComponentView

	func GenerateAction 

		NewParentStep("If " + Variable(:condition))
			SetStepCode("if " +  Variable(:condition) + " { " )
			NewStep("Start Here")
			NewStep("End of IF Statement")
				SetStepCode("}")

class IfStatementComponentView from ComponentViewParent
	 
		Title("If Statement Component")
		TextBox("Enter Condition : " , :condition)
		PageButtons()
