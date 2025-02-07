#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_matrixmulti Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_matrixmultiComponentController from ComponentControllerParent
	oView = new stdlib_matrixmultiComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value3)+" = "+T_CT_STDLIB_MATRIXMULTI_ST_VALUE+StepData(:Value)+T_CT_STDLIB_MATRIXMULTI_ST_VALUE2+StepData(:Value2))
		SetStepCode(Variable(:Value3)+" = matrixmulti("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class stdlib_matrixmultiComponentView from ComponentViewParent
	Title(T_CT_STDLIB_MATRIXMULTI_IP_TITLE)
	TextBox(T_CT_STDLIB_MATRIXMULTI_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_MATRIXMULTI_IP_VALUE2,:value2)
	TextBox(T_CT_STDLIB_MATRIXMULTI_IP_VALUE3,:value3)
	PageButtons()
private
