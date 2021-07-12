/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  listclass Component
**	Date : 2017.12.14
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class listclassComponentController from ComponentControllerParent 

	oView = new listclassComponentView

	aAllowEmptyValue = [:value3,:value4]

	func GenerateAction 

		
				switch Variable(:Value2) {
					
					case 1 cFunc = "add"
					case 2 cFunc = "delete"
					case 3 cFunc = "find"
					case 4 cFunc = "findincolumn"
					case 5 cFunc = "first"
					case 6 cFunc = "init"
					case 7 cFunc = "insert"
					case 8 cFunc = "item"
					case 9 cFunc = "last"
					case 10 cFunc = "operator"
					case 11 cFunc = "print"
					case 12 cFunc = "println"
					case 13 cFunc = "reverse"
					case 14 cFunc = "set"
					case 15 cFunc = "size"
					case 16 cFunc = "sort"
					case 17 cFunc = "swap"
					case 18 cFunc = "value"
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_LISTCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class listclassComponentView from ComponentViewParent
	 
		Title( T_CT_LISTCLASS_IP_TITLE )	
		TextBox( T_CT_LISTCLASS_IP_VALUE , :value)
		ListBox( T_CT_LISTCLASS_IP_VALUE2 , :value2, 
				T_CT_LISTCLASS_IP_VALUE2LIST )
		TextBox( T_CT_LISTCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_LISTCLASS_IP_VALUE4 , :value4)
		PageButtons()
