/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  templates Component
**	Date : 2021.08.10
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class templatesComponentController from ComponentControllerParent 

	oView = new templatesComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

		
			# Get the function name in the generated code
				cFunc = T_CT_TEMPLATES_IP_VALUEFUNC [Variable(:Value)]

			switch (cFunc) {
				case :ConsoleApplicationHelloWorld
? :one
				case :ConsoleApplicationSayHello
? :two
			}
		
				

		return True 

class templatesComponentView from ComponentViewParent
	 
		Title( T_CT_TEMPLATES_IP_TITLE )	
		ListBox( T_CT_TEMPLATES_IP_VALUE , :value, 
				T_CT_TEMPLATES_IP_VALUELIST )
		PageButtons()
