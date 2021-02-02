/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  getsubstring Component
**	Date : 2017.07.24
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class getsubstringComponentController from ComponentControllerParent 

	oView = new getsubstringComponentView

	func GenerateAction 

		NewStep( StepData(:Value3) + " = "  +  T_CT_GETSUBSTRING_ST_VALUE  + StepData(:Value2) +  T_CT_GETSUBSTRING_ST_VALUE2 + StepData(:Value)  )
		SetStepCode( Variable(:Value3) + " = SubStr("  + Variable(:Value) +  "," + Variable(:Value2) + ")")

		return True 

class getsubstringComponentView from ComponentViewParent
	 
		Title( T_CT_GETSUBSTRING_IP_TITLE )	
		TextBox( T_CT_GETSUBSTRING_IP_VALUE , :value)
		TextBox( T_CT_GETSUBSTRING_IP_VALUE2 , :value2)
		TextBox( T_CT_GETSUBSTRING_IP_VALUE3 , :value3)
		PageButtons()
