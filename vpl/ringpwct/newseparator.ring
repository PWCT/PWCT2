/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newseparator Component
**	Date : 2017.12.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newseparatorComponentController from ComponentControllerParent 

	oView = new newseparatorComponentView

	func GenerateAction 

		NewStep( T_CT_NEWSEPARATOR_ST_SEPARATOR  )
		SetStepCode( "addseparator()" )

		return True 

class newseparatorComponentView from ComponentViewParent
	 
		Title( T_CT_NEWSEPARATOR_IP_TITLE )	

		PageButtons()
