/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Print Component
**	Date : 2017.02.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class PrintComponentController from ComponentControllerParent 

	oView = new PrintComponentView

	aAllowEmptyValue = [:text]

	func GenerateAction 

		if Variable(:type) = 2  {
			if NoValueMsg(:Text) {
				return False
			}
		}

		if Variable(:NewLine) {
			cCommand = "? "
			cNewLineText = T_CT_PRINT_ST_NEWLINE 
		else
			cCommand = "See "
			cNewLineText = ""
		}

		NewStep( T_CT_PRINT_ST_PRINT + StyleData(  Variable(:text) )  + cNewLineText)

		if Variable(:type) = 1 {
			SetStepCode(cCommand + common_literal(Variable(:text)))
		else
			SetStepCode(cCommand + Variable(:text) )	
		}

		return True 

	func TypeChangeAction
		nRow = Variable(:type)
		cText = oView.myText.text() 
		if  nRow = 2 and cText  = "" {		
			oView.myText.setText('" "')
		elseif  nRow = 1 and cText  = '" "'  
			oView.myText.setText("")		
		}

	func CheckSyntax
		if Variable(:type) = 2 {
			return checkSyntaxInVariables([:text])
		}
		return true

class PrintComponentView from ComponentViewParent
	 
		# "Print Component"
			Title(T_CT_PRINT_IP_TITLE)	
		# "Text : "
			myText = TextBox(T_CT_PRINT_IP_TEXT , :text)
		# "Type :"	 ["Literal","Expression"]
			DisableListBoxSort()
			myList = ListBox(T_CT_PRINT_IP_TYPE, :type , T_CT_PRINT_IP_TYPELIST)  {
				setCurrentItemChangedEvent( Method(:TypeChangeAction) )
			}
		# New Line 
			CheckBox(T_CT_PRINT_IP_NEWLINE,:newline) {
				setcheckstate(2)
			}
		PageButtons()
