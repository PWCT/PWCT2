/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  numbersandbytes Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class numbersandbytesComponentController from ComponentControllerParent 

	oView = new numbersandbytesComponentView

	func GenerateAction 

		
				switch Variable(:Value2) {
					
					case 1 cFunc = "int2bytes" 
					case 2 cFunc = "float2bytes" 
					case 3 cFunc = "double2bytes" 
					case 4 cFunc = "bytes2int" 
					case 5 cFunc = "bytes2float" 
					case 6 cFunc = "bytes2double" 
		
				}
		
				NewStep( StepData(:Value3) + " = "  +  T_CT_NUMBERSANDBYTES_ST_VALUE  +
					 StepData(:Value ) +  T_CT_NUMBERSANDBYTES_ST_VALUE2 + 
					StyleData(T_CT_NUMBERSANDBYTES_IP_VALUE2LIST[Variable(:Value2)])  )
				SetStepCode( Variable(:Value3) + " = "+cFunc+"("  + Variable(:Value ) + ")"  )
				

		return True 

class numbersandbytesComponentView from ComponentViewParent
	 
		Title( T_CT_NUMBERSANDBYTES_IP_TITLE )	
		TextBox( T_CT_NUMBERSANDBYTES_IP_VALUE , :value)
		ListBox( T_CT_NUMBERSANDBYTES_IP_VALUE2 , :value2, 
				T_CT_NUMBERSANDBYTES_IP_VALUE2LIST )
		TextBox( T_CT_NUMBERSANDBYTES_IP_VALUE3 , :value3)
		PageButtons()
