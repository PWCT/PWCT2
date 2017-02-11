/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Program Controller Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class ProgramController

	cFileName = "noname.ring"
	cSourceCode = ""
	cCurrentDir = CurrentDir() + "/"	# The Goal Designer Folder
	cDebugBatch = "run"
	cRunBatch = "run2"
	cRunGUIBatch = "run2"

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func Debug oGD
		Prepare(oGD)	# Save the source code to the file
		RunBatch(cDebugBatch,"")

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func Run oGD
		Prepare(oGD)	# Save the source code to the file
		RunBatch(cRunBatch,"")

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func RunGUI oGD
		Prepare(oGD)	# Save the source code to the file
		RunBatch(cRunGUIBatch,"/b")

	private

		/*
			Purpose : 
			Parameters :
			Output : 
		*/

		func Prepare oGD
			# Get the Source Code
				GetCode(oGD)
			# Save the code to the file
				SaveToFile()

		/*
			Purpose : 
			Parameters :
			Output : 
		*/

		func GetCode oGD
			cSourceCode = oGD.oModel.StepsTreeCode()

		/*
			Purpose : 
			Parameters :
			Output : 
		*/

		func SaveToFile
			write(cFileName,cSourceCode)

		/*
			Purpose : 
			Parameters :
			Output : 
		*/

		func RunBatch cFile,cPara
			if iswindows() {
				cCode = 'start '+cPara+ " " +
					cCurrentDir+cFile+' "' + cFileName + '"' + nl 
			else
				cCode = 'cd $(dirname "'+cFileName+'") ; ' + ' ring "' + cFileName + '"' + nl 
			}
			system(cCode)
