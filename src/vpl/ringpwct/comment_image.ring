/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  comment_image Component
**	Date : 2021.08.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class comment_imageComponentController from ComponentControllerParent 

	oView = new comment_imageComponentView

	func GenerateAction 

		cValue = Variable(:Value)

		cStep = `<img src="#{PWCT_CURRENT_PATH}` + cValue + `">`
		StepIsAComment()
		oNode = NewStep(cStep)

		# Workaround to correctly display the mult-lines comments
		# After we edit a step and increase the number of lines 
			oNode.setHidden(False)	

		return True 

	func CheckSyntax
		return True

class comment_imageComponentView from ComponentViewParent
	 
		Title( T_CT_COMMENT_IMAGE_IP_TITLE )	
		TextBox( T_CT_COMMENT_IMAGE_IP_VALUE , :value)
		PageButtons()
