/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  additem Component
**	Date : 2017.07.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class additemComponentController from ComponentControllerParent 

	oView = new additemComponentView

	func GenerateAction 

		NewStep(  T_CT_ADDITEM_ST_ADDITEM + StepData(:value2) +  T_CT_ADDITEM_ST_TOLIST + StepData(:value)  ) 
		SetStepCode( "Add(" + Variable(:value) + "," + Variable(:value2) + ")")

		return True 

class additemComponentView from ComponentViewParent
	 
		Title( T_CT_ADDITEM_IP_TITLE )	
		TextBox( T_CT_ADDITEM_IP_VALUE , :value)
		TextBox( T_CT_ADDITEM_IP_VALUE2 , :value2)
		PageButtons()
