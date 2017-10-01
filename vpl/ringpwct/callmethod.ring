/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Call Method Component
**	Date : 2017.10.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class CallMethodComponentController from ComponentControllerParent 

	oView = new CallMethodComponentView

	func GenerateAction 

		cObject = ""
		if variable(:object) != NULL {
			cObject = variable(:object) + "."
		}
								
		if NoValueMsg(:name) { return False }

		if Variable(:lParameters) {
			if NoValueMsg(:parameters) { return False }
			cParameters = Variable(:Parameters)
		else 
			cParameters = ""
		}

		if Variable(:lOutput) {
			if NoValueMsg(:Output) { return False }
			cOutput = Variable(:Output)
		else 
			cOutput = ""
		}

		if cOutput != NULL {
			cOutputEqual = cOutput + " = "
		else 
			cOutputEqual = ""
		}

		NewStep(cOutputEqual + cObject + Variable(:Name) + 
				"(" + StepData(:Parameters) + ")" )
		SetStepCode(cOutputEqual + cObject + Variable(:Name) + 
				"(" + Variable(:Parameters) + ")")

		return True 

class CallMethodComponentView from ComponentViewParent
	 
		Title(T_CT_CALLMETHOD_IP_TITLE)	
		TextBox(T_CT_CALLMETHOD_IP_OBJECT , :object)
		TextBox(T_CT_CALLMETHOD_IP_NAME , :name)
		CheckBoxTextBox(T_CT_CALLMETHOD_IP_PARAMETERS,:parameters)
		CheckBoxTextBox(T_CT_CALLMETHOD_IP_OUTPUT,:output)
		PageButtons()
