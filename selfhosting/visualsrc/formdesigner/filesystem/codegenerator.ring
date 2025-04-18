#/*
#**	Project : Form Designer
#**	File Purpose :  Code Generator
#**	Date : 2017.04.29
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
package formdesigner
class FormDesignerCodeGenerator
	cSourceFileName
	func Generate oDesigner,cFormFileName { 
		cSourceFileName = substr(cFormFileName,"."+T_FORMDESIGNER_FILEEXTENSION,T_FORMDESIGNER_VIEWFILE)
		cFormName = GetFileNameOnlyWithoutPath(substr(cFormFileName,"."+T_FORMDESIGNER_FILEEXTENSION,""))
		cClassName = cFormName+"View"
		cClassName = PrepareClassName(cClassName)
		cClassName2 = cFormName+"Controller"
		cClassName2 = PrepareClassName(cClassName2)
		#Index start from 1
		#Add the File Header
		lIndexStartFrom1 = NOT oDesigner.oModel.FormObject().IndexTypeValue()
		cOutput = "# Form/Window View - Generated Source Code File "+nl+"# Generated by the Ring "+version()+" Form Designer"+nl+"# Date : "+date()+nl+"# Time : "+time()+nl+nl
		#Write general code to show the window
		cOutput += 'Load "stdlibcore.ring"'+nl
		if oDesigner.oModel.FormObject().GUILibraryValue() = 0 { 
			cOutput += 'Load "guilib.ring"'+nl+nl
			else
				cOutput += 'Load "lightguilib.ring"'+nl+nl
		} 
		if lIndexStartFrom1 { 
			cOutput += "import System.GUI"+nl+nl
			cOutput += "if IsMainSourceFile() { "+nl
			cOutput += char(9)+"new App {"+nl
			else
				cOutput += "if IsMainSourceFile() { "+nl
				cOutput += char(9)+"new qApp {"+nl
		} 
		cOutput += char(9)+char(9)+"StyleFusion()"+nl+char(9)+char(9)+"new "+cClassName+" { win.show() } "+nl+char(9)+char(9)+"exec()"+nl+char(9)+"}"+nl+"}"+nl+nl
		#Write the Class
		cOutput += "class "+cClassName+" from WindowsViewParent"+nl
		if lIndexStartFrom1 { 
			cOutput += char(9)+"win = new MainWindow() { "+nl
			else
				cOutput += char(9)+"win = new qMainWindow() { "+nl
		} 
		cOutput += GenerateWindowCode(oDesigner)+GenerateObjectsCode(oDesigner)+GenerateWindowCodeAfterObjects(oDesigner)+char(9)+"}"+nl+nl
		#Add the End of file
		cOutput += "# End of the Generated Source Code File..."
		cOutput = substr(cOutput,nl,WindowsNL())
		cSourceFileName = oDesigner.oFile.FileNameEncoding(cSourceFileName)
		write(cSourceFileName,cOutput)
		#Write the Controller Source File
		cSourceFileName = substr(cFormFileName,"."+T_FORMDESIGNER_FILEEXTENSION,T_FILENAME_CONTROLLER+".ring")
		GenerateControllerClassInParent(oDesigner,cSourceFileName)
		if fexists(cSourceFileName) { 
			return 
		} 
		cOutput = '# Form/Window Controller - Source Code File
		
		load "#{f1}#{f6}"
		
		#{f4}
		
		if IsMainSourceFile() {
			new #{f5} {
				StyleFusion()
				openWindow(:#{f2})
				exec()
			}
		}
		
		class #{f2} from windowsControllerParent
		
			oView = new #{f3}
		'
		cOutput = substr(cOutput,"#{f6}",T_FORMDESIGNER_VIEWFILE)
		cOutput = substr(cOutput,"#{f1}",cFormName)
		cOutput = substr(cOutput,"#{f2}",cClassName2)
		cOutput = substr(cOutput,"#{f3}",cClassName)
		if lIndexStartFrom1 { 
			cOutput = substr(cOutput,"#{f4}","import System.GUI")
			cOutput = substr(cOutput,"#{f5}","App")
			else
				cOutput = substr(cOutput,"#{f4}","")
				cOutput = substr(cOutput,"#{f5}","qApp")
		} 
		cOutput = substr(cOutput,nl,WindowsNL())
		cSourceFileName = oDesigner.oFile.FileNameEncoding(cSourceFileName)
		write(cSourceFileName,cOutput)
	} 
	func GenerateControllerClassInParent oDesigner,cSourceFileName { 
		if oDesigner.IsParent() { 
			if isMethod(oDesigner.Parent(),"generatecontrollerclass") { 
				cDir = oDesigner.Parent().GenerateControllerClass(cSourceFileName)
			} 
		} 
	} 
	func PrepareClassName cClassName { 
		cClassName = substr(cClassName," ","_")
		cClassName = substr(cClassName,"-","_")
		cClassName = substr(cClassName,".","_")
		return cClassName
	} 
	func GetFileNameOnlyWithoutPath cFileName { 
		cFN = cFileName
		nCount = 0
		for x = len(cFileName) to 1 step -1 { 
			if cFileName[x] = "/" OR cFileName[x] = "\" { 
				cFN = right(cFileName,nCount)
				exit 1
			} 
			nCount++
		} 
		return cFN
	} 
	func GenerateWindowCode oDesigner { 
		return oDesigner. oModel. FormObject() . GenerateCode( oDesigner ) 
	} 
	func GenerateWindowCodeAfterObjects oDesigner { 
		return oDesigner. oModel. FormObject() . GenerateCodeAfterObjects( oDesigner ) 
	} 
	func GenerateObjectsCode oDesigner { 
		cCode = ""
		for x = 2 to len(oDesigner.oModel.GetObjects()) step 1 { 
			oObject = oDesigner.oModel.GetObjects()[x][2]
			cCode += oObject.GenerateCode(oDesigner)
		} 
		return cCode
	} 
private
