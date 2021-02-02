/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  timelist Component
**	Date : 2017.07.26
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class timelistComponentController from ComponentControllerParent 

	oView = new timelistComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_TIMELIST_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "timelist()" )

		return True 

class timelistComponentView from ComponentViewParent
	 
		Title( T_CT_TIMELIST_IP_TITLE )	
		TextBox( T_CT_TIMELIST_IP_VALUE , :value)
		PageButtons()
