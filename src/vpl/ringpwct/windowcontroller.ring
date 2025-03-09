/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  windowcontroller Component
**	Date : 2025.03.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class windowcontrollerComponentController from ComponentControllerParent 

	oView = new windowcontrollerComponentView

	func GenerateAction 

		NewStep( "TEST" )
		SetStepCode( "TEST"  )

		return True 

class windowcontrollerComponentView from ComponentViewParent
	 
		Title( T_CT_WINDOWCONTROLLER_IP_TITLE )	
		TextBox( T_CT_WINDOWCONTROLLER_IP_VALUE , :value)
		TextBox( T_CT_WINDOWCONTROLLER_IP_VALUE2 , :value2)
		TextBox( T_CT_WINDOWCONTROLLER_IP_VALUE3 , :value3)
		PageButtons()
