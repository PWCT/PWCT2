#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  refmeta_attributes Component
#**	Date : 2017.10.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class refmeta_attributesComponentController from ComponentControllerParent
	oView = new refmeta_attributesComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_REFMETA_ATTRIBUTES_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = attributes("+Variable(:Value)+")")
		return True
	} 
private
class refmeta_attributesComponentView from ComponentViewParent
	Title(T_CT_REFMETA_ATTRIBUTES_IP_TITLE)
	TextBox(T_CT_REFMETA_ATTRIBUTES_IP_VALUE,:value)
	TextBox(T_CT_REFMETA_ATTRIBUTES_IP_VALUE2,:value2)
	PageButtons()
private
