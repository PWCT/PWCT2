/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stringcopy Component
**	Date : 2017.07.24
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stringcopyComponentController from ComponentControllerParent 

	oView = new stringcopyComponentView

	func GenerateAction 

		NewStep( StepData(:value3) + " = " +  T_CT_STRINGCOPY_ST_COPYSTRING + StepData(:value) +  T_CT_STRINGCOPY_ST_COUNT + StepData(:value2)) 
		SetStepCode( Variable(:value3) + " = copy(" + Variable(:value) + "," + Variable(:value2) + ")" )

		return True 

class stringcopyComponentView from ComponentViewParent
	 
		Title( T_CT_STRINGCOPY_IP_TITLE )	
		TextBox( T_CT_STRINGCOPY_IP_VALUE , :value)
		TextBox( T_CT_STRINGCOPY_IP_VALUE2 , :value2)
		TextBox( T_CT_STRINGCOPY_IP_VALUE3 , :value3)
		PageButtons()
