/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_puts Component
**	Date : 2017.10.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_putsComponentController from ComponentControllerParent 

	oView = new stdlib_putsComponentView

	func GenerateAction 

		NewStep( T_CT_STDLIB_PUTS_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "puts("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_putsComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_PUTS_IP_TITLE )	
		TextBox( T_CT_STDLIB_PUTS_IP_VALUE , :value)
		PageButtons()
