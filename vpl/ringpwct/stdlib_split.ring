/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_split Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_splitComponentController from ComponentControllerParent 

	oView = new stdlib_splitComponentView

	func GenerateAction 

		NewStep( StepData(:Value3) + " = "  +  T_CT_STDLIB_SPLIT_ST_VALUE  + StepData(:Value ) +  T_CT_STDLIB_SPLIT_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode( Variable(:Value3) + " = split("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class stdlib_splitComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_SPLIT_IP_TITLE )	
		TextBox( T_CT_STDLIB_SPLIT_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_SPLIT_IP_VALUE2 , :value2)
		TextBox( T_CT_STDLIB_SPLIT_IP_VALUE3 , :value3)
		PageButtons()
