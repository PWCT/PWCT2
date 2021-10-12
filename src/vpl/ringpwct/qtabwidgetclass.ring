/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  qtabwidgetclass Component
**	Date : 2018.03.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class qtabwidgetclassComponentController from ComponentControllerParent 

	oView = new qtabwidgetclassComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

		 
		# Get the function name in the generated code
			cFunc = T_CT_QTABWIDGETCLASS_IP_VALUE2FUNC[ Variable(:Value2) ]
		
		# Get the function Name 
			cFuncName = T_CT_QTABWIDGETCLASS_IP_VALUE2STEPFUNC [Variable(:Value2)]
		
		# Generate Step and Code using common method 
			common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class qtabwidgetclassComponentView from ComponentViewParent
	 
		Title( T_CT_QTABWIDGETCLASS_IP_TITLE )	
		TextBoxValue( T_CT_QTABWIDGETCLASS_IP_VALUE , :value, T_CT_QTABWIDGETCLASS_IP_VALUE_STARTVALUE)
		ListBox( T_CT_QTABWIDGETCLASS_IP_VALUE2 , :value2, 
				T_CT_QTABWIDGETCLASS_IP_VALUE2LIST )
		TextBox( T_CT_QTABWIDGETCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_QTABWIDGETCLASS_IP_VALUE4 , :value4)
		PageButtons()
