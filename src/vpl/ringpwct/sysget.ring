/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  sysget Component
**	Date : 2017.09.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class sysgetComponentController from ComponentControllerParent 

	oView = new sysgetComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_SYSGET_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = sysget("  + Variable(:Value ) + ")"  )

		return True 

class sysgetComponentView from ComponentViewParent
	 
		Title( T_CT_SYSGET_IP_TITLE )	
		TextBox( T_CT_SYSGET_IP_VALUE , :value)
		TextBox( T_CT_SYSGET_IP_VALUE2 , :value2)
		PageButtons()
