/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_sleep Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_sleepComponentController from ComponentControllerParent 

	oView = new stdlib_sleepComponentView

	func GenerateAction 

		NewStep( T_CT_STDLIB_SLEEP_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "sleep("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_sleepComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_SLEEP_IP_TITLE )	
		TextBox( T_CT_STDLIB_SLEEP_IP_VALUE , :value)
		PageButtons()
