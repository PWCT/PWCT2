/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  swapitems Component
**	Date : 2017.07.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class swapitemsComponentController from ComponentControllerParent 

	oView = new swapitemsComponentView

	func GenerateAction 

		NewStep(  T_CT_SWAPITEMS_ST_SWAPITEMS  + StepData(:value2) + "," + StepData(:value3) +  T_CT_SWAPITEMS_ST_INLIST + StepData(:value) ) 
		SetStepCode( "swap(" + Variable(:value) + "," + Variable(:value2) + "," + Variable(:value3) + ")" )

		return True 

class swapitemsComponentView from ComponentViewParent
	 
		Title( T_CT_SWAPITEMS_IP_TITLE )	
		TextBox( T_CT_SWAPITEMS_IP_VALUE , :value)
		TextBox( T_CT_SWAPITEMS_IP_VALUE2 , :value2)
		TextBox( T_CT_SWAPITEMS_IP_VALUE3 , :value3)
		PageButtons()
