/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  nestedfunc Component
**	Date : 2017.10.03
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class nestedfuncComponentController from ComponentControllerParent 

	oView = new nestedfuncComponentView

	func GenerateAction 

		NewParentStep( StepData(:value) + " = " + T_CT_ANONFUNC_ST_FUNC + StepData(:value2)   )
			SetStepCode( Variable(:value) + " = func " + Variable(:value2) + " {" )
			AllowInteraction()
			NewStep( T_CT_ANONFUNC_ST_STARTHERE )
			oStep = GetActiveStep()
			NewStep( T_CT_ANONFUNC_ST_END )
				SetStepCode( "}" )
			SetActiveStep(oStep)

		return True 

class nestedfuncComponentView from ComponentViewParent
	 
		Title( T_CT_NESTEDFUNC_IP_TITLE )	
		TextBox( T_CT_NESTEDFUNC_IP_VALUE , :value)
		TextBox( T_CT_NESTEDFUNC_IP_VALUE2 , :value2)
		PageButtons()
