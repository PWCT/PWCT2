/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  setstringindex Component
**	Date : 2017.07.23
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class setstringindexComponentController from ComponentControllerParent 

	oView = new setstringindexComponentView

	func GenerateAction 

		if NoValueMsg(:value) or NoValueMsg(:value2) or NoValueMsg(:value3) { return False }
		NewStep( T_CT_SETSTRINGINDEX_ST_SETINDEX + StepData(:value2) +  T_CT_SETSTRINGINDEX_ST_FROMSTRING + StepData(:value) + " = " + StepData(:value3)) 
		SetStepCode( Variable(:value) + "[" + Variable(:value2) + "] = " + Variable(:value3) )

		return True 

class setstringindexComponentView from ComponentViewParent
	 
		Title( T_CT_SETSTRINGINDEX_IP_TITLE )	
		TextBox( T_CT_SETSTRINGINDEX_IP_VALUE , :value)
		TextBox( T_CT_SETSTRINGINDEX_IP_VALUE2 , :value2)
		TextBox( T_CT_SETSTRINGINDEX_IP_VALUE3 , :value3)
		PageButtons()
