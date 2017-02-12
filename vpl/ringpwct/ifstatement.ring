/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  If Statement Component
**	Date : 2017.02.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class IfStatementComponentController from ComponentControllerParent 

	oView = new IfStatementComponentView

	func GenerateAction 

		NewParentStep(T_CT_IFSTATEMENT_ST_IF + oStyle.text(   Variable(:condition) ,:green,"")  )  # "If "
			SetStepCode("if " +  Variable(:condition) + " { " )
			AllowInteraction()
			NewStep(T_CT_IFSTATEMENT_ST_STARTHERE) # "Start Here"
			oStep = GetActiveStep()
			NewStep(T_CT_IFSTATEMENT_ST_ENDOFIFSTATEMENT) # "End of IF Statement"
				SetStepCode("}")
			SetActiveStep(oStep)

class IfStatementComponentView from ComponentViewParent
	 
		Title(T_CT_IFSTEATEMENT_IP_TITLE)	# "If Statement Component"
		TextBox(T_CT_IFSTEATEMENT_IP_CONDITION , :condition) # "Condition : "
		PageButtons()
