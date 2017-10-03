/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  anonfunc Component
**	Date : 2017.10.03
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class anonfuncComponentController from ComponentControllerParent 

	oView = new anonfuncComponentView

	func GenerateAction 

		NewParentStep( T_CT_ANONFUNC_ST_FUNC + StepData(:value)   )
			SetStepCode( "func " + Variable(:value) + " {" )
			AllowInteraction()
			NewStep( T_CT_ANONFUNC_ST_STARTHERE )
			oStep = GetActiveStep()
			NewStep( T_CT_ANONFUNC_ST_END )
				SetStepCode( "}" )
			SetActiveStep(oStep)

		return True 

class anonfuncComponentView from ComponentViewParent
	 
		Title( T_CT_ANONFUNC_IP_TITLE )	
		TextBox( T_CT_ANONFUNC_IP_VALUE , :value)
		PageButtons()
