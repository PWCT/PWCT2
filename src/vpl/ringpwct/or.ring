/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  or Component
**	Date : 2024.12.24
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class orComponentController from ComponentControllerParent 

	oView = new orComponentView

	func GenerateAction 

		cOperator = " or "
		
		NewStep(  StyleData(Variable(:value3)) + " = " + StyleData(Variable(:value)) + cOperator + StyleData(Variable(:value2)) )
				SetStepCode( Variable(:value3) + " = " + Variable(:value) + cOperator + Variable(:value2)  )
		

		return True 

class orComponentView from ComponentViewParent
	 
		Title( T_CT_OR_IP_TITLE )	
		TextBox( T_CT_OR_IP_VALUE , :value)
		TextBox( T_CT_OR_IP_VALUE2 , :value2)
		TextBox( T_CT_OR_IP_VALUE3 , :value3)
		PageButtons()
