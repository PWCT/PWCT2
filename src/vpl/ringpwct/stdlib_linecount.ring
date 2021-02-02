/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_linecount Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_linecountComponentController from ComponentControllerParent 

	oView = new stdlib_linecountComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_LINECOUNT_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = linecount("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_linecountComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_LINECOUNT_IP_TITLE )	
		TextBox( T_CT_STDLIB_LINECOUNT_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_LINECOUNT_IP_VALUE2 , :value2)
		PageButtons()
