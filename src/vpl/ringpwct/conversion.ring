/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  conversion Component
**	Date : 2017.07.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class conversionComponentController from ComponentControllerParent 

	oView = new conversionComponentView

	func GenerateAction 

		
				switch Variable(:Value2) {
					
					case 1 cFunc = "number" 
					case 2 cFunc = "string" 
					case 3 cFunc = "ascii" 
					case 4 cFunc = "char" 
					case 5 cFunc = "hex" 
					case 6 cFunc = "dec" 
					case 7 cFunc = "str2hex" 
					case 8 cFunc = "hex2str" 
		
				}
		
				NewStep( StepData(:Value3) + " = "  +  T_CT_CONVERSION_ST_VALUE  +
					 StepData(:Value ) +  T_CT_CONVERSION_ST_VALUE2 + 
					StyleData(T_CT_CONVERSION_IP_VALUE2LIST[Variable(:Value2)])  )
				SetStepCode( Variable(:Value3) + " = "+cFunc+"("  + Variable(:Value ) + ")"  )
				

		return True 

class conversionComponentView from ComponentViewParent
	 
		Title( T_CT_CONVERSION_IP_TITLE )	
		TextBox( T_CT_CONVERSION_IP_VALUE , :value)
		ListBox( T_CT_CONVERSION_IP_VALUE2 , :value2, 
				T_CT_CONVERSION_IP_VALUE2LIST )
		TextBox( T_CT_CONVERSION_IP_VALUE3 , :value3)
		PageButtons()
