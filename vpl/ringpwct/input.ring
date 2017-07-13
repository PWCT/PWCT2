/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Input() Component
**	Date : 2017.07.13
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class InputComponentController from ComponentControllerParent 

	oView = new InputComponentView

	func GenerateAction 
								
		if NoValueMsgList([:Count,:Output]) { return False }

		NewStep( StepData(:Output)   + " = " + 
						T_CT_INPUT_ST_INPUT + " ( " + 
						StepData(:Count)   + ")" )  
			SetStepCode(Variable(:Output) + " = Input(" + Variable(:Count) + ")" )

		return True 

class InputComponentView from ComponentViewParent
	 
		Title(T_CT_INPUT_IP_TITLE)	
		TextBox(T_CT_INPUT_IP_COUNT , :Count) {
			setText("30")
		}
		TextBox(T_CT_INPUT_IP_OUTPUT , :Output) {
			setText(T_CT_INPUT_IP_OUTPUTVARIABLE)
		}
		PageButtons()
