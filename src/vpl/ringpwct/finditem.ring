/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  finditem Component
**	Date : 2017.07.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class finditemComponentController from ComponentControllerParent 

	oView = new finditemComponentView

	aAllowEmptyValue = [:value3, :value4]

	func GenerateAction 

		if Variable(:value3) = NULL {
			NewStep( StepData(:value5) + " = " +  T_CT_FINDITEM_ST_FIND  + StepData(:value2) +  T_CT_FINDITEM_ST_INLIST + StepData(:value) ) 
			SetStepCode( Variable(:value5) + " = find(" + Variable(:value) + "," + Variable(:value2) + ")" )
		elseif Variable(:value3) != NULL and Variable(:value4) = NULL
			NewStep( StepData(:value5) + " = " +  T_CT_FINDITEM_ST_FIND  + StepData(:value2) +  T_CT_FINDITEM_ST_INLIST + StepData(:value) +  T_CT_FINDITEM_ST_COLUMN + StepData(:value3) ) 
			SetStepCode( Variable(:value5) + " = find(" + Variable(:value) + "," + Variable(:value2) + "," + Variable(:value3) + ")" )
		else
			NewStep( StepData(:value5) + " = " +  T_CT_FINDITEM_ST_FIND  + StepData(:value2) +  T_CT_FINDITEM_ST_INLIST + StepData(:value) +  T_CT_FINDITEM_ST_COLUMN + StepData(:value3) +  T_CT_FINDITEM_ST_ATTRIBUTE + StepData(:value4)  ) 
			SetStepCode( Variable(:value5) + " = find(" + Variable(:value) + "," + Variable(:value2) + "," + Variable(:value3) + "," + Variable(:value4)+ ")" )
		}

		return True 

class finditemComponentView from ComponentViewParent
	 
		Title( T_CT_FINDITEM_IP_TITLE )	
		TextBox( T_CT_FINDITEM_IP_VALUE , :value)
		TextBox( T_CT_FINDITEM_IP_VALUE2 , :value2)
		TextBox( T_CT_FINDITEM_IP_VALUE3 , :value3)
		TextBox( T_CT_FINDITEM_IP_VALUE4 , :value4)
		TextBox( T_CT_FINDITEM_IP_VALUE5 , :value5)
		PageButtons()
