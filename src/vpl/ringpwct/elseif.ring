/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  ElseIf Component
**	Date : 2017.07.05
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class ElseIfComponentController from ComponentControllerParent 

	oView = new ElseIfComponentView

	func GenerateAction 
								
		if NoValueMsg(:condition) { return False }

		NewParentStep(T_CT_ELSEIF_ST_ELSEIF + StyleData(Variable(:condition) )  )  # "If "
			SetStepCode("elseif " +  Variable(:condition))
			AllowInteraction()
			NewStep(T_CT_ELSEIF_ST_STARTHERE) # "Start Here"
			oStep = GetActiveStep()
			SetActiveStep(oStep)

		return True 

class ElseIFComponentView from ComponentViewParent
	 
		Title(T_CT_ELSEIF_IP_TITLE)	# "ElseIf Component"
		TextBox(T_CT_ELSEIF_IP_CONDITION , :condition) # "Condition : "
		PageButtons()
