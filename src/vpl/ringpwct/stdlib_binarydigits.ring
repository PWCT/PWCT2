/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_binarydigits Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_binarydigitsComponentController from ComponentControllerParent 

	oView = new stdlib_binarydigitsComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_BINARYDIGITS_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = binarydigits("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_binarydigitsComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_BINARYDIGITS_IP_TITLE )	
		TextBox( T_CT_STDLIB_BINARYDIGITS_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_BINARYDIGITS_IP_VALUE2 , :value2)
		PageButtons()
