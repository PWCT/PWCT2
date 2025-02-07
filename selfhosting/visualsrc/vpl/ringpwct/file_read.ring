#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_read Component
#**	Date : 2017.07.30
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_readComponentController from ComponentControllerParent
	oView = new file_readComponentView
	func GenerateAction  { 
		if NoValueMsg(:value) OR NoValueMsg(:value2) { 
			return False
		} 
		NewStep(StepData(:Value2)+" = "+T_CT_FILE_READ_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = read("+Variable(:Value)+")")
		return True
	} 
private
class file_readComponentView from ComponentViewParent
	Title(T_CT_FILE_READ_IP_TITLE)
	TextBox(T_CT_FILE_READ_IP_VALUE,:value)
	TextBox(T_CT_FILE_READ_IP_VALUE2,:value2)
	PageButtons()
private
