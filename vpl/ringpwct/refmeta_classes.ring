/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_classes Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_classesComponentController from ComponentControllerParent 

	oView = new refmeta_classesComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_REFMETA_CLASSES_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "classes()" )
		
		

		return True 

class refmeta_classesComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_CLASSES_IP_TITLE )	
		TextBox( T_CT_REFMETA_CLASSES_IP_VALUE , :value)
		PageButtons()
