/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Exit Component
**	Date : 2017.07.07
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class ExitComponentController from ComponentControllerParent 

	oView = new ExitComponentView

	func GenerateAction 
								
		if NoValueMsg(:value) { return False }

		NewParentStep(T_CT_EXIT_ST_EXIT + StyleData(Variable(:value) )  )  
			SetStepCode("exit " +  Variable(:value))

		return True 

class ExitComponentView from ComponentViewParent
	 
		Title(T_CT_EXIT_IP_TITLE)	
		TextBoxValue(T_CT_EXIT_IP_VALUE , :value, "1")
		PageButtons()
