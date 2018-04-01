/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Program Controller Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class ProgramController

	cFileName = C_FILENONAME 		# "noname.ring"
	cSourceCode = ""
	cCurrentDir = CurrentDir() + "/"	# The Goal Designer Folder
	cDebugBatch = "run"
	cRunBatch = "run2"
	cRunGUIBatch = "run2"

	lSetFocusToInput = False

	oState = NULL

	cWebApplicationFolder = ""


	/*
		Purpose : Debug
		Parameters : Goal Designer Object
		Output :  None
	*/

	func Debug oGD
		Prepare(oGD)	# Save the source code to the file
		if PWCTIsMobile(:RunApplication) {
			RunOnMobile(oGD)
		else
			RunBatch(cDebugBatch,"")
		}

	/*
		Purpose : Run
		Parameters : Goal Designer Object
		Output :  None
	*/

	func Run oGD
		Prepare(oGD)	# Save the source code to the file
		if PWCTIsMobile(:RunApplication) {
			RunOnMobile(oGD)
		else
			RunBatch(cRunBatch,"")
		}

	/*
		Purpose : Run GUI Application
		Parameters : goal designer object
		Output :  None
	*/

	func RunGUI oGD
		Prepare(oGD)	# Save the source code to the file
		if PWCTIsMobile(:RunApplication) {
			RunOnMobile(oGD)
		else
			RunGUIDesktop(oGD)
		}

	/*
		Purpose : Run GUI Application - Desktop
		Parameters : goal designer object
		Output :  None
	*/

	func RunGUIDesktop oGD
		oGD.parent().oView.oDockOutputWindow.raise()
		oGD.parent().oView.oProcessEditbox.setplaintext("")
		if lSetFocusToInput {
			oGD.parent().oView.oProcessText.setFocus(0)
		}
		cDir = currentdir()
		chdir(JustFilePath(cFileName))
		oGD.parent().oView.oProcess = RunProcess("ring",cFileName,oGD.parent().Method(:GetDataAction))
		chdir(cDir)

	/*
		Run web application 
	*/

	func RunInBrowser oGD
		Prepare(oGD)	# Save the source code to the file
		RunWebApplication(oGD,cFileName)

	func RunWebApplication oGD,cFile
		if isWindows() 
			if cWebApplicationFolder != JustFilePath(cFile)
				cWebApplicationFolder = JustFilePath(cFile)
				new ServerPrepare { 
					setApplicationPath(this.cWebApplicationFolder)
					PrepareConfigurationFile() 
					cServerExe = getserverExeFile()
				}	
				oGD.parent().oView.oProcess = RunProcess(cCurrentDir + "killwebserver.bat","",oGD.parent().Method(:GetDataAction))			
				oGD.parent().oView.oProcess.waitForFinished(3000)
				oWebServerProcess = RunProcess(cServerEXE,"",oGD.parent().Method(:GetDataAction))			
				sleep(3)
				oGD.parent().oView.oProcessEditbox.setplaintext("")
			ok
			new QDesktopServices {
				OpenURL(new qURL("http://localhost:8080/"+JustFileName(cFile)))
			}
		else 
			cWebURL = cFile
			nPos = substr(cWebURL,"htdocs")
			cWebURL = substr(cWebURL,nPOS+7)
			new QDesktopServices {
				OpenURL(new qURL("http://localhost/"+cWebURL))
			}
		ok

	/*
		Purpose : Run Process
		Parameters : Program, Arguments and Method for Get Data Event
		Output :  None
	*/

	func RunProcess cProgram,cArg,cGetDataFunc
		aPara = split(cArg,",")
		oStringList = new qStringlist() {
			for cPara in aPara 
				append(cPara)
			next
		}
		oProcess = new qprocess(NULL) {
			setprogram(cProgram)
			setarguments(ostringlist)
			setreadyreadstandardoutputevent(cGetDataFunc)
			start_3(QIODevice_ReadWrite)
		} 
		return oProcess

	/*
		Purpose : Run on Mobile 
		Parameters : Goal Designer Object 
		Output : None
	*/	

	func RunOnMobile oGD
		freopen("programoutput.txt","w+",stdout)
		freopen("programinput.txt","r",stdin)
		# We use runprogram.ring instead of using cFileName directly
		# Just to get more control in the future, Where we can add more code
		# Before running the program
			cCode = ""
			if PWCTIsMobile(:MobileAppLibs) {
				cCode = 'load "mobileapplibs.ring"' + nl 
			}
			cCode += 'load "' + cFileName + '"'
			write("runprogram.ring",cCode)
		oGD.EnableCheckOutputOnMobile()
		if isobject(oState) {
			ring_state_delete(oState)
		}
		oState = ring_state_new()
		ring_state_mainfile(oState,"runprogram.ring")
		oGD.DisableCheckOutputOnMobile()
		CheckOutputOnMobile(oGD)
		remove("runprogram.ring")
		remove("programoutput.txt")
		remove("programinput.txt")

	/*
		Purpose : Check output from the application when we run PWCT on Mobile
		Parameters : None 
		Output : None 
	*/

	func CheckOutputOnMobile oGD
		if fexists("programoutput.txt") {
			oGD.parent().oView.oProcessEditbox.setplaintext(read("programoutput.txt"))
			oGD.parent().oView.oDockOutputWindow.raise()
		}

		/*
			Purpose : Prepare the file
			Parameters : Goal Designer Object
			Output : None
		*/

		func Prepare oGD
			# Get the Source Code
				GetCode(oGD)
			# Save the code to the file
				SaveToFile()

	private

		/*
			Purpose : Get the Source Code
			Parameters : Goal Designer Object
			Output : the source code
		*/

		func GetCode oGD
			cSourceCode = oGD.oModel.StepsTreeCode()

		/*
			Purpose : Save to file
			Parameters : None
			Output : None
		*/

		func SaveToFile
			write(cFileName,cSourceCode)

		/*
			Purpose : Run Batch File
			Parameters : The file Name and parameters
			Output : None
		*/

		func RunBatch cFile,cPara
			if iswindows() {
				cCode = 'start '+cPara+ " " +
					cCurrentDir+cFile+' "' + cFileName + '"' + nl
			else
				cCode = 'cd $(dirname "'+cFileName+'") ; ' + ' ring "' + cFileName + '"'  + nl
			}			
			system(cCode)
