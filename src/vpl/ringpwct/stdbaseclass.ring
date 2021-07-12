/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdbaseclass Component
**	Date : 2017.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdbaseclassComponentController from ComponentControllerParent 

	oView = new stdbaseclassComponentView

	aAllowEmptyValue = [:value3,:value4]

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

		# Generate Step and Code using common method 
			common_callobjectmethod(cFunc,cFuncName)
		
		return True 

class stdbaseclassComponentView from ComponentViewParent
	 
		Title( T_CT_STDBASECLASS_IP_TITLE )	
		TextBox( T_CT_STDBASECLASS_IP_VALUE , :value)
		ListBox( T_CT_STDBASECLASS_IP_VALUE2 , :value2, 
				T_CT_STDBASECLASS_IP_VALUE2LIST )
		TextBox( T_CT_STDBASECLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_STDBASECLASS_IP_VALUE4 , :value4)
		PageButtons()
