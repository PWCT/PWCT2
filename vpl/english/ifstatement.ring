Class IfStatementComponentController from ComponentControllerParent 

	oView = new IfStatementComponentView

	func GenerateAction 

		NewParentStep("If " + Variable(:condition))
			SetStepCode("if " +  Variable(:condition) + " { " )
			AllowInteraction()
			NewStep("Start Here")
			oStep = GetActiveStep()
			NewStep("End of IF Statement")
				SetStepCode("}")
			SetActiveStep(oStep)

class IfStatementComponentView from ComponentViewParent
	 
		Title("If Statement Component")
		TextBox("Condition : " , :condition)
		PageButtons()
