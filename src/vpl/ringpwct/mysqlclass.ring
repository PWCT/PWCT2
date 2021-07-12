/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  mysqlclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class mysqlclassComponentController from ComponentControllerParent 

	oView = new mysqlclassComponentView

	aAllowEmptyValue = [:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "autocommit"
					case 2 cFunc = "close"
					case 3 cFunc = "columns"
					case 4 cFunc = "commit"
					case 5 cFunc = "connect"
					case 6 cFunc = "error"
					case 7 cFunc = "escape_string"
					case 8 cFunc = "info"
					case 9 cFunc = "init"
					case 10 cFunc = "insert_id"
					case 11 cFunc = "next_result"
					case 12 cFunc = "query"
					case 13 cFunc = "result"
					case 14 cFunc = "result2"
					case 15 cFunc = "rollback"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_MYSQLCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class mysqlclassComponentView from ComponentViewParent
	 
		Title( T_CT_MYSQLCLASS_IP_TITLE )	
		TextBox( T_CT_MYSQLCLASS_IP_VALUE , :value)
		ListBox( T_CT_MYSQLCLASS_IP_VALUE2 , :value2, 
				T_CT_MYSQLCLASS_IP_VALUE2LIST )
		TextBox( T_CT_MYSQLCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_MYSQLCLASS_IP_VALUE4 , :value4)
		PageButtons()
