/*
**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose 	:  Call Func By Variable Component
**	Date 		: 2017.07.15
**	Author 		:  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class CallFuncByVariableComponentController from ComponentControllerParent 

	oView = new CallFuncByVariableComponentView

	func GenerateAction 
								
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

		NewStep(cOutputEqual + T_CT_CALLFUNCBYVARIABLE_ST_CALL + Variable(:Name) + 
				"(" + StepData(:Parameters) + ")" )
		SetStepCode(cOutputEqual + "call " + Variable(:Name) + 
				"(" + Variable(:Parameters) + ")")

		return True 

class CallFuncByVariableComponentView from ComponentViewParent
	 
		Title(T_CT_CALLFUNCBYVARIABLE_IP_TITLE)	
		TextBox(T_CT_CALLFUNCBYVARIABLE_IP_NAME , :name)
		CheckBoxTextBox(T_CT_CALLFUNCBYVARIABLE_IP_PARAMETERS,:parameters)
		CheckBoxTextBox(T_CT_CALLFUNCBYVARIABLE_IP_OUTPUT,:output)
		PageButtons()
