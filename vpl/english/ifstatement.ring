/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  If Statement Component
**	Date : 2017.02.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

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
