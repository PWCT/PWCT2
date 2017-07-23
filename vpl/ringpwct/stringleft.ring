/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stringleft Component
**	Date : 2017.07.23
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stringleftComponentController from ComponentControllerParent 

	oView = new stringleftComponentView

	func GenerateAction 
		if NoValueMsg(:value) or NoValueMsg(:value2) or NoValueMsg(:value3) { return False }
		NewStep( StepData(:value3) + " = " +  T_CT_STRINGLEFT_ST_LEFT + StepData(:value) +  T_CT_STRINGLEFT_ST_COUNT + StepData(:value2)  ) 
		SetStepCode( Variable(:value3) + " = left(" + Variable(:value) + "," + Variable(:value2)+ ")" )

		return True 

class stringleftComponentView from ComponentViewParent
	 
		Title( T_CT_STRINGLEFT_IP_TITLE )	
		TextBox( T_CT_STRINGLEFT_IP_VALUE , :value)
		TextBox( T_CT_STRINGLEFT_IP_VALUE2 , :value2)
		TextBox( T_CT_STRINGLEFT_IP_VALUE3 , :value3)
		PageButtons()
