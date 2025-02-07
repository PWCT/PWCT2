#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_list2file Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_list2fileComponentController from ComponentControllerParent
	oView = new stdlib_list2fileComponentView
	func GenerateAction  { 
		NewStep(T_CT_STDLIB_LIST2FILE_ST_VALUE+StepData(:Value)+T_CT_STDLIB_LIST2FILE_ST_VALUE2+StepData(:Value2))
		SetStepCode("list2file("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class stdlib_list2fileComponentView from ComponentViewParent
	Title(T_CT_STDLIB_LIST2FILE_IP_TITLE)
	TextBox(T_CT_STDLIB_LIST2FILE_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_LIST2FILE_IP_VALUE2,:value2)
	PageButtons()
private
