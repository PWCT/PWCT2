/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Print Component
**	Date : 2017.02.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class PrintComponentController from ComponentControllerParent 

	oView = new PrintComponentView

	func GenerateAction 

		if Variable(:NewLine) {
			cNewLine = " + nl "
			cNewLineText = T_CT_PRINT_ST_NEWLINE 
		else
			cNewLine = ""
			cNewLineText = ""
		}

		NewStep( T_CT_PRINT_ST_PRINT + StyleData(  Variable(:text) )  + cNewLineText)

		if Variable(:type) = 1 {
			SetStepCode("See " + CHAR(34) + Variable(:text) + CHAR(34) +  cNewLine)
		else
			SetStepCode("See " + Variable(:text)  + cNewLine )	
		}

		return True 

	func TypeChangeAction
		nRow = oView.myList.CurrentRow()
		cText = oView.myText.text() 
		if  nRow = 1 and cText  = "" {		
			oView.myText.setText('" "')
		elseif  nRow = 0 and cText  = '" "'  
			oView.myText.setText("")		
		}

class PrintComponentView from ComponentViewParent
	 
		# "Print Component"
			Title(T_CT_PRINT_IP_TITLE)	
		# "Text : "
			myText = TextBox(T_CT_PRINT_IP_TEXT , :text)
		# "Type :"	 ["Literal","Expression"]
			myList = ListBox(T_CT_PRINT_IP_TYPE, :type , T_CT_PRINT_IP_TYPELIST)  {
				setCurrentItemChangedEvent( Method(:TypeChangeAction) )
			}
		# New Line 
			CheckBox(T_CT_PRINT_IP_NEWLINE,:newline) {
				setcheckstate(2)
			}
		PageButtons()
