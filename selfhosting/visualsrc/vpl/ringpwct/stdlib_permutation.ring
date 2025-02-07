#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_permutation Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_permutationComponentController from ComponentControllerParent
	oView = new stdlib_permutationComponentView
	func GenerateAction  { 
		NewStep(T_CT_STDLIB_PERMUTATION_ST_VALUE+StepData(:Value))
		SetStepCode("permutation("+Variable(:Value)+")")
		return True
	} 
private
class stdlib_permutationComponentView from ComponentViewParent
	Title(T_CT_STDLIB_PERMUTATION_IP_TITLE)
	TextBox(T_CT_STDLIB_PERMUTATION_IP_VALUE,:value)
	PageButtons()
private
