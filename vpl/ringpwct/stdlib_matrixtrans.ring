/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_matrixtrans Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_matrixtransComponentController from ComponentControllerParent 

	oView = new stdlib_matrixtransComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_MATRIXTRANS_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = matrixtrans("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_matrixtransComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_MATRIXTRANS_IP_TITLE )	
		TextBox( T_CT_STDLIB_MATRIXTRANS_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_MATRIXTRANS_IP_VALUE2 , :value2)
		PageButtons()
