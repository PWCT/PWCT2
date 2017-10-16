/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_changestring Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_changestringComponentController from ComponentControllerParent 

	oView = new stdlib_changestringComponentView

	func GenerateAction 

		NewStep( StepData(:Value5) + " = "  +  T_CT_STDLIB_CHANGESTRING_ST_VALUE  + StepData(:Value ) +  T_CT_STDLIB_CHANGESTRING_ST_VALUE2 + StepData(:Value2) +  T_CT_STDLIB_CHANGESTRING_ST_VALUE3 + StepData(:Value3) +  T_CT_STDLIB_CHANGESTRING_ST_VALUE4 + StepData(:Value4)  )
		SetStepCode( Variable(:Value5) + " = changestring("  + Variable(:Value ) + ","  + Variable(:Value2) + ","  + Variable(:Value3) + ","  + Variable(:Value4) + ")"  )

		return True 

class stdlib_changestringComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_CHANGESTRING_IP_TITLE )	
		TextBox( T_CT_STDLIB_CHANGESTRING_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_CHANGESTRING_IP_VALUE2 , :value2)
		TextBox( T_CT_STDLIB_CHANGESTRING_IP_VALUE3 , :value3)
		TextBox( T_CT_STDLIB_CHANGESTRING_IP_VALUE4 , :value4)
		TextBox( T_CT_STDLIB_CHANGESTRING_IP_VALUE5 , :value5)
		PageButtons()
