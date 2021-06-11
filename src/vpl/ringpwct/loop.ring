/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Loop Component
**	Date : 2017.07.07
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class LoopComponentController from ComponentControllerParent 

	oView = new LoopComponentView

	func GenerateAction 
								
		if NoValueMsg(:value) { return False }

		NewParentStep(T_CT_LOOP_ST_LOOP + StyleData(Variable(:value) )  )  
			SetStepCode("loop " +  Variable(:value))

		return True 

	func CheckAllowParent cParentComponentName,nParentStepNumber
		aList = GetParentsList()
		if find(aList,"forloop") or find(aList,"forinloop") or 
		   find(aList,"whileloop") or find(aList,"doagain") {
			return True
		}
		return False

class LoopComponentView from ComponentViewParent
	 
		Title(T_CT_LOOP_IP_TITLE)	
		TextBoxValue(T_CT_LOOP_IP_VALUE , :value,"1")
		PageButtons()
