#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  mysql_connect Component
#**	Date : 2017.09.28
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class mysql_connectComponentController from ComponentControllerParent
	oView = new mysql_connectComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value5)+" = "+T_CT_MYSQL_CONNECT_ST_VALUE+StepData(:Value)+T_CT_MYSQL_CONNECT_ST_VALUE2+StepData(:Value2)+T_CT_MYSQL_CONNECT_ST_VALUE3+StepData(:Value3)+T_CT_MYSQL_CONNECT_ST_VALUE4+StepData(:Value4))
		SetStepCode(Variable(:Value5)+" = mysql_connect("+Variable(:Value)+","+Variable(:Value2)+","+Variable(:Value3)+","+Variable(:Value4)+")")
		return True
	} 
private
class mysql_connectComponentView from ComponentViewParent
	Title(T_CT_MYSQL_CONNECT_IP_TITLE)
	TextBox(T_CT_MYSQL_CONNECT_IP_VALUE,:value)
	TextBox(T_CT_MYSQL_CONNECT_IP_VALUE2,:value2)
	TextBox(T_CT_MYSQL_CONNECT_IP_VALUE3,:value3)
	TextBox(T_CT_MYSQL_CONNECT_IP_VALUE4,:value4)
	TextBox(T_CT_MYSQL_CONNECT_IP_VALUE5,:value5)
	PageButtons()
private
