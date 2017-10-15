/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_print Component
**	Date : 2017.10.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_printComponentController from ComponentControllerParent 

	oView = new stdlib_printComponentView

	func GenerateAction 

		NewStep( T_CT_STDLIB_PRINT_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "print("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_printComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_PRINT_IP_TITLE )	
		TextBox( T_CT_STDLIB_PRINT_IP_VALUE , :value)
		PageButtons()
