/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Basic Program Component
**	Date : 2017.07.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class BasicProgramComponentController from ComponentControllerParent 

	oView = new BasicProgramComponentView

	lNoInteractionPage = True

	func GenerateAction 
								
		NewParentStep(T_CT_BASICPROGRAM_ST_THEFIRSTSTEP )  
			AllowInteraction()
			NewStep(T_CT_BASICPROGRAM_ST_LOADFILES) 
			oStep = GetActiveStep()
			AllowInteraction()
			NewStep(T_CT_BASICPROGRAM_ST_STATEMENTS) 
			AllowInteraction()
			NewStep(T_CT_BASICPROGRAM_ST_FUNCTIONS) 
			AllowInteraction()
			NewStep(T_CT_BASICPROGRAM_ST_CLASSES) 
			SetActiveStep(oStep)

		return True 

	func AfterOpen 
		OkAction()

class BasicProgramComponentView from ComponentViewParent
	 
		Title(T_CT_BASICPROGRAM_IP_TITLE)	
		PageButtons()
