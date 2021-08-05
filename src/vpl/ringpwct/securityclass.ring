/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  securityclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class securityclassComponentController from ComponentControllerParent 

	oView = new securityclassComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "decrypt"
					case 2 cFunc = "encrypt"
					case 3 cFunc = "md5"
					case 4 cFunc = "randbytes"
					case 5 cFunc = "sha1"
					case 6 cFunc = "sha224"
					case 7 cFunc = "sha256"
					case 8 cFunc = "sha384"
					case 9 cFunc = "sha512"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_SECURITYCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class securityclassComponentView from ComponentViewParent
	 
		Title( T_CT_SECURITYCLASS_IP_TITLE )	
		TextBox( T_CT_SECURITYCLASS_IP_VALUE , :value)
		ListBox( T_CT_SECURITYCLASS_IP_VALUE2 , :value2, 
				T_CT_SECURITYCLASS_IP_VALUE2LIST )
		TextBox( T_CT_SECURITYCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_SECURITYCLASS_IP_VALUE4 , :value4)
		PageButtons()
