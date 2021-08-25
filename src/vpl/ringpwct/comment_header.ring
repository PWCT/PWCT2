/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  comment_header Component
**	Date : 2021.08.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class comment_headerComponentController from ComponentControllerParent 

	oView = new comment_headerComponentView

	oHTML = new HTMLFunctions

	aAllowEmptyValue = [:value3]

	func GenerateAction 

		cValue = Variable(:Value)
		cValue = oHTML.HTMLSpecialChars(cValue)

		StepIsAComment()

		if Variable(:Value4) {
			cHTML = "<h#{f2} style='text-align:center ; color:#{f3} ;'> #{f1} </h#{f2}>"
		else 
			cHTML = "<h#{f2} style='color:#{f3}'> #{f1} </h#{f2}>"
		}
		cHTML = substr(cHTML,"#{f1}",cValue)
		cHTML = substr(cHTML,"#{f2}",Variable(:Value2))
		cHTML = substr(cHTML,"#{f3}",Variable(:Value3))

		oNode = NewStep(cHTML)
		setStepCode("# "+ Variable(:value))

		# Workaround to correctly display the mult-lines comments
		# After we edit a step and increase the number of lines 
			oNode.setHidden(False)

		return True 

class comment_headerComponentView from ComponentViewParent
	 
		Title( T_CT_COMMENT_HEADER_IP_TITLE )
		TextBox( T_CT_COMMENT_HEADER_IP_VALUE , :value)	
		TextBoxValue( T_CT_COMMENT_HEADER_IP_VALUE2 , :value2, "2")	
		TextBoxValue( T_CT_COMMENT_HEADER_IP_VALUE3 , :value3, T_CT_COMMENT_HEADER_IP_VALUE3_DEFAULT)	
		CheckBoxValue( T_CT_COMMENT_HEADER_IP_VALUE4, :Value4, 0)
		PageButtons()
