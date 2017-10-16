/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_prodlist Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_prodlistComponentController from ComponentControllerParent 

	oView = new stdlib_prodlistComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_PRODLIST_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = prodlist("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_prodlistComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_PRODLIST_IP_TITLE )	
		TextBox( T_CT_STDLIB_PRODLIST_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_PRODLIST_IP_VALUE2 , :value2)
		PageButtons()
