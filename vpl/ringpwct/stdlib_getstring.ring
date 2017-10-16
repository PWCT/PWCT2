/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_getstring Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_getstringComponentController from ComponentControllerParent 

	oView = new stdlib_getstringComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_STDLIB_GETSTRING_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "getstring()" )

		return True 

class stdlib_getstringComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_GETSTRING_IP_TITLE )	
		TextBox( T_CT_STDLIB_GETSTRING_IP_VALUE , :value)
		PageButtons()
