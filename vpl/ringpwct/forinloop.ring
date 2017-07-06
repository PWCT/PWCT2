/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  For In Loop Component
**	Date : 2017.07.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class ForInLoopComponentController from ComponentControllerParent 

	oView = new ForInLoopComponentView

	func GenerateAction 

		NewParentStep(T_CT_FORINLOOP_ST_FOR + StyleData(Variable(:variable) )  + " " +
					T_CT_FORINLOOP_ST_IN + StyleData(Variable(:In)) +  " " + 
					T_CT_FORINLOOP_ST_STEP + StyleData(Variable(:step)) )
			SetStepCode("for " +  Variable(:variable) + " in " + Variable(:In) + " step " + Variable(:step) + " { " )
			AllowInteraction()
			NewStep(T_CT_FORINLOOP_ST_STARTHERE) # "Start Here"
			oStep = GetActiveStep()
			NewStep(T_CT_FORINLOOP_ST_ENDOFFORLOOP) # "End of For Loop"
				SetStepCode("}")
			SetActiveStep(oStep)

		return True 

class ForInLoopComponentView from ComponentViewParent
	 
		Title(T_CT_FORINLOOP_IP_TITLE)	# "For In Loop Component"
		# "Variable : "
		TextBox(T_CT_FORINLOOP_IP_VARIABLE , :variable) {
			setText(T_CT_FORINLOOP_IP_VARIABLEVALUE)
		}
		# "to : "
		TextBox(T_CT_FORINLOOP_IP_IN , :in) {
			setText(T_CT_FORINLOOP_IP_INVALUE)
		}
		# "Step : "
		TextBox(T_CT_FORLOOP_IP_STEP , :step) {
			setText("1")
		}
		PageButtons()
