/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  datatypeclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class datatypeclassComponentController from ComponentControllerParent 

	oView = new datatypeclassComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "isalnum"
					case 2 cFunc = "isalpha"
					case 3 cFunc = "iscntrl"
					case 4 cFunc = "isdigit"
					case 5 cFunc = "isgraph"
					case 6 cFunc = "islist"
					case 7 cFunc = "islower"
					case 8 cFunc = "isnull"
					case 9 cFunc = "isnumber"
					case 10 cFunc = "isprint"
					case 11 cFunc = "ispunct"
					case 12 cFunc = "isspace"
					case 13 cFunc = "isstring"
					case 14 cFunc = "isupper"
					case 15 cFunc = "isxdigit"
					case 16 cFunc = "type"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_DATATYPECLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class datatypeclassComponentView from ComponentViewParent
	 
		Title( T_CT_DATATYPECLASS_IP_TITLE )	
		TextBox( T_CT_DATATYPECLASS_IP_VALUE , :value)
		ListBox( T_CT_DATATYPECLASS_IP_VALUE2 , :value2, 
				T_CT_DATATYPECLASS_IP_VALUE2LIST )
		TextBox( T_CT_DATATYPECLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_DATATYPECLASS_IP_VALUE4 , :value4)
		PageButtons()
