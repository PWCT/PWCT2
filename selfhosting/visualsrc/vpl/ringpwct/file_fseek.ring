#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_fseek Component
#**	Date : 2017.07.31
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_fseekComponentController from ComponentControllerParent
	oView = new file_fseekComponentView
	func GenerateAction  { 
		switch Variable(:Value2) { 
			case 1
				cMode = "0"
			case 2
				cMode = "1"
			case 3
				cMode = "2"
		} 
		NewStep(StepData(:Value4)+" = "+T_CT_FILE_FSEEK_ST_VALUE+StepData(:Value)+T_CT_FILE_FSEEK_ST_VALUE2+StyleData(T_CT_FILE_FSEEK_IP_VALUE2LIST[Variable(:Value2)])+T_CT_FILE_FSEEK_ST_VALUE3+StepData(:Value3))
		SetStepCode(Variable(:Value4)+" = fseek("+Variable(:Value)+","+Variable(:Value3)+","+cMode+")")
		return True
	} 
private
class file_fseekComponentView from ComponentViewParent
	Title(T_CT_FILE_FSEEK_IP_TITLE)
	TextBox(T_CT_FILE_FSEEK_IP_VALUE,:value)
	ListBox(T_CT_FILE_FSEEK_IP_VALUE2,:value2,T_CT_FILE_FSEEK_IP_VALUE2LIST)
	TextBox(T_CT_FILE_FSEEK_IP_VALUE3,:value3)
	TextBox(T_CT_FILE_FSEEK_IP_VALUE4,:value4)
	PageButtons()
private
