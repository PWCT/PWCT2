/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Call Method Component
**	Date : 2017.10.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class CallMethodComponentController from ComponentControllerParent 

	oView = new CallMethodComponentView

	aAllowEmptyValue = [:parameters,:output]

	func GenerateAction 

		cObject = ""
		if variable(:object) != NULL {
			cObject = variable(:object) + "."
		}
								
		if Variable(:lParameters) {
			cParameters = Variable(:Parameters)
			cParametersData = StepData(:Parameters)
		else 
			cParameters = ""
			cParametersData = ""
		}

		if Variable(:lOutput) {
			cOutput = Variable(:Output)
		else 
			cOutput = ""
		}

		if cOutput != NULL {
			cOutputEqual = cOutput + " = "
		else 
			cOutputEqual = ""
		}

		NewStep(T_CT_CALLMETHOD_ST_CALLMETHOD + cOutputEqual + cObject + Variable(:Name) + 
				T_CT_CALLMETHOD_ST_CALLSTART + cParametersData + 
				T_CT_CALLMETHOD_ST_CALLEND )
		SetStepCode(cOutputEqual + cObject + Variable(:Name) + 
				"(" + cParameters + ")")

		return True 

class CallMethodComponentView from ComponentViewParent
	 
		Title(T_CT_CALLMETHOD_IP_TITLE)	
		TextBox(T_CT_CALLMETHOD_IP_OBJECT , :object)
		TextBox(T_CT_CALLMETHOD_IP_NAME , :name)
		CheckBoxTextBox(T_CT_CALLMETHOD_IP_PARAMETERS,:parameters)
		CheckBoxTextBox(T_CT_CALLMETHOD_IP_OUTPUT,:output)
		PageButtons()
