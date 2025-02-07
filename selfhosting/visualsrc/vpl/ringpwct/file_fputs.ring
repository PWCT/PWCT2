#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_fputs Component
#**	Date : 2017.07.31
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_fputsComponentController from ComponentControllerParent
	oView = new file_fputsComponentView
	func GenerateAction  { 
		NewStep(T_CT_FILE_FPUTS_ST_VALUE+StepData(:Value)+T_CT_FILE_FPUTS_ST_VALUE2+StepData(:Value2))
		SetStepCode("fputs("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class file_fputsComponentView from ComponentViewParent
	Title(T_CT_FILE_FPUTS_IP_TITLE)
	TextBox(T_CT_FILE_FPUTS_IP_VALUE,:value)
	TextBox(T_CT_FILE_FPUTS_IP_VALUE2,:value2)
	PageButtons()
private
