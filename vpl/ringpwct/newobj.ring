/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newobj Component
**	Date : 2017.10.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newobjComponentController from ComponentControllerParent 

	oView = new newobjComponentView

	func GenerateAction 

		if Variable(:value) = NULL {
		
			if Variable(:value3) = NULL {
				NewStep( T_CT_NEWOBJ_ST_NEWOBJ  + StepData(:value2) )
				SetStepCode(  "new " + Variable(:value2) )
			else
				NewStep( T_CT_NEWOBJ_ST_NEWOBJ  + StepData(:value2)  + "(" + StepData(:value3) + ")" )
				SetStepCode(  "new " + Variable(:value2) + "(" + Variable(:value3) + ")" )
			}
		
		else
		
			if Variable(:value3) = NULL {
				NewStep( StepData(:value) + " = " + T_CT_NEWOBJ_ST_NEWOBJ  + StepData(:value2) )
				SetStepCode(  variable(:value) + " = new " + Variable(:value2) )
			else
				NewStep( StepData(:value) + " = " + T_CT_NEWOBJ_ST_NEWOBJ  + StepData(:value2)  +
							 "(" + StepData(:value3) + ")" )
				SetStepCode(  variable(:value) + " = new " + Variable(:value2) + "(" + Variable(:value3) + ")" )
			}
		
		
		}

		return True 

class newobjComponentView from ComponentViewParent
	 
		Title( T_CT_NEWOBJ_IP_TITLE )	
		TextBox( T_CT_NEWOBJ_IP_VALUE , :value)
		TextBox( T_CT_NEWOBJ_IP_VALUE2 , :value2)
		TextBox( T_CT_NEWOBJ_IP_VALUE3 , :value3)
		PageButtons()
