#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_rewind Component
#**	Date : 2017.07.31
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_rewindComponentController from ComponentControllerParent
	oView = new file_rewindComponentView
	func GenerateAction  { 
		NewStep(T_CT_FILE_REWIND_ST_VALUE+StepData(:Value))
		SetStepCode("rewind("+Variable(:Value)+")")
		return True
	} 
private
class file_rewindComponentView from ComponentViewParent
	Title(T_CT_FILE_REWIND_IP_TITLE)
	TextBox(T_CT_FILE_REWIND_IP_VALUE,:value)
	PageButtons()
private
