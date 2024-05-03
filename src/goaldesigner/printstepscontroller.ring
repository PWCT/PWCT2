/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2016.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class PrintStepsController from WindowsControllerParent

	oView = new PrintStepsView

	lHideStartHere = True

	/*
		Purpose : Show the data 
		Parameters : None
		Output :  None 
	*/

	func ShowData
		cSteps = Parent().oModel.StepsTreeText()
		if lHideStartHere {
			aList = str2List(cSteps)
			nMax = len(aList)
			for t=nMax to 1 step -1 {
				cLine = aList[t]
				cLine = substr(cLine,Tab,"")
				cLine = substr(cLine,Char(13),"")
				cLine = substr(cLine,Char(10),"")
				if trim(lower(cLine)) = "start here" {
					del(aList,t)
				}
			}
			cSteps = List2Str(aList)
		}
		oView.oStepsTree.setText(cSteps)
		oView.oStepsCode.setText(Parent().oModel.StepsTreeCode())
		if isWebAssembly() {
			printer1 = new qPrinter(0) {
				setoutputformat(1)	# 1 = pdf
				setoutputfilename("StepsTree.pdf")
			}	
			oView.oStepsTree.print(printer1)
			printer1 = new qPrinter(0) {
				setoutputformat(1)	# 1 = pdf
				setoutputfilename("StepsCode.pdf")
			}
			oView.oStepsCode.print(printer1)
		}
	/*
		Purpose : Print Steps Tree 
		Parameters : None
		Output : None
	*/

	func PrintStepsTreeAction
		if isWebAssembly() {
			DownloadAction("StepsTree.pdf")
			return
		}
		printer1 = new qPrinter(0) {
			setoutputformat(1)	# 1 = pdf
			setoutputfilename("StepsTree.pdf")
		}	
		oView.oStepsTree.print(printer1)
		new QDesktopServices {
			OpenURL(new qURL("file:///"+substr(currentdir(),"\","/")+"/StepsTree.pdf")) 
		}				

	func DownloadAction cFileName
		WebAssemblyDownload(cFileName,read(cFileName))


	/*
		Purpose : Print Source Code
		Parameters : None
		Output : None 
	*/

	func PrintSourceCodeAction
		if isWebAssembly() {
			DownloadAction("StepsCode.pdf")
			return
		}
		printer1 = new qPrinter(0) {
			setoutputformat(1)	# 1 = pdf
			setoutputfilename("StepsCode.pdf")
		}
		oView.oStepsCode.print(printer1)
		new QDesktopServices {
			OpenURL(new qURL("file:///"+substr(currentdir(),"\","/")+"/StepsCode.pdf")) 
		}				


	/*
		Purpose : Key Press Action
		Parameters : None
		Output : None 
	*/

	func KeyPressAction
		if oView.oWinFilter.getKeyCode() = Qt_Key_Escape {	
			CloseAction()		
		}
