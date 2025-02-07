#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_remove Component
#**	Date : 2017.07.30
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_removeComponentController from ComponentControllerParent
	oView = new file_removeComponentView
	func GenerateAction  { 
		if NoValueMsg(:value) { 
			return False
		} 
		NewStep(T_CT_FILE_REMOVE_ST_VALUE+StepData(:Value))
		SetStepCode("remove("+Variable(:Value)+")")
		return True
	} 
private
class file_removeComponentView from ComponentViewParent
	Title(T_CT_FILE_REMOVE_IP_TITLE)
	TextBox(T_CT_FILE_REMOVE_IP_VALUE,:value)
	PageButtons()
private
