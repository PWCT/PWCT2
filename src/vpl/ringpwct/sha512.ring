/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  sha512 Component
**	Date : 2017.09.30
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class sha512ComponentController from ComponentControllerParent 

	oView = new sha512ComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_SHA512_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = sha512("  + Variable(:Value ) + ")"  )
		

		return True 

class sha512ComponentView from ComponentViewParent
	 
		Title( T_CT_SHA512_IP_TITLE )	
		TextBox( T_CT_SHA512_IP_VALUE , :value)
		TextBox( T_CT_SHA512_IP_VALUE2 , :value2)
		PageButtons()
