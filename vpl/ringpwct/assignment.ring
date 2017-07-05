/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Assignment Component
**	Date : 2017.07.05
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class AssignmentComponentController from ComponentControllerParent 

	oView = new AssignmentComponentView

	func GenerateAction 

		NewStep( StyleData(Variable(:leftside) ) + " = " + StyleData(Variable(:rightside)) ) 
		SetStepCode(Variable(:leftside) + " = " + Variable(:rightside) )

		return True 

class AssignmentComponentView from ComponentViewParent
	 
		# "Assignment Component"
			Title(T_CT_ASSIGNMENT_IP_TITLE)	
		# "Text : "
			TextBox(T_CT_PRINT_IP_LEFTSIDE , :leftside)
			TextBox(T_CT_PRINT_IP_RIGHTSIDE , :rightside)
		PageButtons()
