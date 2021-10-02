/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  templates Component
**	Date : 2021.08.10
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class templatesComponentController from ComponentControllerParent 

	oView = new templatesComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

			# Get the template code
				if Variable(:Value2) {
					# Remove comments 
					cTemplateCode = removeComments( T_CT_TEMPLATES_IP_VALUECODE [Variable(:Value)] )
				else 
					cTemplateCode = T_CT_TEMPLATES_IP_VALUECODE [Variable(:Value)]	
				}

			# Convert the code to the Steps Tree 			
				Ring2PWCT(cTemplateCode)			

		return True 

	func removeComments cCode 
		aCodeLines = str2List(cCode)
		aCode = []
		for cLine in aCodeLines {
			if not isComment(cLine) {
				aCode + cLine
			}
		}
		return list2Str(aCode)

	func isComment cLine
		while left(cLine,1) = " " or left(cLine,1) = Tab {
			cLine = substr(cLine,2)
		}
		return left(cLine,1) = "#" or left(cLine,2) = "//" 			

class templatesComponentView from ComponentViewParent
	 
		Title( T_CT_TEMPLATES_IP_TITLE )
		DisableListBoxSort()	
		ListBox( T_CT_TEMPLATES_IP_VALUE , :value, 
				T_CT_TEMPLATES_IP_VALUELIST )
		CheckBoxValue( T_CT_TEMPLATES_IP_VALUE2, :value2, 2)
		PageButtons()
