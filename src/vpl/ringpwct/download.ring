/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  download Component
**	Date : 2017.09.30
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class downloadComponentController from ComponentControllerParent 

	oView = new downloadComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_DOWNLOAD_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = download("  + Variable(:Value ) + ")"  )

		return True 

class downloadComponentView from ComponentViewParent
	 
		Title( T_CT_DOWNLOAD_IP_TITLE )	
		TextBox( T_CT_DOWNLOAD_IP_VALUE , :value)
		TextBox( T_CT_DOWNLOAD_IP_VALUE2 , :value2)
		PageButtons()
