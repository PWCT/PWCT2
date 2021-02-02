/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_isspecial Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_isspecialComponentController from ComponentControllerParent 

	oView = new stdlib_isspecialComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_ISSPECIAL_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = isspecial("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_isspecialComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_ISSPECIAL_IP_TITLE )	
		TextBox( T_CT_STDLIB_ISSPECIAL_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_ISSPECIAL_IP_VALUE2 , :value2)
		PageButtons()
