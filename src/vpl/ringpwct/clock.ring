/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  clock Component
**	Date : 2017.07.26
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class clockComponentController from ComponentControllerParent 

	oView = new clockComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_CLOCK_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "clock()" )

		return True 

class clockComponentView from ComponentViewParent
	 
		Title( T_CT_CLOCK_IP_TITLE )	
		TextBox( T_CT_CLOCK_IP_VALUE , :value)
		PageButtons()
