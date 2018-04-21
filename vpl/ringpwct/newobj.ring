/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newobj Component
**	Date : 2017.10.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newobjComponentController from ComponentControllerParent 

	oView = new newobjComponentView

	func GenerateAction 

		cInit = ""
		if Variable(:init) and Variable(:value3) = NULL and
			 right(Variable(:value2),2) != "()" {
			cInit = "()"
		}


		if Variable(:value) = NULL {
		
			if Variable(:value3) = NULL {
				NewParentStep( T_CT_NEWOBJ_ST_NEWOBJ  + StepData(:value2) )
				SetStepCode(  "new " + Variable(:value2) + cInit )
			else
				NewParentStep( T_CT_NEWOBJ_ST_NEWOBJ  + StepData(:value2)  + "(" + StepData(:value3) + ")" )
				SetStepCode(  "new " + Variable(:value2) + "(" + Variable(:value3) + ")" )
			}
		
		else
		
			if Variable(:value3) = NULL {
				NewParentStep( T_CT_NEWOBJ_ST_SET + StepData(:value) + " = " + T_CT_NEWOBJ_ST_NEWOBJ  + StepData(:value2) )
				SetStepCode(  variable(:value) + " = new " + Variable(:value2) + cInit )
			else
				NewParentStep( T_CT_NEWOBJ_ST_SET + StepData(:value) + " = " + T_CT_NEWOBJ_ST_NEWOBJ  + StepData(:value2)  +
							 "(" + StepData(:value3) + ")" )
				SetStepCode(  variable(:value) + " = new " + Variable(:value2) + "(" + Variable(:value3) + ")" )
			}
		
		
		}

		if Variable(:braces) {
			RunComponentFromComponent(new bracesComponentController)
		}

		return True 

class newobjComponentView from ComponentViewParent
	 
		Title( T_CT_NEWOBJ_IP_TITLE )	
		TextBox( T_CT_NEWOBJ_IP_VALUE , :value)
		TextBox( T_CT_NEWOBJ_IP_VALUE2 , :value2)
		TextBox( T_CT_NEWOBJ_IP_VALUE3 , :value3)
		# Add Braces 
			CheckBox(T_CT_NEWOBJ_IP_BRACES,:braces) {
				setcheckstate(2)
			}
		# Init() Method
			CheckBox(T_CT_NEWOBJ_IP_INIT,:init) {
				setcheckstate(2)
			}
		PageButtons()
