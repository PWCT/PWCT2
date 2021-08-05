/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  hashtableclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class hashtableclassComponentController from ComponentControllerParent 

	oView = new hashtableclassComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "add"
					case 2 cFunc = "contains"
					case 3 cFunc = "delete"
					case 4 cFunc = "find"
					case 5 cFunc = "findincolumn"
					case 6 cFunc = "first"
					case 7 cFunc = "getvalue"
					case 8 cFunc = "index"
					case 9 cFunc = "init"
					case 10 cFunc = "insert"
					case 11 cFunc = "item"
					case 12 cFunc = "last"
					case 13 cFunc = "operator"
					case 14 cFunc = "print"
					case 15 cFunc = "println"
					case 16 cFunc = "reverse"
					case 17 cFunc = "set"
					case 18 cFunc = "size"
					case 19 cFunc = "sort"
					case 20 cFunc = "swap"
					case 21 cFunc = "value"
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_HASHTABLECLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class hashtableclassComponentView from ComponentViewParent
	 
		Title( T_CT_HASHTABLECLASS_IP_TITLE )	
		TextBox( T_CT_HASHTABLECLASS_IP_VALUE , :value)
		ListBox( T_CT_HASHTABLECLASS_IP_VALUE2 , :value2, 
				T_CT_HASHTABLECLASS_IP_VALUE2LIST )
		TextBox( T_CT_HASHTABLECLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_HASHTABLECLASS_IP_VALUE4 , :value4)
		PageButtons()
