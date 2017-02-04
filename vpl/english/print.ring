/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Print Component
**	Date : 2017.02.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class PrintComponentController from ComponentControllerParent 

	oView = new PrintComponentView

	func GenerateAction 

		NewStep("Print " + Variable(:text))
		if Variable(:type) = 1 {
			SetStepCode("See " + CHAR(34) + Variable(:text) + CHAR(34) )
		else
			SetStepCode("See " + Variable(:text) )	
		}

class PrintComponentView from ComponentViewParent
	 
		Title("Print Component")
		TextBox("Text : " , :text)
		ListBox("Type :", :type , ["Literal","Expression"])
		PageButtons()
