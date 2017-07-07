/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Try Catch Component
**	Date : 2017.07.07
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class TryCatchComponentController from ComponentControllerParent 

	oView = new TryCatchComponentView

	func GenerateAction 
								
		NewParentStep(T_CT_TRYCATCH_ST_TRY )  
			SetStepCode("try { ")
			AllowInteraction()
			NewStep(T_CT_TRYCATCH_ST_STARTHERE) 
			oStep = GetActiveStep()

		NewParentStep(T_CT_TRYCATCH_ST_CATCH )  
			SetStepCode("Catch ")
			AllowInteraction()
			NewStep(T_CT_TRYCATCH_ST_STARTHERE) 

			NewStep(T_CT_TRYCATCH_ST_END) 
			SetStepCode("} ")

			SetActiveStep(oStep)

		return True 

	func AfterOpen 
		OkAction()

class TryCatchComponentView from ComponentViewParent
	 
		Title(T_CT_TRYCATCH_IP_TITLE)	# "Try Catch Component"
		PageButtons()
