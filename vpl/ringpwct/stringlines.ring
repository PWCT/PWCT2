/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stringlines Component
**	Date : 2017.07.24
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stringlinesComponentController from ComponentControllerParent 

	oView = new stringlinesComponentView

	func GenerateAction 

		NewStep( StepData(:value2) + " = " +  T_CT_STRINGLINES_ST_STRINGLINES + StepData(:value) ) 
		SetStepCode( Variable(:value2) + " = lines(" + Variable(:value) + ")" )

		return True 

class stringlinesComponentView from ComponentViewParent
	 
		Title( T_CT_STRINGLINES_IP_TITLE )	
		TextBox( T_CT_STRINGLINES_IP_VALUE , :value)
		TextBox( T_CT_STRINGLINES_IP_VALUE2 , :value2)
		PageButtons()
