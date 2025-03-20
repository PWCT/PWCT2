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

	if isWindows() {
		cDebugBatch = CurrentDir() + "\batch\run.bat"
		cRunBatch = CurrentDir() + "\batch\run2.bat" 
	else 
		cDebugBatch = CurrentDir() + "/batch/run.sh"
		cRunBatch = CurrentDir() + "/batch/run2.sh"
	}

	lSetFocusToInput = False
	oState = NULL
	cWebApplicationFolder = ""
	lMainFile	= False
	cOutputFileText = ""
	lTestQML = False

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
			RunBatch(cDebugBatch)
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
			RunBatch(cRunBatch)
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
		cFile = cFileName
		if oGD.lFullScreen = False {
			oGD.parent().oView.oDockOutputWindow.raise()
		}
		oGD.parent().oView.oProcessEditbox.setplaintext("")
		if lSetFocusToInput {
			oGD.parent().oView.oProcessText.setFocus(0)
		}
		cDir = currentdir()
		changeFolder(JustFilePath(cFile))
		if isBatchFile(cFile) {
			cCode = RunBatchFile(cFile)
			oGD.parent().oView.oProcess = RunProcess(cCode,"",oGD.parent().Method(:GetDataAction))
		else 
			oGD.parent().oView.oProcess = RunProcess(cRingEXE,cFile,oGD.parent().Method(:GetDataAction))
		}
		changeFolder(cDir)

	/*
		Run web application 
	*/

	func checkWebApplication cFileName
		if left(read(cFileName),2) != "#!"
			msginfo("Sorry","This is not CGI web application!")
			return false 
		ok
		return true 

	func RunInBrowser oGD
		Prepare(oGD)	# Save the source code to the file
		RunWebApplication(oGD,cFileName)

	func RunWebApplication oGD,cFile
		cFile = FileNameEncoding(cFile)
		if ! checkWebApplication(cFile) { return }
		if isWindows() {
			if cWebApplicationFolder != JustFilePath(cFile)
				cWebApplicationFolder = JustFilePath(cFile)
				new ServerPrepare { 
					setApplicationPath(this.cWebApplicationFolder)
					PrepareConfigurationFile() 
					cServerExe = getserverExeFile()
				}	
				oGD.parent().oView.oProcess = RunProcess(cCurrentDir + "batch\killwebserver.bat","",oGD.parent().Method(:GetDataAction))			
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
		}

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
		if cFileName = C_FILENONAME {	# noname.ring
			cFileName = PWCT_FOLDER + "/" + C_FILENONAME
		}
		RUNTIME_FOLDER = PWCT_FOLDER + "/PWCTApp/runtime"
		# Create guilib.ring and stdlib.ring 
			changeFolder(JustFilePath(cFileName))
			write("guilib.ring","")
			write("stdlib.ring","")
			write("stdlibcore.ring","")
		changeFolder(RUNTIME_FOLDER)
		# Delete Temp. Files
			remove("runprogram.ring")
			remove("programoutput.txt")
			remove("programinput.txt")
		freopen("programoutput.txt","w+",stdout)
		freopen("programinput.txt","r",stdin)
		# We use runprogram.ring instead of using cFileName directly
		# Just to get more control in the future, Where we can add more code
		# Before running the program
			cCode = ""
			if PWCTIsMobile(:MobileAppLibs) {
				cCode = 'load "mobileapplibs.ring"' + nl  +
					 'load "mobileapplibs2.ring"' + nl + 
					 'load "mobileapplibs3.ring"' + nl 
			}
			cCode += "$cMainSourceFile = '" + cFileName + "'" + nl
			cCode += 'load "' + cFileName + '"'
			write("runprogram.ring",cCode)
		if ! isNULL(oState) {
			ring_state_delete(oState)
		}
		cOutputFileText = ""
		if lTestQML {
			oGD.parent().oView.win.hide()
			PWCT_App.processevents()
		}
		oState = ring_state_new()
		ring_state_mainfile(oState,"runprogram.ring")
		changeFolder(RUNTIME_FOLDER)
		# This will start a Timer to check the output
			oGD.EnableCheckOutputOnMobile()
		# Display the Output
			CheckOutputOnMobile(oGD)
		# Delete Temp. Files
			remove("runprogram.ring")
			remove("programinput.txt")
		# delete guilib.ring and stdlib.ring 
			changeFolder(JustFilePath(cFileName))
			remove("guilib.ring")
			remove("stdlib.ring")
			remove("stdlibcore.ring")
			remove("noname.ring")	 
		
	/*
		Purpose : Check output from the application when we run PWCT on Mobile
		Parameters : None 
		Output : None 
	*/

	func CheckOutputOnMobile oGD
		cDir = CurrentDir()
		RUNTIME_FOLDER = PWCT_FOLDER + "/PWCTApp/runtime"
		changeFolder(RUNTIME_FOLDER)
		if fexists("programoutput.txt") {
			cContent = read("programoutput.txt")
			if cContent != cOutputFileText {
				cOutputFileText = cContent
				oGD.parent().oView.oProcessEditbox.setplaintext(cContent)
				oGD.parent().oView.oDockOutputWindow.raise()
			}
		}
		changeFolder(cDir)

	/*
		Purpose : Prepare the file
		Parameters : Goal Designer Object
		Output : None
	*/

	func Prepare oGD
		nCodeGenTime = clock()
		oSystemLog.addMessage("Start of code generation")
		# Get the Source Code
			GetCode(oGD)
		# Save the code to the file
			SaveToFile(oGD)
		oSystemLog.addMessage("End of code generation")
		oSystemLog.addMessage("Code generation time (Clocks) : " + (clock()-nCodeGenTime))
		oSystemLog.addMessage("Code generation time (Seconds): " + ((clock()-nCodeGenTime)/clocksPerSecond()))

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

		func SaveToFile oGD
			cFile = oGD.oVisualSourceFile.RingFileName()
			write(FileNameEncoding(cFile),cSourceCode)

		/*
			Purpose : Run Batch File
			Parameters : The file Name and parameters
			Output : None
		*/

		func RunBatch cFile
			cFileToRun = FileNameEncoding(cFileName)
			if isWindows() {
				cDir = currentdir()
				changeFolder(exefolder())
				if ! fexists(cFileToRun) {
					cFileToRun = cDir+"\"+cFileToRun
				}
				cCode = 'start call "' +
					cFile + '" "' + cFileToRun + '"' + nl
				system(cCode)
				changeFolder(cDir)
			elseif isLinux()
				cCode = 'cd $(dirname "'+cFileToRun+'") ; x-terminal-emulator -e ' +
				 "'" + 'ring "' + cFileToRun + '" ; read -p "" key;' + "' &" + nl
				system(cCode)
			else
				cCode = 'cd $(dirname "'+cFileToRun+'") ; ' + ' ring "' + cFileToRun + '"'  + nl
				system(cCode)
			}			

		func isBatchFile cFile 
			if right(lower(trim(cFile)),4) = ".bat" or 
				right(lower(trim(cFile)),3) = ".sh"
				return True 
			ok
			return False 
	
		func RunBatchFile cFile
			if iswindows()
				changeFolder(JustFilePath(cFile))
				cCode = cFile
			else
				cCode = 'cd $(dirname "'+cFile+'") ; ' + './' + cFile +  nl
			ok
			return cCode 
