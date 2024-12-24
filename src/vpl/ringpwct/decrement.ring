/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  decrement Component
**	Date : 2024.12.24
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class decrementComponentController from ComponentControllerParent 

	oView = new decrementComponentView

	func GenerateAction 

		NewStep(  StyleData(Variable(:value)) + "--" )
		SetStepCode( Variable(:value) + "--"  )

		return True 

class decrementComponentView from ComponentViewParent
	 
		Title( T_CT_DECREMENT_IP_TITLE )	
		TextBox( T_CT_DECREMENT_IP_VALUE , :value)
		PageButtons()
