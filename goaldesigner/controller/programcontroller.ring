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

	func Debug oGD
		Prepare(oGD)	# Save the source code to the file
		RunBatch("run","")

	func Run oGD
		Prepare(oGD)	# Save the source code to the file
		RunBatch("run2","")

	func RunGUI oGD
		Prepare(oGD)	# Save the source code to the file
		RunBatch("run2","/b")

	private

		func Prepare oGD
			# Get the Source Code
				GetCode(oGD)
			# Save the code to the file
				SaveToFile()

		func GetCode oGD
			cSourceCode = oGD.oModel.StepsTreeCode()

		func SaveToFile
			write(cFileName,cSourceCode)

		func RunBatch cFile,cPara
			if iswindows() {
				cCode = 'start '+cPara+ " " +
					cCurrentDir+cFile+' "' + cFileName + '"' + nl 
			else
				cCode = 'cd $(dirname "'+cFileName+'") ; ' + ' ring "' + cFileName + '"' + nl 
			}
			system(cCode)
