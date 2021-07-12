/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stringclass Component
**	Date : 2017.12.14
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stringclassComponentController from ComponentControllerParent 

	oView = new stringclassComponentView

	aAllowEmptyValue = [:value3,:value4]

	func GenerateAction 

		
				switch Variable(:Value2) {
					case 1 cFunc = "copy"
					case 2 cFunc = "endswith"
					case 3 cFunc = "getfrom"
					case 4 cFunc = "init"
					case 5 cFunc = "left"
					case 6 cFunc = "lines"
					case 7 cFunc = "lower"
					case 8 cFunc = "mid"
					case 9 cFunc = "operator"
					case 10 cFunc = "pos"
					case 11 cFunc = "print"
					case 12 cFunc = "println"
					case 13 cFunc = "replace"
					case 14 cFunc = "right"
					case 15 cFunc = "set"
					case 16 cFunc = "size"
					case 17 cFunc = "split"
					case 18 cFunc = "startswith"
					case 19 cFunc = "strcmp"
					case 20 cFunc = "tofile"
					case 21 cFunc = "tolist"
					case 22 cFunc = "trim"
					case 23 cFunc = "upper"
					case 24 cFunc = "value"
				}
		
				# Get the function Name 
					cFuncName = T_CT_STRINGCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class stringclassComponentView from ComponentViewParent
	 
		Title( T_CT_STRINGCLASS_IP_TITLE )	
		TextBox( T_CT_STRINGCLASS_IP_VALUE , :value)
		ListBox( T_CT_STRINGCLASS_IP_VALUE2 , :value2, 
				T_CT_STRINGCLASS_IP_VALUE2LIST )
		TextBox( T_CT_STRINGCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_STRINGCLASS_IP_VALUE4 , :value4)
		PageButtons()
