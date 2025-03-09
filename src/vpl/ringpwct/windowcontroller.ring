/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  windowcontroller Component
**	Date : 2025.03.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class windowcontrollerComponentController from ComponentControllerParent 

	oView = new windowcontrollerComponentView

	func GenerateAction 

		NewParentStep( T_CT_WINDOWCONTROLLER_ST_WINCNT + StyleData(Variable(:name) ) )
		SetStepCode( `load "`+ Variable(:name) +`View.ring"` + nl + 
					 `import System.GUI` + nl +
					 `if IsMainSourceFile() {` + nl  
		)

			AllowInteraction()
			NewStep(T_CT_WINDOWCONTROLLER_ST_MAINFILE) 
			oStep = GetActiveStep()
			NewParentStep(T_CT_WINDOWCONTROLLER_ST_CLASS + StyleData(Variable(:name) )) 
				SetStepCode("}" + nl + 
							`class `+Variable(:name)+`Controller from windowsControllerParent` + nl	+
							`oView = new `+Variable(:name)+`View`						
			)
			AllowInteraction()
			NewStep(T_CT_WINDOWCONTROLLER_ST_ATTRIBUTES) 
			AllowInteraction()
			NewStep(T_CT_WINDOWCONTROLLER_ST_METHODS) 
			NewParentStep(T_CT_WINDOWCONTROLLER_ST_PRIVATE) 
			AllowInteraction()
			NewStep(T_CT_WINDOWCONTROLLER_ST_ATTRIBUTES) 
			AllowInteraction()
			NewStep(T_CT_WINDOWCONTROLLER_ST_METHODS) 
			NewStep(T_CT_WINDOWCONTROLLER_ST_END) 
			SetActiveStep(oStep)

		return True 

class windowcontrollerComponentView from ComponentViewParent
	 
		Title( T_CT_WINDOWCONTROLLER_IP_TITLE )	
		TextBox( T_CT_WINDOWCONTROLLER_IP_VALUE , :name)
		TextBox( T_CT_WINDOWCONTROLLER_IP_VALUE2 , :value2)
		TextBox( T_CT_WINDOWCONTROLLER_IP_VALUE3 , :value3)
		PageButtons()
