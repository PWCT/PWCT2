/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  braces Component
**	Date : 2017.10.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class bracesComponentController from ComponentControllerParent 

	oView = new bracesComponentView

	func GenerateAction 

		NewParentStep( T_CT_BRACES_ST_BRACESTART )
			SetStepCode( "{" )
			AllowInteraction()
			NewStep( T_CT_BRACES_ST_STARTHERE )
			oStep = GetActiveStep()
			NewStep( T_CT_BRACES_ST_BRACEEND )
			SetStepCode( "}" )
			SetActiveStep(oStep)

		return True 

	func AfterOpen 
		OkAction()

class bracesComponentView from ComponentViewParent
	 
		Title( T_CT_BRACES_IP_TITLE )	

		PageButtons()
