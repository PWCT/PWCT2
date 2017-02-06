/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Print Component
**	Date : 2017.02.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class PrintComponentController from ComponentControllerParent 

	oView = new PrintComponentView

	func GenerateAction 

		NewStep(T_CT_PRINT_ST_PRINT + '"' + Variable(:text))  + '"' # "Print " 
		if Variable(:type) = 1 {
			SetStepCode("See " + CHAR(34) + Variable(:text) + CHAR(34) )
		else
			SetStepCode("See " + Variable(:text) )	
		}

class PrintComponentView from ComponentViewParent
	 
		Title(T_CT_PRINT_IP_TITLE)	# "Print Component"
		TextBox(T_CT_PRINT_IP_TEXT , :text)  # "Text : "
		ListBox(T_CT_PRINT_IP_TYPE, :type , T_CT_PRINT_IP_TYPELIST) # "Type :"	 ["Literal","Expression"]
		PageButtons()
