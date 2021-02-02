/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  clockspersecond Component
**	Date : 2017.07.26
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class clockspersecondComponentController from ComponentControllerParent 

	oView = new clockspersecondComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_CLOCKSPERSECOND_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "clockspersecond()" )

		return True 

class clockspersecondComponentView from ComponentViewParent
	 
		Title( T_CT_CLOCKSPERSECOND_IP_TITLE )	
		TextBox( T_CT_CLOCKSPERSECOND_IP_VALUE , :value)
		PageButtons()
