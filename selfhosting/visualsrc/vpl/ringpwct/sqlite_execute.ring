#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  sqlite_execute Component
#**	Date : 2017.09.28
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class sqlite_executeComponentController from ComponentControllerParent
	oView = new sqlite_executeComponentView
	func GenerateAction  { 
		NewStep(T_CT_SQLITE_EXECUTE_ST_VALUE+StepData(:Value)+T_CT_SQLITE_EXECUTE_ST_VALUE2+StepData(:Value2))
		SetStepCode("sqlite_execute("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class sqlite_executeComponentView from ComponentViewParent
	Title(T_CT_SQLITE_EXECUTE_IP_TITLE)
	TextBox(T_CT_SQLITE_EXECUTE_IP_VALUE,:value)
	TextBox(T_CT_SQLITE_EXECUTE_IP_VALUE2,:value2)
	PageButtons()
private
