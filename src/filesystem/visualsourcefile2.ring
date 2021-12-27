/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  File System - Visual Source File (*.pwct extension)
**	Date : 2021.02.02
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

C_VSF_NOFILENAME = "noname.pwct"
C_VSF_VERSION    = "1.0.0"

class VisualSourceFile

	cFileName = C_VSF_NOFILENAME  # "noname.pwct"

	aStepsTable = []
	aInteractionsTable = []

	nStepsID = 0 		
	nInteractionsID = 0	

	lUseSystemLog = True

	func RingFileName	
		return substr(cFileName,".pwct",".ring")


	/*
		Purpose : Check if a file is opened
		Parameters : None
		Output : True/False
	*/

	func IsFileOpened
		if cFileName = C_VSF_NOFILENAME {
			return False
		}
		return True

	/*
		Purpose : Remove file
		Parameters : The File Name
		Output : None
	*/

	func RemoveFile
		remove(cFileName)

	/*
		Purpose : Open The File
		Parameters : None
		Output :  None
	*/

	func Open 
		# Nothing to do!

	/*
		Purpose :  Close the file
		Parameters : None
		Output : None
	*/

	func Close
		aStepsTable = []
		aInteractionsTable = []
		nStepsID = 0 		
		nInteractionsID = 0	
		# We keep the cFileName, it is used for later usage 

	/*
		Purpose : Set the file name
		Parameters : The file name
		Output : None
	*/

	func SetFile cFile
		cFileName = cFile

	/*
		Purpose : Get the file name
		Parameters : None
		Output : None
	*/

	func GetFile
		return cFileName

	/*
		Purpose : Set the Steps Tree data
		Parameters : The steps tree list
		Output : None
	*/

	func SetStepsTreeTable aData
		aStepsTable = aData

	/*
		Purpose : Get the step tree data
		Parameters : None
		Output : The steps tree list
	*/

	func GetStepsTreeTable
		return aStepsTable

	/*
		Purpose : Set the Interactions
		Parameters : the Interactions list
		Output : None
	*/

	func SetInteractionsTable aData
		aInteractionsTable = aData

	/*
		Purpose : Get the Interactions Table List
		Parameters : None
		Output : The interactions table list
	*/

	func GetInteractionsTable
		return aInteractionsTable

	/*
		Purpose : Set the Steps ID (Counter)
		Parameters : the Step ID (Counter)
		Output : None
	*/

	func SetStepsID nID
		nStepsID = nID

	/*
		Purpose : Get the StepsID (Counter)
		Parameters : None
		Output : The StepsID (Counter)
	*/

	func GetStepsID
		return nStepsID

	/*
		Purpose : Set the Interactions ID (counter)
		Parameters : The Interactions ID
		Output : None
	*/

	func SetInteractionsID nID
		nInteractionsID = nID

	/*
		Purpose : Get the Interactions ID (Counter)
		Parameters : None
		Output : The Interactions ID
	*/

	func GetInteractionsID 
		return nInteractionsID

	/*
		Purpose : Create Tables
		Parameters : None
		Output : None
	*/

	func CreateTables

	/*
		Purpose : Load Tables
		Parameters : None
		Output : None
	*/

	func LoadTables
		Log("Start load tables")
		eval( read( FileNameEncoding(cFileName) ) )
		if lUseSystemLog {
			oSystemLog.addMessage("End load tables")
		}

	/*
		Purpose : Save Tables
		Parameters : None
		Output : None
	*/

	func SaveTables
		Log("Start save tables")
		cContent = "# Visual Source File 

cVisualSourceFileVersion = '#{f1}'
cVisualLanguageName      = '#{f2}'
cNaturalLanguageName     = '#{f3}'
nStepsID                 = #{f4}		
nInteractionsID          = #{f5}

aStepsTable = #{f6}

aInteractionsTable = #{f7}

# End of Visual Source File"

		cContent = substr(cContent,"#{f1}",C_VSF_VERSION)
		cContent = substr(cContent,"#{f2}",C_VPL_NAME)
		cContent = substr(cContent,"#{f3}",T_LANGUAGE)
		cContent = substr(cContent,"#{f4}",""+nStepsID)
		cContent = substr(cContent,"#{f5}",""+nInteractionsID)
		cContent = substr(cContent,"#{f6}",List2Code(aStepsTable))
		cContent = substr(cContent,"#{f7}",List2Code(aInteractionsTable))
		write( FileNameEncoding(cFileName), cContent )		
		Log("End save tables")

	/*
		Purpose : Create Steps Table
		Parameters : None
		Output : None
	*/

	func CreateStepsTable

	/*
		Purpose : Create Interactions Table
		Parameters : None
		Output : None
	*/

	func CreateInteractionsTable

	/*
		Purpose : Create the IDs Table
		Parameters : None
		Output : None
	*/

	func CreateIDsTable

	/*
		Purpose : Load the Steps Table
		Parameters : None
		Output : None
	*/

	func LoadStepsTable

	/*
		Purpose : Load the Interactions Table
		Parameters : None
		Output : None
	*/

	func LoadInteractionsTable

	/*
		Purpose : Load the IDs Table
		Parameters : None
		Output : None
	*/

	func LoadIDsTable

	/*
		Purpose : Save the Steps Table
		Parameters : None
		Output : None
	*/

	func SaveStepsTable

	/*
		Purpose : Save the Interactions table
		Parameters : None
		Output : None
	*/

	func SaveInteractionsTable	

	/*
		Purpose : Save the IDs Table
		Parameters : None
		Output : None
	*/

	func SaveIDsTable						

	/*
		Purpose : Special function for the log operation
		Parameters : Message 
		Output : None 
	*/

	func Log cMessage 
		if lUseSystemLog {
			oSystemLog.addMessage(cMessage)
		}
