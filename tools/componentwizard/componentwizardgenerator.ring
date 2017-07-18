/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Component Wizard Generator
**	Date : 2017.07.18
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentWizardGenerator

	cComponentName = ""
	cComponentConstant = ""

	cFolder = ""

	cEnglishData = ""
	cArabicData = ""

#===========================================
#===========================================
	cTemplateHeader = `/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  #{f1} Component
**	Date : #{f2}
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/
`
	cEmptyComponentTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

		NewStep( "" ) 
		SetStepCode("" )

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	

		PageButtons()
`
#===========================================
#===========================================

	cEmptyPageTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

		NewStep( "" ) 
		SetStepCode("" )

		return True 

	func AfterOpen 
		OkAction()

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	

		PageButtons()
`
#===========================================
#===========================================



	func setComponentName cName
		cComponentName = cName
		cComponentConstant = UPPER(cName)

	func setFolder cName 
		cFolder = cName

	func setEnglishData cData
		cEnglishData = cData

	func setArabicData cData
		cArabicData = cData

	func mydate
		aList = TimeList()
		return aList[19] + "." + aList[10] + "." + aList[6]		

	func TemplateValues cTemplate
		cTemplate = substr(cTemplate,"#{f1}",cComponentName)
		cTemplate = substr(cTemplate,"#{f2}",mydate())
		cTemplate = substr(cTemplate,"#{f3}",cComponentConstant)
		return cTemplate

	func EmptyComponentTemplate
		cTemplate = cEmptyComponentTemplate
		ProcessTemplate(cTemplate)

	func EmptyPageTemplate
		cTemplate = cEmptyPageTemplate
		ProcessTemplate(cTemplate)

	func OneTextboxTemplate

	func TwoTextboxesTemplate

	func ThreeTextboxesTemplate

	func ProcessTemplate cTemplate
		cTemplate = TemplateValues(cTemplate)
		cFile = cFolder + "/" + lower(cComponentName) 
		cFileComponent = cFile + ".ring"
		cFileEnglish = cFile + "English.ring"
		cFileArabic = cFile + "Arabic.ring"
		write(cFileComponent,cTemplate)
		aWords = split(cTemplate," ")
		aWords = filter(aWords, func cWord { 
			if left(cWord,2) = "T_" {
				return True
			}
			return False
		})
		aWordsEnglish = aWords 
		aWordsArabic = aWords
		aEnglishData = str2list(cEnglishData)
		aArabicData = str2list(cArabicData)
		nIndex = 1
		for word in aWordsEnglish {
			word += ' = "' + aEnglishData[nIndex] + '"'
			nIndex++
		}
		nIndex = 1
		for word in aWordsArabic {
			word += ' = "' + aArabicData[nIndex] + '"'
			nIndex++
		}
		cEnglishFile =  TemplateValues(cTemplateHeader) + 
					WindowsNL() + list2str(aWordsEnglish)
		cArabicFile =  TemplateValues(cTemplateHeader) + 
					WindowsNL() + list2str(aWordsArabic)
		write(cFileEnglish,cEnglishFile)
		write(cFileArabic,cArabicFile)
