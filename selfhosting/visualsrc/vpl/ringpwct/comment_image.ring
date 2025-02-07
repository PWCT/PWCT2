#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  comment_image Component
#**	Date : 2021.08.27
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class comment_imageComponentController from ComponentControllerParent
	oView = new comment_imageComponentView
	aAllowEmptyValue = [:Value2,:Value3]
	func GenerateAction  { 
		cValue = Variable(:Value)
		cStep = '<img src="#{PWCT_CURRENT_PATH}'+cValue+'" #{WIDTH} #{HEIGHT} #{ALIGIN}>'
		if Variable(:lValue2) { 
			cStep = substr(cStep,"#{WIDTH}","width="+Variable(:Value2))
		} 
		if Variable(:lValue3) { 
			cStep = substr(cStep,"#{HEIGHT}","height="+Variable(:Value3))
		} 
		switch Variable(:Value4) { 
			case 1
				#left
				cStep = substr(cStep,"#{ALIGIN}","align='left'")
			case 2
				#center
				cStep = substr(cStep,"#{ALIGIN}","")
				cStep = "<center>"+cStep+"</center>"
			case 3
				#right
				cStep = substr(cStep,"#{ALIGIN}","align='right'")
		} 
		StepIsAComment()
		oNode = NewStep(cStep)
		#Workaround to correctly display the mult-lines comments
		#After we edit a step and increase the number of lines
		oNode.setHidden(False)
		return True
	} 
	func CheckSyntax  { 
		return True
	} 
private
class comment_imageComponentView from ComponentViewParent
	Title(T_CT_COMMENT_IMAGE_IP_TITLE)
	TextBox(T_CT_COMMENT_IMAGE_IP_VALUE,:value)
	CheckBoxTextBox(T_CT_COMMENT_WIDTH_IP_VALUE2,:value2)
	CheckBoxTextBox(T_CT_COMMENT_HEIGHT_IP_VALUE3,:value3)
	DisableListBoxSort()
	Listbox(T_CT_COMMENT_ALIGIN_IP_VALUE4,:value4,T_CT_COMMENT_ALIGIN_IP_VALUE4_LIST)
	PageButtons()
private
