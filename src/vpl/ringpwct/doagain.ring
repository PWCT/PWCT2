/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Do Again Component
**	Date : 2017.07.07
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class DoAgainComponentController from ComponentControllerParent 

	oView = new DoAgainComponentView

	func GenerateAction 
								
		if NoValueMsg(:condition) { return False }

		NewParentStep(T_CT_DOAGAIN_ST_DO  )  
			SetStepCode("do " )
			AllowInteraction()
			NewStep(T_CT_DOAGAIN_ST_STARTHERE) 
			oStep = GetActiveStep()
			NewStep(T_CT_DOAGAIN_ST_AGAIN + StyleData(Variable(:condition) ) ) # "End of WhileLoop"
				SetStepCode("again " +Variable(:condition) )
			SetActiveStep(oStep)

		return True 

class DoAgainComponentView from ComponentViewParent
	 
		Title(T_CT_DOAGAIN_IP_TITLE)	# "Do Again Component"
		TextBox(T_CT_DOAGAIN_IP_CONDITION , :condition) # "Condition : "
		PageButtons()