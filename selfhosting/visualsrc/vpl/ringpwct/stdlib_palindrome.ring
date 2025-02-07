#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_palindrome Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_palindromeComponentController from ComponentControllerParent
	oView = new stdlib_palindromeComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_STDLIB_PALINDROME_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = palindrome("+Variable(:Value)+")")
		return True
	} 
private
class stdlib_palindromeComponentView from ComponentViewParent
	Title(T_CT_STDLIB_PALINDROME_IP_TITLE)
	TextBox(T_CT_STDLIB_PALINDROME_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_PALINDROME_IP_VALUE2,:value2)
	PageButtons()
private
