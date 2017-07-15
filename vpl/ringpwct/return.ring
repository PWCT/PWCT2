/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Return Component
**	Date : 2017.07.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class ReturnComponentController from ComponentControllerParent 

	oView = new ReturnComponentView

	func GenerateAction 
								
		NewParentStep(T_CT_RETURN_ST_RETURN + StyleData(Variable(:value) )  )  
			SetStepCode("return " +  Variable(:value))

		return True 

class ReturnComponentView from ComponentViewParent
	 
		Title(T_CT_RETURN_IP_TITLE)	
		TextBox(T_CT_RETURN_IP_VALUE , :value)
		PageButtons()
