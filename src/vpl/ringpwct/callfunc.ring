/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Call Func Component
**	Date : 2017.07.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class CallFuncComponentController from ComponentControllerParent 

	oView = new CallFuncComponentView

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

		NewStep(T_CT_CALLFUNC_ST_CALLFUNC + cOutputEqual + Variable(:Name) + 
				T_CT_CALLFUNC_ST_FUNCCALLSTART + StepData(:Parameters) + 
				T_CT_CALLFUNC_ST_FUNCCALLEND )
		SetStepCode(cOutputEqual + Variable(:Name) + 
				"(" + Variable(:Parameters) + ")")

		return True 

class CallFuncComponentView from ComponentViewParent
	 
		Title(T_CT_CALLFUNC_IP_TITLE)	
		TextBox(T_CT_CALLFUNC_IP_NAME , :name)
		CheckBoxTextBox(T_CT_CALLFUNC_IP_PARAMETERS,:parameters)
		CheckBoxTextBox(T_CT_CALLFUNC_IP_OUTPUT,:output)
		PageButtons()
