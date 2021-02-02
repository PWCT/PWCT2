/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  weblib_applicationclass Component
**	Date : 2018.03.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class weblib_applicationclassComponentController from ComponentControllerParent 

	oView = new weblib_applicationclassComponentView

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "cookie"
					case 2 cFunc = "decode"
					case 3 cFunc = "decodestring"
					case 4 cFunc = "getcookies"
					case 5 cFunc = "getfilename"
					case 6 cFunc = "gethtmlstart"
					case 7 cFunc = "gettabs"
					case 8 cFunc = "nooutput"
					case 9 cFunc = "output"
					case 10 cFunc = "print"
					case 11 cFunc = "scriptlibs"
					case 12 cFunc = "setcookie"
					case 13 cFunc = "starthtml"
					case 14 cFunc = "style"
					case 15 cFunc = "tabmlstring"
					case 16 cFunc = "tabpop"
					case 17 cFunc = "tabpush"
					case 18 cFunc = "urlencode"
					case 19 cFunc = "webprint"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class weblib_applicationclassComponentView from ComponentViewParent
	 
		Title( T_CT_WEBLIB_APPLICATIONCLASS_IP_TITLE )	
		TextBox( T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE , :value)
		ListBox( T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE2 , :value2, 
				T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE2LIST )
		TextBox( T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_WEBLIB_APPLICATIONCLASS_IP_VALUE4 , :value4)
		PageButtons()
