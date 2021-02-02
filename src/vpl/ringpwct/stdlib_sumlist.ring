/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_sumlist Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_sumlistComponentController from ComponentControllerParent 

	oView = new stdlib_sumlistComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_SUMLIST_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = sumlist("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_sumlistComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_SUMLIST_IP_TITLE )	
		TextBox( T_CT_STDLIB_SUMLIST_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_SUMLIST_IP_VALUE2 , :value2)
		PageButtons()
