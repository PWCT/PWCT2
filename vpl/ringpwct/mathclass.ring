/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  mathclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class mathclassComponentController from ComponentControllerParent 

	oView = new mathclassComponentView

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "acos"
					case 2 cFunc = "asin"
					case 3 cFunc = "atan"
					case 4 cFunc = "atan2"
					case 5 cFunc = "ceil"
					case 6 cFunc = "cos"
					case 7 cFunc = "cosh"
					case 8 cFunc = "decimals"
					case 9 cFunc = "exp"
					case 10 cFunc = "fabs"
					case 11 cFunc = "floor"
					case 12 cFunc = "log"
					case 13 cFunc = "log10"
					case 14 cFunc = "pow"
					case 15 cFunc = "random"
					case 16 cFunc = "sin"
					case 17 cFunc = "sinh"
					case 18 cFunc = "sqrt"
					case 19 cFunc = "tan"
					case 20 cFunc = "tanh"
					case 21 cFunc = "unsigned"
				}
		
				# Get the function Name 
					cFuncName = T_CT_MATHCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class mathclassComponentView from ComponentViewParent
	 
		Title( T_CT_MATHCLASS_IP_TITLE )	
		TextBox( T_CT_MATHCLASS_IP_VALUE , :value)
		ListBox( T_CT_MATHCLASS_IP_VALUE2 , :value2, 
				T_CT_MATHCLASS_IP_VALUE2LIST )
		TextBox( T_CT_MATHCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_MATHCLASS_IP_VALUE4 , :value4)
		PageButtons()
