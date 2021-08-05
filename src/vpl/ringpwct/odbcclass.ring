/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  odbcclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class odbcclassComponentController from ComponentControllerParent 

	oView = new odbcclassComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "autocommit"
					case 2 cFunc = "close"
					case 3 cFunc = "colcount"
					case 4 cFunc = "columns"
					case 5 cFunc = "commit"
					case 6 cFunc = "connect"
					case 7 cFunc = "datasources"
					case 8 cFunc = "disconnect"
					case 9 cFunc = "drivers"
					case 10 cFunc = "execute"
					case 11 cFunc = "fetch"
					case 12 cFunc = "getdata"
					case 13 cFunc = "init"
					case 14 cFunc = "rollback"
					case 15 cFunc = "tables"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_ODBCCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class odbcclassComponentView from ComponentViewParent
	 
		Title( T_CT_ODBCCLASS_IP_TITLE )	
		TextBox( T_CT_ODBCCLASS_IP_VALUE , :value)
		ListBox( T_CT_ODBCCLASS_IP_VALUE2 , :value2, 
				T_CT_ODBCCLASS_IP_VALUE2LIST )
		TextBox( T_CT_ODBCCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_ODBCCLASS_IP_VALUE4 , :value4)
		PageButtons()
