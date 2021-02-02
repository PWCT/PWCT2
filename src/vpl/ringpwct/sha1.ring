/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  sha1 Component
**	Date : 2017.09.30
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class sha1ComponentController from ComponentControllerParent 

	oView = new sha1ComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_SHA1_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = sha1("  + Variable(:Value ) + ")"  )

		return True 

class sha1ComponentView from ComponentViewParent
	 
		Title( T_CT_SHA1_IP_TITLE )	
		TextBox( T_CT_SHA1_IP_VALUE , :value)
		TextBox( T_CT_SHA1_IP_VALUE2 , :value2)
		PageButtons()
