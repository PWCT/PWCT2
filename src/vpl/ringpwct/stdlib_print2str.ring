/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_print2str Component
**	Date : 2017.10.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_print2strComponentController from ComponentControllerParent 

	oView = new stdlib_print2strComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_PRINT2STR_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = print2str("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_print2strComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_PRINT2STR_IP_TITLE )	
		TextBoxValue( T_CT_STDLIB_PRINT2STR_IP_VALUE , :value, C_INTERACTIONPAGE_EXPCONTAINSLITERAL)
		TextBox( T_CT_STDLIB_PRINT2STR_IP_VALUE2 , :value2)
		PageButtons()
