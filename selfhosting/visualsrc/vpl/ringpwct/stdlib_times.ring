#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_times Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_timesComponentController from ComponentControllerParent
	oView = new stdlib_timesComponentView
	func GenerateAction  { 
		NewParentStep(T_CT_STDLIB_TIMES_ST_TIMES+" "+StepData(:value))
		SetStepCode("times("+Variable(:value)+", func { ")
		AllowInteraction()
		NewStep(T_CT_STDLIB_TIMES_ST_STARTHERE)
		oStep = GetActiveStep()
		NewStep(T_CT_STDLIB_TIMES_ST_END)
		SetStepCode("} ) ")
		SetActiveStep(oStep)
		return True
	} 
private
class stdlib_timesComponentView from ComponentViewParent
	Title(T_CT_STDLIB_TIMES_IP_TITLE)
	TextBox(T_CT_STDLIB_TIMES_IP_VALUE,:value)
	PageButtons()
private
