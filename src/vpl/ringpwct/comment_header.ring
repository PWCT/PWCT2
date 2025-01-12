/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  comment_header Component
**	Date : 2021.08.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class comment_headerComponentController from ComponentControllerParent 

	oView = new comment_headerComponentView

	oHTML = new HTMLFunctions

	aAllowEmptyValue = [:value3,:value5]

	func GenerateAction 

		cValue = Variable(:Value)
		cValue = oHTML.HTMLSpecialChars(cValue)

		StepIsAComment()

		Switch Variable(:Value4) {
			case 1
				cHTML = "<h#{f2} style='#{f3} #{f4}'> #{f1} </h#{f2}>"
			case 2 
				cHTML = "<h#{f2} style='text-align:center ; #{f3} ; #{f4} ;'> #{f1} </h#{f2}>"
			case 3
				cHTML = "<h#{f2} style='text-align:right ; #{f3} ; #{f4} ;'> #{f1} </h#{f2}>"
		}
		cHTML = substr(cHTML,"#{f1}",cValue)
		cHTML = substr(cHTML,"#{f2}",Variable(:Value2))
		if trim(Variable(:Value3)) != NULL {
			cHTML = substr(cHTML,"#{f3}","color:"+Variable(:Value3)+";")
		else 
			cHTML = substr(cHTML,"#{f3}","")
		}
		if trim(Variable(:Value5)) != NULL {
			cHTML = substr(cHTML,"#{f4}","background-color:"+Variable(:Value5)+";")
		else 
			cHTML = substr(cHTML,"#{f4}","")
		}

		oNode = NewStep(cHTML)
		setStepCode("# "+ Variable(:value))

		# Workaround to correctly display the mult-lines comments
		# After we edit a step and increase the number of lines 
			oNode.setHidden(False)

		return True 

	func CheckSyntax
		return True

class comment_headerComponentView from ComponentViewParent
	 
		Title( T_CT_COMMENT_HEADER_IP_TITLE )
		TextBox( T_CT_COMMENT_HEADER_IP_VALUE , :value)	
		TextBoxValue( T_CT_COMMENT_HEADER_IP_VALUE2 , :value2, "3")	
		TextBoxValue( T_CT_COMMENT_HEADER_IP_VALUE3 , :value3, T_CT_COMMENT_HEADER_IP_VALUE3_DEFAULT)	
		TextBoxValue( T_CT_COMMENT_HEADER_IP_VALUE5 , :value5, T_CT_COMMENT_HEADER_IP_VALUE5_DEFAULT)	
		DisableListBoxSort()
		Listbox(T_CT_COMMENT_HEADER_ALIGIN_IP_VALUE4 , :value4, T_CT_COMMENT_HEADER_ALIGIN_IP_VALUE4_LIST) {
			setcurrentrow(1,QItemSelectionModel_Clear | QItemSelectionModel_Select)
		}
		PageButtons()
