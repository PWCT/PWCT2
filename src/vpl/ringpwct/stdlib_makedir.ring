/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_makedir Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_makedirComponentController from ComponentControllerParent 

	oView = new stdlib_makedirComponentView

	func GenerateAction 

		NewStep( T_CT_STDLIB_MAKEDIR_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "makedir("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_makedirComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_MAKEDIR_IP_TITLE )	
		TextBox( T_CT_STDLIB_MAKEDIR_IP_VALUE , :value)
		PageButtons()
