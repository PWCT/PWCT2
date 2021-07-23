/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Expression Component
**	Date : 2021.07.23
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class expressionComponentController from ComponentControllerParent 

	oView = new expressionComponentView

	aAllowEmptyValue = [:value3,:value4]

	func GenerateAction 

			switch Variable(:Value2) {
				case 1 # Call Function

					NewParentStep(T_CT_EXPRESSION_ST_CALLFUNC + Variable(:Value) + 
							T_CT_EXPRESSION_ST_FUNCCALLSTART )
					SetStepCode(Variable(:Value) +  "(" )

					AllowInteraction()
					NewStep(T_CT_EXPRESSION_ST_STARTHERE) 
					oStep = GetActiveStep()
		
					NewStep(T_CT_EXPRESSION_ST_FUNCCALLEND)
					SetStepCode(")")

					SetActiveStep(oStep)

				case 2 # New List 

					NewParentStep( Variable(:Value) + 
							" = [" )
					SetStepCode(Variable(:Value) +  " = [" )

					AllowInteraction()
					NewStep(T_CT_EXPRESSION_ST_STARTHERE) 
					oStep = GetActiveStep()
		
					NewStep("]")
					SetStepCode("]")

					SetActiveStep(oStep)

			}

		return True 

class expressionComponentView from ComponentViewParent
	 
		Title( T_CT_EXPRESSION_IP_TITLE )	
		TextBox( T_CT_EXPRESSION_IP_VALUE , :value)
		ListBox( T_CT_EXPRESSION_IP_VALUE2 , :value2, 
				T_CT_EXPRESSION_IP_VALUE2LIST )
		PageButtons()
