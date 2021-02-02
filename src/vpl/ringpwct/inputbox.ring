/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  inputbox Component
**	Date : 2018.03.11
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class inputboxComponentController from ComponentControllerParent 

	oView = new inputboxComponentView

	func GenerateAction 

		
				switch Variable(:Value2) {
					
					case 1 cFunc = "InputBox" 
					case 2 cFunc = "InputBoxInt" 
					case 3 cFunc = "InputBoxNum" 
					case 4 cFunc = "InputBoxPass" 
		
				}
		
				NewStep( StepData(:Value4) + " = "  +  T_CT_INPUTBOX_ST_VALUE  +
					 StepData(:Value ) +  T_CT_INPUTBOX_ST_VALUE2 + 
					StyleData(T_CT_INPUTBOX_IP_VALUE2LIST[Variable(:Value2)])   +
					T_CT_INPUTBOX_ST_VALUE3  +  StepData(:Value3 ) )
				SetStepCode( Variable(:Value4) + " = "+cFunc+"("  + Variable(:Value ) + ","  				+ Variable(:Value3) + ")"  )
		

		return True 

class inputboxComponentView from ComponentViewParent
	 
		Title( T_CT_INPUTBOX_IP_TITLE )	
		TextBox( T_CT_INPUTBOX_IP_VALUE , :value)
		ListBox( T_CT_INPUTBOX_IP_VALUE2 , :value2, 
				T_CT_INPUTBOX_IP_VALUE2LIST )
		TextBox( T_CT_INPUTBOX_IP_VALUE3 , :value3)
		TextBox( T_CT_INPUTBOX_IP_VALUE4 , :value4)
		PageButtons()
