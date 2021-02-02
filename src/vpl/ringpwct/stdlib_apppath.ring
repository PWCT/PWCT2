/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_apppath Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_apppathComponentController from ComponentControllerParent 

	oView = new stdlib_apppathComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_STDLIB_APPPATH_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "apppath()" )

		return True 

class stdlib_apppathComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_APPPATH_IP_TITLE )	
		TextBox( T_CT_STDLIB_APPPATH_IP_VALUE , :value)
		PageButtons()
