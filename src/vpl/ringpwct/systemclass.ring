/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  systemclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class systemclassComponentController from ComponentControllerParent 

	oView = new systemclassComponentView

	aAllowEmptyValue = [:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "filename"
					case 2 cFunc = "isandroid"
					case 3 cFunc = "isfreebsd"
					case 4 cFunc = "islinux"
					case 5 cFunc = "ismacosx"
					case 6 cFunc = "ismsdos"
					case 7 cFunc = "isunix"
					case 8 cFunc = "iswindows"
					case 9 cFunc = "iswindows64"
					case 10 cFunc = "sysargv"
					case 11 cFunc = "sysget"
					case 12 cFunc = "system"
					case 13 cFunc = "windowsnl"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_SYSTEMCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class systemclassComponentView from ComponentViewParent
	 
		Title( T_CT_SYSTEMCLASS_IP_TITLE )	
		TextBox( T_CT_SYSTEMCLASS_IP_VALUE , :value)
		ListBox( T_CT_SYSTEMCLASS_IP_VALUE2 , :value2, 
				T_CT_SYSTEMCLASS_IP_VALUE2LIST )
		TextBox( T_CT_SYSTEMCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_SYSTEMCLASS_IP_VALUE4 , :value4)
		PageButtons()
