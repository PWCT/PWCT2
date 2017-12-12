/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdbaseclass Component
**	Date : 2017.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdbaseclassComponentController from ComponentControllerParent 

	oView = new stdbaseclassComponentView

	func GenerateAction 

		switch Variable(:Value2) {			
			case 1 cFunc = "Init" 
			case 2 cFunc = "Print" 
			case 3 cFunc = "PrintLn" 
			case 4 cFunc = "Size" 
			case 5 cFunc = "Value" 
			case 6 cFunc = "Set" 
		}

		# Get the function Name 
			cFuncName = T_CT_STDBASECLASS_IP_VALUE2LIST [Variable(:Value2)]
			nPos = substr(cFuncName,"(")
			# Remove (parameters) from the name
				if nPos {	
					cFuncName = left(cFuncName,nPos-1)
				}
	
		# Set the Object Name if it was written
		# Object Name is optional because we can use braces { }

			if Variable(:Value) != NULL {
				cObjectNameForStepName = StepData(:Value) + "."
				cObjectNameForStepCode = Variable(:Value) + "."
			else 
				cObjectNameForStepName = ""
				cObjectNameForStepCode = ""
			}

		# Set the Output variable if it was written 

			if Variable(:Value4) != NULL {
				cOutputNameForStepName = StepData(:Value4) + " = "
				cOutputNameForStepCode = Variable(:Value4) + " = "
			else 
				cOutputNameForStepName = ""
				cOutputNameForStepCode = ""
			}

		NewStep( cOutputNameForStepName  +
				cObjectNameForStepName + 
				StyleData(cFuncName) +
				"(" + StepData(:Value3) + ")" )
		SetStepCode( cOutputNameForStepCode +
				cObjectNameForStepCode+
				cFunc+"("  + Variable(:Value3 ) + ")"  )
		
		return True 

class stdbaseclassComponentView from ComponentViewParent
	 
		Title( T_CT_STDBASECLASS_IP_TITLE )	
		TextBox( T_CT_STDBASECLASS_IP_VALUE , :value)
		ListBox( T_CT_STDBASECLASS_IP_VALUE2 , :value2, 
				T_CT_STDBASECLASS_IP_VALUE2LIST )
		TextBox( T_CT_STDBASECLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_STDBASECLASS_IP_VALUE4 , :value4)
		PageButtons()
