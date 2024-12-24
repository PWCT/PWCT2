/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  increment Component
**	Date : 2024.12.24
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class incrementComponentController from ComponentControllerParent 

	oView = new incrementComponentView

	func GenerateAction 

		NewStep(  StyleData(Variable(:value)) + "++" )
		SetStepCode( Variable(:value) + "++"  )

		return True 


class incrementComponentView from ComponentViewParent
	 
		Title( T_CT_INCREMENT_IP_TITLE )	
		TextBox( T_CT_INCREMENT_IP_VALUE , :value)
		PageButtons()
