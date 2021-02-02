/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  assert Component
**	Date : 2017.09.26
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class assertComponentController from ComponentControllerParent 

	oView = new assertComponentView

	func GenerateAction 

		NewStep( T_CT_ASSERT_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "assert("  + Variable(:Value ) + ")"  )

		return True 

class assertComponentView from ComponentViewParent
	 
		Title( T_CT_ASSERT_IP_TITLE )	
		TextBox( T_CT_ASSERT_IP_VALUE , :value)
		PageButtons()
