/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Print Component
**	Date : 2017.02.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class GetInputComponentController from ComponentControllerParent 

	oView = new GetInputComponentView

	func GenerateAction 

		NewStep(T_CT_GETINPUT_ST_INPUT + Variable(:text))  # "Input " 
		SetStepCode("Give " + Variable(:text) )	

class GetInputComponentView from ComponentViewParent
	 
		Title(T_CT_GETINPUT_IP_TITLE)				# "Get Input Component"
		TextBox(T_CT_GETINPUT_IP_VARIABLE , :text)  	# "Variable : "
		PageButtons()


