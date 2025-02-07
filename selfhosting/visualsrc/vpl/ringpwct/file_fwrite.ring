#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_fwrite Component
#**	Date : 2017.07.31
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_fwriteComponentController from ComponentControllerParent
	oView = new file_fwriteComponentView
	func GenerateAction  { 
		NewStep(T_CT_FILE_FWRITE_ST_VALUE+StepData(:Value)+T_CT_FILE_FWRITE_ST_VALUE2+StepData(:Value2))
		SetStepCode("fwrite("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class file_fwriteComponentView from ComponentViewParent
	Title(T_CT_FILE_FWRITE_IP_TITLE)
	TextBox(T_CT_FILE_FWRITE_IP_VALUE,:value)
	TextBox(T_CT_FILE_FWRITE_IP_VALUE2,:value2)
	PageButtons()
private
