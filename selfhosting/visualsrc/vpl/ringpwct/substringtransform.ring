#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  substringtransform Component
#**	Date : 2017.07.25
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class substringtransformComponentController from ComponentControllerParent
	oView = new substringtransformComponentView
	func GenerateAction  { 
		if Variable(:value5) { 
			NewStep(StepData(:Value4)+" = "+T_CT_SUBSTRINGTRANSFORM_ST_VALUE+StepData(:Value)+T_CT_SUBSTRINGTRANSFORM_ST_VALUE2+StepData(:Value2)+T_CT_SUBSTRINGTRANSFORM_ST_VALUE3+StepData(:Value3)+T_CT_SUBSTRINGTRANSFORM_ST_VALUE5)
			SetStepCode(Variable(:Value4)+" = substr("+Variable(:Value)+","+Variable(:Value2)+","+Variable(:Value3)+")")
			else
				NewStep(StepData(:Value4)+" = "+T_CT_SUBSTRINGTRANSFORM_ST_VALUE+StepData(:Value)+T_CT_SUBSTRINGTRANSFORM_ST_VALUE2+StepData(:Value2)+T_CT_SUBSTRINGTRANSFORM_ST_VALUE3+StepData(:Value3))
				SetStepCode(Variable(:Value4)+" = substr("+Variable(:Value)+","+Variable(:Value2)+","+Variable(:Value3)+",1)")
		} 
		return True
	} 
private
class substringtransformComponentView from ComponentViewParent
	Title(T_CT_SUBSTRINGTRANSFORM_IP_TITLE)
	TextBox(T_CT_SUBSTRINGTRANSFORM_IP_VALUE,:value)
	TextBox(T_CT_SUBSTRINGTRANSFORM_IP_VALUE2,:value2)
	TextBox(T_CT_SUBSTRINGTRANSFORM_IP_VALUE3,:value3)
	TextBox(T_CT_SUBSTRINGTRANSFORM_IP_VALUE4,:value4)
	#Match Case
	CheckBox(T_CT_SUBSTRINGTRANSFORM_IP_VALUE5,:value5) {
		setcheckstate(2)
	}
	PageButtons()
private
