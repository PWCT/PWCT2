#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_write Component
#**	Date : 2017.07.30
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_writeComponentController from ComponentControllerParent
	oView = new file_writeComponentView
	func GenerateAction  { 
		if NoValueMsg(:value) OR NoValueMsg(:value2) { 
			return False
		} 
		NewStep(T_CT_FILE_WRITE_ST_VALUE+StepData(:Value)+T_CT_FILE_WRITE_ST_VALUE2+StepData(:Value2))
		SetStepCode("write("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class file_writeComponentView from ComponentViewParent
	Title(T_CT_FILE_WRITE_IP_TITLE)
	TextBox(T_CT_FILE_WRITE_IP_VALUE,:value)
	TextBox(T_CT_FILE_WRITE_IP_VALUE2,:value2)
	PageButtons()
private
