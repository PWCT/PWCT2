/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  datetimeclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class datetimeclassComponentController from ComponentControllerParent 

	oView = new datetimeclassComponentView

	aAllowEmptyValue = [:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "adddays"
					case 2 cFunc = "clock"
					case 3 cFunc = "date"
					case 4 cFunc = "diffdays"
					case 5 cFunc = "time"
					case 6 cFunc = "timelist"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_DATETIMECLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class datetimeclassComponentView from ComponentViewParent
	 
		Title( T_CT_DATETIMECLASS_IP_TITLE )	
		TextBox( T_CT_DATETIMECLASS_IP_VALUE , :value)
		ListBox( T_CT_DATETIMECLASS_IP_VALUE2 , :value2, 
				T_CT_DATETIMECLASS_IP_VALUE2LIST )
		TextBox( T_CT_DATETIMECLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_DATETIMECLASS_IP_VALUE4 , :value4)
		PageButtons()
