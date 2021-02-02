/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_systemcmd Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_systemcmdComponentController from ComponentControllerParent 

	oView = new stdlib_systemcmdComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_SYSTEMCMD_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = systemcmd("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_systemcmdComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_SYSTEMCMD_IP_TITLE )	
		TextBox( T_CT_STDLIB_SYSTEMCMD_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_SYSTEMCMD_IP_VALUE2 , :value2)
		PageButtons()
