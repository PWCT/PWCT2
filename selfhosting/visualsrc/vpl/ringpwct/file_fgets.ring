#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_fgets Component
#**	Date : 2017.07.31
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_fgetsComponentController from ComponentControllerParent
	oView = new file_fgetsComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value3)+" = "+T_CT_FILE_FGETS_ST_VALUE+StepData(:Value)+T_CT_FILE_FGETS_ST_VALUE2+StepData(:Value2))
		SetStepCode(Variable(:Value3)+" = fgets("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class file_fgetsComponentView from ComponentViewParent
	Title(T_CT_FILE_FGETS_IP_TITLE)
	TextBox(T_CT_FILE_FGETS_IP_VALUE,:value)
	TextBox(T_CT_FILE_FGETS_IP_VALUE2,:value2)
	TextBox(T_CT_FILE_FGETS_IP_VALUE3,:value3)
	PageButtons()
private
