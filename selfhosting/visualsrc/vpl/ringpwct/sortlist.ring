#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  sortlist Component
#**	Date : 2017.07.22
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class sortlistComponentController from ComponentControllerParent
	oView = new sortlistComponentView
	aAllowEmptyValue = [:value2,:value3]
	func GenerateAction  { 
		if Variable(:value2) = NULL { 
			NewStep(StepData(:value4)+" = "+T_CT_SORT_ST_SORT+StepData(:value))
			SetStepCode(Variable(:value4)+" = sort("+Variable(:value)+")")
			elseif Variable(:value2)! = NULL AND Variable(:value3) = NULL
				NewStep(StepData(:value4)+" = "+T_CT_SORT_ST_SORT+StepData(:value)+T_CT_SORT_ST_COLUMN+StepData(:value2))
				SetStepCode(Variable(:value4)+" = sort("+Variable(:value)+","+Variable(:value2)+")")
			else
				NewStep(StepData(:value4)+" = "+T_CT_SORT_ST_SORT+StepData(:value)+T_CT_SORT_ST_COLUMN+StepData(:value2)+T_CT_SORT_ST_ATTRIBUTE+StepData(:value3))
				SetStepCode(Variable(:value4)+" = sort("+Variable(:value)+","+Variable(:value2)+","+Variable(:value3)+")")
		} 
		return True
	} 
private
class sortlistComponentView from ComponentViewParent
	Title(T_CT_SORTLIST_IP_TITLE)
	TextBox(T_CT_SORTLIST_IP_VALUE,:value)
	TextBox(T_CT_SORTLIST_IP_VALUE2,:value2)
	TextBox(T_CT_SORTLIST_IP_VALUE3,:value3)
	TextBox(T_CT_SORTLIST_IP_VALUE4,:value4)
	PageButtons()
private
