/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  queueclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class queueclassComponentController from ComponentControllerParent 

	oView = new queueclassComponentView

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
					case 13 cFunc = "remove"
					case 14 cFunc = "reverse"
					case 15 cFunc = "set"
					case 16 cFunc = "size"
					case 17 cFunc = "sort"
					case 18 cFunc = "swap"
					case 19 cFunc = "value"
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_QUEUECLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class queueclassComponentView from ComponentViewParent
	 
		Title( T_CT_QUEUECLASS_IP_TITLE )	
		TextBox( T_CT_QUEUECLASS_IP_VALUE , :value)
		ListBox( T_CT_QUEUECLASS_IP_VALUE2 , :value2, 
				T_CT_QUEUECLASS_IP_VALUE2LIST )
		TextBox( T_CT_QUEUECLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_QUEUECLASS_IP_VALUE4 , :value4)
		PageButtons()
