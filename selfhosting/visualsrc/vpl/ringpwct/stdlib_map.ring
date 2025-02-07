#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_map Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_mapComponentController from ComponentControllerParent
	oView = new stdlib_mapComponentView
	func GenerateAction  { 
		NewParentStep(StepData(:value3)+" = "+T_CT_STDLIB_MAP_ST_MAP+" "+StepData(:value)+" "+T_CT_STDLIB_MAP_ST_VARIABLE+" "+StepData(:value2))
		SetStepCode(Variable(:value3)+" = map("+Variable(:value)+", func "+Variable(:value2)+" { ")
		AllowInteraction()
		NewStep(T_CT_STDLIB_MAP_ST_STARTHERE)
		oStep = GetActiveStep()
		NewStep(T_CT_STDLIB_MAP_ST_END)
		SetStepCode("} ) ")
		SetActiveStep(oStep)
		return True
	} 
private
class stdlib_mapComponentView from ComponentViewParent
	Title(T_CT_STDLIB_MAP_IP_TITLE)
	TextBox(T_CT_STDLIB_MAP_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_MAP_IP_VALUE2,:value2)
	TextBox(T_CT_STDLIB_MAP_IP_VALUE3,:value3)
	PageButtons()
private
