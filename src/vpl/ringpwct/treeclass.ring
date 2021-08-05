/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  treeclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class treeclassComponentController from ComponentControllerParent 

	oView = new treeclassComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "add"
					case 2 cFunc = "parent"
					case 3 cFunc = "print"
					case 4 cFunc = "set"
					case 5 cFunc = "value"
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_TREECLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class treeclassComponentView from ComponentViewParent
	 
		Title( T_CT_TREECLASS_IP_TITLE )	
		TextBox( T_CT_TREECLASS_IP_VALUE , :value)
		ListBox( T_CT_TREECLASS_IP_VALUE2 , :value2, 
				T_CT_TREECLASS_IP_VALUE2LIST )
		TextBox( T_CT_TREECLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_TREECLASS_IP_VALUE4 , :value4)
		PageButtons()
