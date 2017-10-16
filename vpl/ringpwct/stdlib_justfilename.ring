/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_justfilename Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_justfilenameComponentController from ComponentControllerParent 

	oView = new stdlib_justfilenameComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_JUSTFILENAME_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = justfilename("  + Variable(:Value ) + ")"  )
		

		return True 

class stdlib_justfilenameComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_JUSTFILENAME_IP_TITLE )	
		TextBox( T_CT_STDLIB_JUSTFILENAME_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_JUSTFILENAME_IP_VALUE2 , :value2)
		PageButtons()
