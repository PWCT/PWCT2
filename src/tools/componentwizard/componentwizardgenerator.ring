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

	cStepsTree = ""

#===========================================
#===========================================
	cTemplateHeader = `/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  #{f1} Component
**	Date : #{f2}
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/
`

#===========================================
#===========================================

	cEmptyComponentTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

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

#{f4}

		return True 

	func AfterOpen 
		OkAction()

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	

		PageButtons()
`
#===========================================
#===========================================

	cOneTextBoxTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		TextBox( T_CT_#{f3}_IP_VALUE , :value)
		PageButtons()
`
#===========================================
#===========================================

	cTwoTextBoxesTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		TextBox( T_CT_#{f3}_IP_VALUE , :value)
		TextBox( T_CT_#{f3}_IP_VALUE2 , :value2)
		PageButtons()
`
#===========================================
#===========================================

	cThreeTextBoxesTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		TextBox( T_CT_#{f3}_IP_VALUE , :value)
		TextBox( T_CT_#{f3}_IP_VALUE2 , :value2)
		TextBox( T_CT_#{f3}_IP_VALUE3 , :value3)
		PageButtons()
`
#===========================================
#===========================================


	cFourTextBoxesTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		TextBox( T_CT_#{f3}_IP_VALUE , :value)
		TextBox( T_CT_#{f3}_IP_VALUE2 , :value2)
		TextBox( T_CT_#{f3}_IP_VALUE3 , :value3)
		TextBox( T_CT_#{f3}_IP_VALUE4 , :value4)
		PageButtons()
`
#===========================================
#===========================================


	cFiveTextBoxesTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		TextBox( T_CT_#{f3}_IP_VALUE , :value)
		TextBox( T_CT_#{f3}_IP_VALUE2 , :value2)
		TextBox( T_CT_#{f3}_IP_VALUE3 , :value3)
		TextBox( T_CT_#{f3}_IP_VALUE4 , :value4)
		TextBox( T_CT_#{f3}_IP_VALUE5 , :value5)
		PageButtons()
`
#===========================================
#===========================================


	c6TextBoxesTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		TextBox( T_CT_#{f3}_IP_VALUE , :value)
		TextBox( T_CT_#{f3}_IP_VALUE2 , :value2)
		TextBox( T_CT_#{f3}_IP_VALUE3 , :value3)
		TextBox( T_CT_#{f3}_IP_VALUE4 , :value4)
		TextBox( T_CT_#{f3}_IP_VALUE5 , :value5)
		TextBox( T_CT_#{f3}_IP_VALUE6 , :value6)
		PageButtons()
`
#===========================================
#===========================================

	c7TextBoxesTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		TextBox( T_CT_#{f3}_IP_VALUE , :value)
		TextBox( T_CT_#{f3}_IP_VALUE2 , :value2)
		TextBox( T_CT_#{f3}_IP_VALUE3 , :value3)
		TextBox( T_CT_#{f3}_IP_VALUE4 , :value4)
		TextBox( T_CT_#{f3}_IP_VALUE5 , :value5)
		TextBox( T_CT_#{f3}_IP_VALUE6 , :value6)
		TextBox( T_CT_#{f3}_IP_VALUE7 , :value7)
		PageButtons()
`
#===========================================
#===========================================

	c8TextBoxesTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		TextBox( T_CT_#{f3}_IP_VALUE , :value)
		TextBox( T_CT_#{f3}_IP_VALUE2 , :value2)
		TextBox( T_CT_#{f3}_IP_VALUE3 , :value3)
		TextBox( T_CT_#{f3}_IP_VALUE4 , :value4)
		TextBox( T_CT_#{f3}_IP_VALUE5 , :value5)
		TextBox( T_CT_#{f3}_IP_VALUE6 , :value6)
		TextBox( T_CT_#{f3}_IP_VALUE7 , :value7)
		TextBox( T_CT_#{f3}_IP_VALUE8 , :value8)
		PageButtons()
`
#===========================================
#===========================================

	c9TextBoxesTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		TextBox( T_CT_#{f3}_IP_VALUE , :value)
		TextBox( T_CT_#{f3}_IP_VALUE2 , :value2)
		TextBox( T_CT_#{f3}_IP_VALUE3 , :value3)
		TextBox( T_CT_#{f3}_IP_VALUE4 , :value4)
		TextBox( T_CT_#{f3}_IP_VALUE5 , :value5)
		TextBox( T_CT_#{f3}_IP_VALUE6 , :value6)
		TextBox( T_CT_#{f3}_IP_VALUE7 , :value7)
		TextBox( T_CT_#{f3}_IP_VALUE8 , :value8)
		TextBox( T_CT_#{f3}_IP_VALUE9 , :value9)
		PageButtons()
`
#===========================================
#===========================================



	cTextListTextTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		TextBox( T_CT_#{f3}_IP_VALUE , :value)
		ListBox( T_CT_#{f3}_IP_VALUE2 , :value2, 
				T_CT_#{f3}_IP_VALUE2LIST )
		TextBox( T_CT_#{f3}_IP_VALUE3 , :value3)
		PageButtons()
`
#===========================================
#===========================================


	cTextListTextTextTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		TextBox( T_CT_#{f3}_IP_VALUE , :value)
		ListBox( T_CT_#{f3}_IP_VALUE2 , :value2, 
				T_CT_#{f3}_IP_VALUE2LIST )
		TextBox( T_CT_#{f3}_IP_VALUE3 , :value3)
		TextBox( T_CT_#{f3}_IP_VALUE4 , :value4)
		PageButtons()
`
#===========================================
#===========================================

	cListTemplate = cTemplateHeader + `
class #{f1}ComponentController from ComponentControllerParent 

	oView = new #{f1}ComponentView

	func GenerateAction 

#{f4}

		return True 

class #{f1}ComponentView from ComponentViewParent
	 
		Title( T_CT_#{f3}_IP_TITLE )	
		ListBox( T_CT_#{f3}_IP_VALUE , :value, 
				T_CT_#{f3}_IP_VALUE2LIST )
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

	func setStepsTree cSteps
		cStepsTree = cSteps
		aStepsTree = str2list(cStepsTree)
		for x in aStepsTree {
			x = CHAR(9) + CHAR(9) + x
		}
		cStepsTree = list2str(aStepsTree)

	func mydate
		aList = TimeList()
		return aList[19] + "." + aList[10] + "." + aList[6]		

	func TemplateValues cTemplate
		cTemplate = substr(cTemplate,"#{f1}",cComponentName)
		cTemplate = substr(cTemplate,"#{f2}",mydate())
		cTemplate = substr(cTemplate,"#{f3}",cComponentConstant)
		cTemplate = substr(cTemplate,"#{f4}",cStepsTree)
		return cTemplate

	func EmptyComponentTemplate
		cTemplate = cEmptyComponentTemplate
		ProcessTemplate(cTemplate)

	func EmptyPageTemplate
		cTemplate = cEmptyPageTemplate
		ProcessTemplate(cTemplate)

	func OneTextboxTemplate
		cTemplate = cOneTextBoxTemplate
		ProcessTemplate(cTemplate)

	func TwoTextboxesTemplate
		cTemplate = cTwoTextBoxesTemplate
		ProcessTemplate(cTemplate)

	func ThreeTextboxesTemplate
		cTemplate = cThreeTextBoxesTemplate
		ProcessTemplate(cTemplate)

	func FourTextboxesTemplate
		cTemplate = cFourTextBoxesTemplate
		ProcessTemplate(cTemplate)

	func FiveTextboxesTemplate
		cTemplate = cFiveTextBoxesTemplate
		ProcessTemplate(cTemplate)

	func SixTextboxesTemplate
		cTemplate = c6TextBoxesTemplate
		ProcessTemplate(cTemplate)

	func SevenTextboxesTemplate
		cTemplate = c7TextBoxesTemplate
		ProcessTemplate(cTemplate)

	func EightTextboxesTemplate
		cTemplate = c8TextBoxesTemplate
		ProcessTemplate(cTemplate)

	func NineTextboxesTemplate
		cTemplate = c9TextBoxesTemplate
		ProcessTemplate(cTemplate)

	func TextListTextTemplate
		cTemplate = cTextListTextTemplate
		ProcessTemplate(cTemplate)

	func TextListTextTextTemplate
		cTemplate = cTextListTextTextTemplate
		ProcessTemplate(cTemplate)

	func OneListboxTemplate
		cTemplate = cListTemplate
		ProcessTemplate(cTemplate)

	func ProcessTemplate cTemplate
		cTemplate = TemplateValues(cTemplate)
		cFile = cFolder + "/" + lower(cComponentName) 
		cFileComponent = cFile + ".ring"
		cFileEnglish = cFolder + "/translation/english/" + lower(cComponentName) + "English.ring"
		cFileArabic = cFolder + "/translation/arabic/" + lower(cComponentName) + "Arabic.ring"
		cFileComponent = substr(cFileComponent,nl,Windowsnl())
		write(cFileComponent,cTemplate)
		# We will reverse the classes (User Interface will be first)
		# So we can get Interaction Page constants first	
		# Then the Steps Tree Constants 
			nPos = substr(cTemplate,"ComponentViewParent")
			cWordsTemplate = substr(cTemplate,nPos) +
						substr(cTemplate,1,nPos)
		aWords = split(cWordsTemplate," ")
		aWords = filter(aWords, func cWord { 
			if left(cWord,2) = "T_" {
				return True
			}
			return False
		})
		# Remove duplicates 
			aWords2 = aWords 
			aWords = []
			for x in aWords2 {
				if not find(aWords,x) {
					aWords + x
				}
			}
		aWordsEnglish = aWords 
		aWordsArabic = aWords
		aEnglishData = str2list(cEnglishData)
		aArabicData = str2list(cArabicData)
		nIndex = 1
		for word in aWordsEnglish {
			if nIndex <= len(aEnglishData) {
				cValue = aEnglishData[nIndex]
			else
				cValue = ""
			}
			if startswith(cValue,"[") and Endswith(cValue,"]") {
				word += ' = ' + cValue
			else
				word += ' = "' + cValue + '"'
			}
			nIndex++
		}
		nIndex = 1
		for word in aWordsArabic {
			if nIndex <= len(aArabicData) {
				cValue = aArabicData[nIndex]
			else
				cValue = ""
			}
			if startswith(cValue,"[") and Endswith(cValue,"]") {
				word += ' = ' + cValue 
			else
				word += ' = "' + cValue + '"'
			}
			nIndex++
		}
		cEnglishFile =  TemplateValues(cTemplateHeader) + 
					WindowsNL() + list2str(aWordsEnglish)
		cArabicFile =  TemplateValues(cTemplateHeader) + 
					WindowsNL() + list2str(aWordsArabic)
		cEnglishFile = substr(cEnglishFile,nl,Windowsnl())
		cArabicFile = substr(cArabicFile,nl,Windowsnl())
		write(cFileEnglish,cEnglishFile)
		write(cFileArabic,cArabicFile)

		# Update useenglish.ring and usearabic.ring 
		# To load translation files 

		cUseEnglishFile = cFolder + "/translation/useenglish.ring"
		cUseArabicFile = cFolder + "/translation/usearabic.ring"
		cUseEnglish = read(cUseEnglishFile)
		cUseArabic = read(cUseArabicFile)

		cAddUseEnglish = 'load "english/' + lower(cComponentName)  + 'English.ring"'
		cAddUseArabic = 'load "arabic/' + lower(cComponentName)  + 'Arabic.ring"'

		if not substr(cUseEnglish,cAddUseEnglish) {
			cUseEnglish += WindowsNl() + cAddUseEnglish
			Write(cUseEnglishFile,cUseEnglish)
		}

		if not substr(cUseArabic,cAddUseArabic) {
			cUseArabic += WindowsNl() + cAddUseArabic
			Write(cUseArabicFile,cUseArabic)
		}
