/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  date Component
**	Date : 2017.07.26
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class dateComponentController from ComponentControllerParent 

	oView = new dateComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_DATE_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "date()" )

		return True 

class dateComponentView from ComponentViewParent
	 
		Title( T_CT_DATE_IP_TITLE )	
		TextBox( T_CT_DATE_IP_VALUE , :value)
		PageButtons()
