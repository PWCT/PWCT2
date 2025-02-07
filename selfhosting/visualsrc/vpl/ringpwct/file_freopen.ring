#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_freopen Component
#**	Date : 2017.07.31
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_freopenComponentController from ComponentControllerParent
	oView = new file_freopenComponentView
	func GenerateAction  { 
		if NoValueMsg(:value) OR NoValueMsg(:value3) { 
			return False
		} 
		switch Variable(:Value2) { 
			case 1
				cMode = "r"
			case 2
				cMode = "w"
			case 3
				cMode = "a"
			case 4
				cMode = "r+"
			case 5
				cMode = "w+"
			case 6
				cMode = "a+"
		} 
		NewStep(T_CT_FILE_FREOPEN_ST_VALUE+StepData(:Value)+T_CT_FILE_FREOPEN_ST_VALUE2+StyleData(T_CT_FILE_FREOPEN_IP_VALUE2LIST[Variable(:value2)])+T_CT_FILE_FREOPEN_ST_VALUE3+StepData(:Value3))
		SetStepCode("freopen("+Variable(:Value)+',"'+cMode+'",'+Variable(:Value3)+")")
		return True
	} 
private
class file_freopenComponentView from ComponentViewParent
	Title(T_CT_FILE_FREOPEN_IP_TITLE)
	TextBox(T_CT_FILE_FREOPEN_IP_VALUE,:value)
	ListBox(T_CT_FILE_FREOPEN_IP_VALUE2,:value2,T_CT_FILE_FREOPEN_IP_VALUE2LIST)
	TextBox(T_CT_FILE_FREOPEN_IP_VALUE3,:value3)
	PageButtons()
private
