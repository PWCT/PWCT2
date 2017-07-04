/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  For Loop Component
**	Date : 2017.07.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class ForLoopComponentController from ComponentControllerParent 

	oView = new ForLoopComponentView

	func GenerateAction 

		NewParentStep(T_CT_FORLOOP_ST_FOR + StyleData(Variable(:start) )  + " " +
					T_CT_FORLOOP_ST_TO + StyleData(Variable(:to)) +  " " + 
					T_CT_FORLOOP_ST_STEP + StyleData(Variable(:step)) )
			SetStepCode("for " +  Variable(:start) + " to " + Variable(:to) + " step " + Variable(:step) + " { " )
			AllowInteraction()
			NewStep(T_CT_FORLOOP_ST_STARTHERE) # "Start Here"
			oStep = GetActiveStep()
			NewStep(T_CT_FORLOOP_ST_ENDOFFORLOOP) # "End of For Loop"
				SetStepCode("}")
			SetActiveStep(oStep)

		return True 

class ForLoopComponentView from ComponentViewParent
	 
		Title(T_CT_FORLOOP_IP_TITLE)	# "For Loop Component"
		# "Start : "
		TextBox(T_CT_FORLOOP_IP_START , :start) {
			setText(T_CT_FORLOOP_IP_STARTVALUE)
		}
		# "to : "
		TextBox(T_CT_FORLOOP_IP_TO , :to) {
			setText("10")
		}
		# "Step : "
		TextBox(T_CT_FORLOOP_IP_STEP , :step) {
			setText("1")
		}
		PageButtons()
