/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  not Component
**	Date : 2024.12.24
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class notComponentController from ComponentControllerParent 

	oView = new notComponentView

	func GenerateAction 

		cOperator = " Not "
		
		NewStep(  StyleData(Variable(:value2)) + " = "  + cOperator + StyleData(Variable(:value)) )
				SetStepCode( Variable(:value2) + " = " + cOperator + Variable(:value)  )
		

		return True 

class notComponentView from ComponentViewParent
	 
		Title( T_CT_NOT_IP_TITLE )	
		TextBox( T_CT_NOT_IP_VALUE , :value)
		TextBox( T_CT_NOT_IP_VALUE2 , :value2)
		PageButtons()
