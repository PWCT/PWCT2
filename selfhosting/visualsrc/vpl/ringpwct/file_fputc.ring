#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_fputc Component
#**	Date : 2017.07.31
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_fputcComponentController from ComponentControllerParent
	oView = new file_fputcComponentView
	func GenerateAction  { 
		NewStep(T_CT_FILE_FPUTC_ST_VALUE+StepData(:Value)+T_CT_FILE_FPUTC_ST_VALUE2+StepData(:Value2))
		SetStepCode("fputc("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class file_fputcComponentView from ComponentViewParent
	Title(T_CT_FILE_FPUTC_IP_TITLE)
	TextBox(T_CT_FILE_FPUTC_IP_VALUE,:value)
	TextBox(T_CT_FILE_FPUTC_IP_VALUE2,:value2)
	PageButtons()
private
