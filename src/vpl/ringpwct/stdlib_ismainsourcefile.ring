/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_ismainsourcefile Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_ismainsourcefileComponentController from ComponentControllerParent 

	oView = new stdlib_ismainsourcefileComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_STDLIB_ISMAINSOURCEFILE_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "ismainsourcefile()" )

		return True 

class stdlib_ismainsourcefileComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_ISMAINSOURCEFILE_IP_TITLE )	
		TextBox( T_CT_STDLIB_ISMAINSOURCEFILE_IP_VALUE , :value)
		PageButtons()
