/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Func Component
**	Date : 2017.07.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class FuncComponentController from ComponentControllerParent 

	oView = new FuncComponentView

	func GenerateAction 
								
		if NoValueMsg(:name) { return False }

		if Variable(:lParameters) {
			if NoValueMsg(:parameters) { return False }
			NewParentStep(T_CT_FUNC_ST_FUNC + StepData(:name) + 
						" " + StepData(:Parameters) )  
			SetStepCode("func " +  Variable(:name) + 
						" " + Variable(:Parameters))
		else 
			NewParentStep(T_CT_FUNC_ST_FUNC + StepData(:name) )  
			SetStepCode("func " +  Variable(:name))
		}

			AllowInteraction()
			NewStep(T_CT_FUNC_ST_STARTHERE) 
			oStep = GetActiveStep()

		if Variable(:lOutput) {
			if NoValueMsg(:Output) { return False }
			NewStep(T_CT_FUNC_ST_ENDOFFUNC + " --> " + StepData(:Output) )
			SetStepCode("return " +  Variable(:Output))
		else 
			NewStep(T_CT_FUNC_ST_ENDOFFUNC)
			SetStepCode("")
		}

			SetActiveStep(oStep)

		return True 

class FuncComponentView from ComponentViewParent
	 
		Title(T_CT_FUNC_IP_TITLE)	
		TextBox(T_CT_FUNC_IP_NAME , :name)
		CheckBoxTextBox(T_CT_FUNC_IP_PARAMETERS,:parameters)
		CheckBoxTextBox(T_CT_FUNC_IP_OUTPUT,:output)
		PageButtons()
