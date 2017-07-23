/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  getstringindex Component
**	Date : 2017.07.23
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class getstringindexComponentController from ComponentControllerParent 

	oView = new getstringindexComponentView

	func GenerateAction 
		if NoValueMsg(:value) or NoValueMsg(:value2) or NoValueMsg(:value3) { return False }
		NewStep( StepData(:value3) + " = " +  T_CT_GETSTRINGINDEX_ST_GETINDEX + StepData(:value2) +  T_CT_GETSTRINGINDEX_ST_FROMSTRING + StepData(:value)) 
		SetStepCode( Variable(:value3) + " = " + Variable(:value) + "[" + Variable(:value2) + "]" )

		return True 

class getstringindexComponentView from ComponentViewParent
	 
		Title( T_CT_GETSTRINGINDEX_IP_TITLE )	
		TextBox( T_CT_GETSTRINGINDEX_IP_VALUE , :value)
		TextBox( T_CT_GETSTRINGINDEX_IP_VALUE2 , :value2)
		TextBox( T_CT_GETSTRINGINDEX_IP_VALUE3 , :value3)
		PageButtons()
