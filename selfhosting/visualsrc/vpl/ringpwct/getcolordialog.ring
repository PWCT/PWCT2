#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  getcolordialog Component
#**	Date : 2018.03.13
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class getcolordialogComponentController from ComponentControllerParent
	oView = new getcolordialogComponentView
	func GenerateAction  { 
		cIsResultValue = "exec()"
		if Variable(:value)! = NULL { 
			cIsResultValue = Variable(:Value)+" = exec()"+nl
		} 
		NewStep(StepData(:Value2)+" = "+T_CT_GETCOLORDIALOG_ST_VALUE)
		SetStepCode("new qcolordialog() {"+nl+cIsResultValue+Variable(:Value2)+" = CurrentColor()"+nl+"r = CurrentColor().red()"+nl+"g = CurrentColor().green()"+nl+"b = CurrentColor().blue()"+nl+"}")
		return True
	} 
private
class getcolordialogComponentView from ComponentViewParent
	Title(T_CT_GETCOLORDIALOG_IP_TITLE)
	TextBox(T_CT_GETCOLORDIALOG_IP_VALUE,:value)
	TextBox(T_CT_GETCOLORDIALOG_IP_VALUE2,:value2)
	PageButtons()
private
