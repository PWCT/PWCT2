/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_capitalized Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_capitalizedComponentController from ComponentControllerParent 

	oView = new stdlib_capitalizedComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_CAPITALIZED_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = capitalized("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_capitalizedComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_CAPITALIZED_IP_TITLE )	
		TextBox( T_CT_STDLIB_CAPITALIZED_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_CAPITALIZED_IP_VALUE2 , :value2)
		PageButtons()
