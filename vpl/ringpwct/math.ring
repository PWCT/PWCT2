/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  math Component
**	Date : 2017.07.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class mathComponentController from ComponentControllerParent 

	oView = new mathComponentView

	func GenerateAction 

		
				switch Variable(:Value2) {
					
					case 1 cFunc = "sin" 
					case 2 cFunc = "cos" 
					case 3 cFunc = "tan" 
					case 4 cFunc = "asin" 
					case 5 cFunc = "acos" 
					case 6 cFunc = "atan" 
					case 7 cFunc = "atan2" 
					case 8 cFunc = "sinh" 
					case 9 cFunc = "cosh" 
					case 10 cFunc = "tanh" 
					case 11 cFunc = "exp" 
					case 12 cFunc = "log" 
					case 13 cFunc = "log10" 
					case 14 cFunc = "ceil" 
					case 15 cFunc = "floor" 
					case 16 cFunc = "fabs" 
					case 17 cFunc = "pow" 
					case 18 cFunc = "sqrt" 
					case 19 cFunc = "random" 
					case 20 cFunc = "unsigned" 
					case 21 cFunc = "decimals" 		
				}
		
				NewStep( StepData(:Value3) + " = "  +  T_CT_MATH_ST_VALUE  +
					 StepData(:Value ) +  T_CT_MATH_ST_VALUE2 + 
					StyleData(T_CT_MATH_IP_VALUE2LIST[Variable(:Value2)])  )
				SetStepCode( Variable(:Value3) + " = "+cFunc+"("  + Variable(:Value ) + ")"  )
				

		return True 

class mathComponentView from ComponentViewParent
	 
		Title( T_CT_MATH_IP_TITLE )	
		TextBox( T_CT_MATH_IP_VALUE , :value)
		ListBox( T_CT_MATH_IP_VALUE2 , :value2, 
				T_CT_MATH_IP_VALUE2LIST )
		TextBox( T_CT_MATH_IP_VALUE3 , :value3)
		PageButtons()
