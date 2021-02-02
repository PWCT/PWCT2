/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  qtimerclass Component
**	Date : 2018.03.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class qtimerclassComponentController from ComponentControllerParent 

	oView = new qtimerclassComponentView

	func GenerateAction 

		
				switch Variable(:Value2) {
					
					case 1 cFunc = "delete"
					case 2 cFunc = "gettimeoutevent"
					case 3 cFunc = "init"
					case 4 cFunc = "interval"
					case 5 cFunc = "isactive"
					case 6 cFunc = "issingleshot"
					case 7 cFunc = "setinterval"
					case 8 cFunc = "setsingleshot"
					case 9 cFunc = "settimeoutevent"
					case 10 cFunc = "start"
					case 11 cFunc = "stop"
					case 12 cFunc = "timerid"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_QTIMERCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class qtimerclassComponentView from ComponentViewParent
	 
		Title( T_CT_QTIMERCLASS_IP_TITLE )	
		TextBox( T_CT_QTIMERCLASS_IP_VALUE , :value)
		ListBox( T_CT_QTIMERCLASS_IP_VALUE2 , :value2, 
				T_CT_QTIMERCLASS_IP_VALUE2LIST )
		TextBox( T_CT_QTIMERCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_QTIMERCLASS_IP_VALUE4 , :value4)
		PageButtons()
