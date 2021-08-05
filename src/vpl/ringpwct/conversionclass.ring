/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  conversionclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class conversionclassComponentController from ComponentControllerParent 

	oView = new conversionclassComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "ascii"
					case 2 cFunc = "char"
					case 3 cFunc = "dec"
					case 4 cFunc = "hex"
					case 5 cFunc = "hex2str"
					case 6 cFunc = "number"
					case 7 cFunc = "str2hex"
					case 8 cFunc = "string"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_CONVERSIONCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class conversionclassComponentView from ComponentViewParent
	 
		Title( T_CT_CONVERSIONCLASS_IP_TITLE )	
		TextBox( T_CT_CONVERSIONCLASS_IP_VALUE , :value)
		ListBox( T_CT_CONVERSIONCLASS_IP_VALUE2 , :value2, 
				T_CT_CONVERSIONCLASS_IP_VALUE2LIST )
		TextBox( T_CT_CONVERSIONCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_CONVERSIONCLASS_IP_VALUE4 , :value4)
		PageButtons()
