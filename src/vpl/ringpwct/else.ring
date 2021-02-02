/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Else Component
**	Date : 2017.07.05
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class ElseComponentController from ComponentControllerParent 

	oView = new ElseComponentView

	func GenerateAction 
								
		NewParentStep(T_CT_ELSE_ST_ELSE )  # "Else "
			SetStepCode("else ")
			AllowInteraction()
			NewStep(T_CT_ELSE_ST_STARTHERE) # "Start Here"
			oStep = GetActiveStep()
			SetActiveStep(oStep)

		return True 

	func AfterOpen 
		OkAction()

class ElseComponentView from ComponentViewParent
	 
		Title(T_CT_ELSE_IP_TITLE)	# "Else Component"
		PageButtons()
