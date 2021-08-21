/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  comment_header Component
**	Date : 2021.08.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class comment_headerComponentController from ComponentControllerParent 

	oView = new comment_headerComponentView

	aAllowEmptyValue = [:value3]

	func GenerateAction 

		StepIsAComment()

		cHTML = "<h#{f2} style='color:#{f3}'> #{f1} </h#{f2}>"
		cHTML = substr(cHTML,"#{f1}",Variable(:Value))
		cHTML = substr(cHTML,"#{f2}",Variable(:Value2))
		cHTML = substr(cHTML,"#{f3}",Variable(:Value3))

		oNode = NewStep(cHTML)
		setStepCode("# "+ Variable(:value))

		return True 

class comment_headerComponentView from ComponentViewParent
	 
		Title( T_CT_COMMENT_HEADER_IP_TITLE )
		TextBox( T_CT_COMMENT_HEADER_IP_VALUE , :value)	
		TextBoxValue( T_CT_COMMENT_HEADER_IP_VALUE2 , :value2, "1")	
		TextBoxValue( T_CT_COMMENT_HEADER_IP_VALUE3 , :value3, T_CT_COMMENT_HEADER_IP_VALUE3_DEFAULT)	
		PageButtons()
