#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  binarysearch Component
#**	Date : 2017.07.22
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class binarysearchComponentController from ComponentControllerParent
	oView = new binarysearchComponentView
	aAllowEmptyValue = [:value3]
	func GenerateAction  { 
		if Variable(:value3) = NULL { 
			NewStep(StepData(:value4)+" = "+T_CT_FINDITEM_ST_FIND+StepData(:value2)+T_CT_FINDITEM_ST_INLIST+StepData(:value))
			SetStepCode(Variable(:value4)+" = binarysearch("+Variable(:value)+","+Variable(:value2)+")")
			else
				NewStep(StepData(:value4)+" = "+T_CT_FINDITEM_ST_FIND+StepData(:value2)+T_CT_FINDITEM_ST_INLIST+StepData(:value)+T_CT_FINDITEM_ST_COLUMN+StepData(:value3))
				SetStepCode(Variable(:value4)+" = binarysearch("+Variable(:value)+","+Variable(:value2)+","+Variable(:value3)+")")
		} 
		return True
	} 
private
class binarysearchComponentView from ComponentViewParent
	Title(T_CT_BINARYSEARCH_IP_TITLE)
	TextBox(T_CT_BINARYSEARCH_IP_VALUE,:value)
	TextBox(T_CT_BINARYSEARCH_IP_VALUE2,:value2)
	TextBox(T_CT_BINARYSEARCH_IP_VALUE3,:value3)
	TextBox(T_CT_BINARYSEARCH_IP_VALUE4,:value4)
	PageButtons()
private
