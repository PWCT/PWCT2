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

	/*
		Purpose : Debug
		Parameters : Goal Designer Object
		Output :  None
	*/

	func Debug oGD
		Prepare(oGD)	# Save the source code to the file
		RunBatch(cDebugBatch,"")

	/*
		Purpose : Run
		Parameters : Goal Designer Object
		Output :  None
	*/

	func Run oGD
		Prepare(oGD)	# Save the source code to the file
		RunBatch(cRunBatch,"")

	/*
		Purpose : Run GUI Application
		Parameters : goal designer object
		Output :  None
	*/

	func RunGUI oGD
		Prepare(oGD)	# Save the source code to the file
		RunBatch(cRunGUIBatch,"/b")

	private

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
