/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_justfilepath Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_justfilepathComponentController from ComponentControllerParent 

	oView = new stdlib_justfilepathComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_JUSTFILEPATH_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = justfilepath("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_justfilepathComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_JUSTFILEPATH_IP_TITLE )	
		TextBox( T_CT_STDLIB_JUSTFILEPATH_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_JUSTFILEPATH_IP_VALUE2 , :value2)
		PageButtons()
