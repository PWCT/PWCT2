/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  insertitem Component
**	Date : 2017.07.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class insertitemComponentController from ComponentControllerParent 

	oView = new insertitemComponentView

	func GenerateAction 

		NewStep(  T_CT_INSERTITEM_ST_INSERTITEM + StepData(:value3) +  T_CT_INSERTITEM_ST_TOLIST + StepData(:value) +  T_CT_INSERTITEM_ST_AFTERINDEX  + StepData(:value2)) 
		SetStepCode( "insert("+Variable(:value)+","+Variable(:value2)+","+Variable(:value3) + ")" )

		return True 

class insertitemComponentView from ComponentViewParent
	 
		Title( T_CT_INSERTITEM_IP_TITLE )	
		TextBox( T_CT_INSERTITEM_IP_VALUE , :value)
		TextBox( T_CT_INSERTITEM_IP_VALUE2 , :value2)
		TextBox( T_CT_INSERTITEM_IP_VALUE3 , :value3)
		PageButtons()
