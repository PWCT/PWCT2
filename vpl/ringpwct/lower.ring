/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  lower Component
**	Date : 2017.07.23
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class lowerComponentController from ComponentControllerParent 

	oView = new lowerComponentView

	func GenerateAction 

		NewStep( StepData(:value2) + " = " +  T_CT_LOWER_ST_LOWER + StepData(:value)  ) 
		SetStepCode( Variable(:value2) + " = lower(" + Variable(:value) + ")")

		return True 

class lowerComponentView from ComponentViewParent
	 
		Title( T_CT_LOWER_IP_TITLE )	
		TextBox( T_CT_LOWER_IP_VALUE , :value)
		TextBox( T_CT_LOWER_IP_VALUE2 , :value2)
		PageButtons()
