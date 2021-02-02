/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  deleteitem Component
**	Date : 2017.07.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class deleteitemComponentController from ComponentControllerParent 

	oView = new deleteitemComponentView

	func GenerateAction 

		NewStep(  T_CT_DELETEITEM_ST_DELETEITEM + StepData(:value2) +  T_CT_DELETEITEM_ST_FROMLIST + StepData(:value)  ) 
		SetStepCode( "del(" + Variable(:value) + "," + Variable(:value2) + ")")

		return True 

class deleteitemComponentView from ComponentViewParent
	 
		Title( T_CT_DELETEITEM_IP_TITLE )	
		TextBox( T_CT_DELETEITEM_IP_VALUE , :value)
		TextBox( T_CT_DELETEITEM_IP_VALUE2 , :value2)
		PageButtons()
