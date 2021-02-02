/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  getlistsize Component
**	Date : 2017.07.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class getlistsizeComponentController from ComponentControllerParent 

	oView = new getlistsizeComponentView

	func GenerateAction 

		NewStep( StepData(:value2) + " = " + T_CT_GETLISTSIZE_ST_LISTSIZE + StepData(:value) ) 
		SetStepCode( Variable(:value2) + " = len(" + Variable(:value) + ")" )

		return True 

class getlistsizeComponentView from ComponentViewParent
	 
		Title( T_CT_GETLISTSIZE_IP_TITLE )	
		TextBox( T_CT_GETLISTSIZE_IP_VALUE , :value)
		TextBox( T_CT_GETLISTSIZE_IP_VALUE2 , :value2)
		PageButtons()
