#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_epochtime Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_epochtimeComponentController from ComponentControllerParent
	oView = new stdlib_epochtimeComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value3)+" = "+T_CT_STDLIB_EPOCHTIME_ST_VALUE+StepData(:Value)+T_CT_STDLIB_EPOCHTIME_ST_VALUE2+StepData(:Value2))
		SetStepCode(Variable(:Value3)+" = epochtime("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class stdlib_epochtimeComponentView from ComponentViewParent
	Title(T_CT_STDLIB_EPOCHTIME_IP_TITLE)
	TextBox(T_CT_STDLIB_EPOCHTIME_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_EPOCHTIME_IP_VALUE2,:value2)
	TextBox(T_CT_STDLIB_EPOCHTIME_IP_VALUE3,:value3)
	PageButtons()
private
