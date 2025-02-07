#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  sqlite_open Component
#**	Date : 2017.09.28
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class sqlite_openComponentController from ComponentControllerParent
	oView = new sqlite_openComponentView
	func GenerateAction  { 
		NewStep(T_CT_SQLITE_OPEN_ST_VALUE+StepData(:Value)+T_CT_SQLITE_OPEN_ST_VALUE2+StepData(:Value2))
		SetStepCode("sqlite_open("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class sqlite_openComponentView from ComponentViewParent
	Title(T_CT_SQLITE_OPEN_IP_TITLE)
	TextBox(T_CT_SQLITE_OPEN_IP_VALUE,:value)
	TextBox(T_CT_SQLITE_OPEN_IP_VALUE2,:value2)
	PageButtons()
private
