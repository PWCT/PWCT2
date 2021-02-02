/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  time Component
**	Date : 2017.07.26
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class timeComponentController from ComponentControllerParent 

	oView = new timeComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_TIME_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "time()" )

		return True 

class timeComponentView from ComponentViewParent
	 
		Title( T_CT_TIME_IP_TITLE )	
		TextBox( T_CT_TIME_IP_VALUE , :value)
		PageButtons()
