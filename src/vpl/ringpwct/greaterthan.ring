/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  greaterthan Component
**	Date : 2024.12.24
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class greaterthanComponentController from ComponentControllerParent 

	oView = new greaterthanComponentView

	func GenerateAction 

		cOperator = " > "
		
		NewStep(  StyleData(Variable(:value3)) + " = " + StyleData(Variable(:value)) + cOperator + StyleData(Variable(:value2)) )
				SetStepCode( Variable(:value3) + " = " + Variable(:value) + cOperator + Variable(:value2)  )

		return True 

class greaterthanComponentView from ComponentViewParent
	 
		Title( T_CT_GREATERTHAN_IP_TITLE )	
		TextBox( T_CT_GREATERTHAN_IP_VALUE , :value)
		TextBox( T_CT_GREATERTHAN_IP_VALUE2 , :value2)
		TextBox( T_CT_GREATERTHAN_IP_VALUE3 , :value3)
		PageButtons()