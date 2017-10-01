/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  accessobject Component
**	Date : 2017.10.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class accessobjectComponentController from ComponentControllerParent 

	oView = new accessobjectComponentView

	func GenerateAction 

		NewParentStep( StepData(:Value) + " " +  T_CT_BRACES_ST_BRACESTART )
			SetStepCode( Variable(:value) + " {" )
			AllowInteraction()
			NewStep( T_CT_BRACES_ST_STARTHERE )
			oStep = GetActiveStep()
			NewStep( T_CT_BRACES_ST_BRACEEND )
			SetStepCode( "}" )
			SetActiveStep(oStep)

		return True 

class accessobjectComponentView from ComponentViewParent
	 
		Title( T_CT_ACCESSOBJECT_IP_TITLE )	
		TextBox( T_CT_ACCESSOBJECT_IP_VALUE , :value)
		PageButtons()
