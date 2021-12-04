/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Print Component
**	Date : 2017.02.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class GetInputComponentController from ComponentControllerParent 

	oView = new GetInputComponentView

	func GenerateAction 

		if NoValueMsg(:text) { return False }

		if Variable(:Number) {
			NewStep(T_CT_GETINPUT_ST_INPUT_NUMBER + StyleData(  Variable(:text) )  ) # "Input " 
			SetStepCode("give " + Variable(:text) + " " + nl + 
				    Variable(:text) + " = 0 + " + Variable(:text) )	
		else
			NewStep(T_CT_GETINPUT_ST_INPUT + StyleData(  Variable(:text) )  ) # "Input " 
			SetStepCode("give " + Variable(:text) )	
		}

		return True 

class GetInputComponentView from ComponentViewParent
	 
		Title(T_CT_GETINPUT_IP_TITLE)				# "Get Input Component"
		TextBoxValue(T_CT_GETINPUT_IP_VARIABLE , :text,	T_CT_GETINPUT_IP_VARIABLE_DEFAULT)  	# "Variable : "
		# To Number 
			CheckBox(T_CT_GETINPUT_IP_NUMBER,:number) {
				setcheckstate(0)
			}
		PageButtons()


