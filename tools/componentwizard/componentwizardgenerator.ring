/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Component Wizard Generator
**	Date : 2017.07.18
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentWizardGenerator

	cComponentName = ""
	cComponentConstant = ""

#===========================================
#===========================================
	cEmptyComponentTemplate = `

/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  #{f1} Component
**	Date : #{f2}
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

		NewStep( "" ) 
		SetStepCode("" )

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title(T_CT_#{f3}_IP_TITLE)	

		PageButtons()
`
#===========================================
#===========================================


	func setComponentName cName
		cComponentName = cName
		cComponentConstant = UPPER(cName)

	func TemplateValues cTemplate
		cTemplate = substr(cTemplate,"#{f1}",cComponentName)
		cTemplate = substr(cTemplate,"#{f2}",date())
		cTemplate = substr(cTemplate,"#{f3}",cComponentConstant)

	func EmptyComponentTemplate
		cTemplate = cEmptyComponentTemplate 
