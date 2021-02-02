/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stdlib_fibonacci Component
**	Date : 2017.10.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class stdlib_fibonacciComponentController from ComponentControllerParent 

	oView = new stdlib_fibonacciComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_STDLIB_FIBONACCI_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = fibonacci("  + Variable(:Value ) + ")"  )

		return True 

class stdlib_fibonacciComponentView from ComponentViewParent
	 
		Title( T_CT_STDLIB_FIBONACCI_IP_TITLE )	
		TextBox( T_CT_STDLIB_FIBONACCI_IP_VALUE , :value)
		TextBox( T_CT_STDLIB_FIBONACCI_IP_VALUE2 , :value2)
		PageButtons()
