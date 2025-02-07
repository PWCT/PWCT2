#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_splitmany Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_splitmanyComponentController from ComponentControllerParent
	oView = new stdlib_splitmanyComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value3)+" = "+T_CT_STDLIB_SPLITMANY_ST_VALUE+StepData(:Value)+T_CT_STDLIB_SPLITMANY_ST_VALUE2+StepData(:Value2))
		SetStepCode(Variable(:Value3)+" = splitmany("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class stdlib_splitmanyComponentView from ComponentViewParent
	Title(T_CT_STDLIB_SPLITMANY_IP_TITLE)
	TextBox(T_CT_STDLIB_SPLITMANY_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_SPLITMANY_IP_VALUE2,:value2)
	TextBox(T_CT_STDLIB_SPLITMANY_IP_VALUE3,:value3)
	PageButtons()
private
