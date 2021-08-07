/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  weblib_applicationclass Component
**	Date : 2018.03.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class weblib_applicationclassComponentController from ComponentControllerParent 

	oView = new weblib_applicationclassComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

		 
				
				# Get the function name in the generated code
					cFunc = T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE2FUNC[ Variable(:Value2) ]
		
				# Get the function Name 
					cFuncName = T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class weblib_applicationclassComponentView from ComponentViewParent
	 
		Title( T_CT_WEBLIB_APPLICATIONCLASS_IP_TITLE )	
		TextBox( T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE , :value)
		ListBox( T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE2 , :value2, 
				T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE2LIST )
		TextBox( T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE4 , :value4)
		PageButtons()
