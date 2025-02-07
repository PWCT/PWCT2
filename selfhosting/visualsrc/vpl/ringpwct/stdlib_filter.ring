#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_filter Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_filterComponentController from ComponentControllerParent
	oView = new stdlib_filterComponentView
	func GenerateAction  { 
		NewParentStep(StepData(:value3)+" = "+T_CT_STDLIB_FILTER_ST_FILTER+" "+StepData(:value)+" "+T_CT_STDLIB_FILTER_ST_VARIABLE+" "+StepData(:value2))
		SetStepCode(Variable(:value3)+" = filter("+Variable(:value)+", func "+Variable(:value2)+" { ")
		AllowInteraction()
		NewStep(T_CT_STDLIB_FILTER_ST_STARTHERE)
		oStep = GetActiveStep()
		NewStep(T_CT_STDLIB_FILTER_ST_END)
		SetStepCode("} ) ")
		SetActiveStep(oStep)
		return True
	} 
private
class stdlib_filterComponentView from ComponentViewParent
	Title(T_CT_STDLIB_FILTER_IP_TITLE)
	TextBox(T_CT_STDLIB_FILTER_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_FILTER_IP_VALUE2,:value2)
	TextBox(T_CT_STDLIB_FILTER_IP_VALUE3,:value3)
	PageButtons()
private
