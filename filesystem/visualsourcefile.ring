/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  File System - Visual Source File (*.pwct extension)
**	Date : 2017.01.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

C_VSF_NOFILENAME = "noname.pwct"

class VisualSourceFile

	cFileName = C_VSF_NOFILENAME  # "noname.pwct"

	oDatabase = new Database

	aStepsTable = []

	aInteractionsTable = []

	nStepsID = 0 		nInteractionsID = 0	

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
		/*
			We call init() here not after oDatabase = new Database
			Because when we call close() we need init() again before open()
		*/
		oDatabase.init()
		oDatabase.Open(cFileName)

	/*
		Purpose :  Close the file
		Parameters : None
		Output : None
	*/

	func Close
		oDatabase.Close()

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
		CreateIDsTable()
		CreateStepsTable()
		CreateInteractionsTable()

	/*
		Purpose : Load Tables
		Parameters : None
		Output : None
	*/

	func LoadTables
		LoadIDsTable()
		LoadStepsTable()
		LoadInteractionsTable()

	/*
		Purpose : Save Tables
		Parameters : None
		Output : None
	*/

	func SaveTables
		SaveIDsTable()
		SaveStepsTable()
		SaveInteractionsTable()

	/*
		Purpose : Create Steps Table
		Parameters : None
		Output : None
	*/

	func CreateStepsTable
		cSql = "CREATE TABLE STEPSTREE(
		         	STEPID 		INT 	PRIMARY KEY	NOT NULL,
		         	PARENTID 		INT 			NOT NULL,
         			NAME  			TEXT  			NOT NULL,
         			ACTIVE          		INT     			NOT NULL,
         			CODE        		TEXT,
         			INTERACTIONID        INT     			NOT NULL,
         			VISIBLE         		INT ,
				STEPNUMBER		INT ,
				STEPTYPE			INT);"
		oDatabase.Execute(cSQL)

	/*
		Purpose : Create Interactions Table
		Parameters : None
		Output : None
	*/

	func CreateInteractionsTable
		cSql = "CREATE TABLE INTERACTIONS(
		         	INTERACTIONID 		INT 	PRIMARY KEY	NOT NULL,
		         	TYPE 				INT 				NOT NULL,
         			COMPONENT  		TEXT  			NOT NULL,
         			DATE        			TEXT,
         			TIME        			TEXT,
				VARIABLESVALUES	TEXT );"
		oDatabase.Execute(cSQL)

	/*
		Purpose : Create the IDs Table
		Parameters : None
		Output : None
	*/

	func CreateIDsTable
		cSql = "CREATE TABLE IDS(
		         	STEPSID		INT 		NOT NULL,
		         	INTERACTIONSID	INT 		NOT NULL );"
		oDatabase.Execute(cSQL)

	/*
		Purpose : Load the Steps Table
		Parameters : None
		Output : None
	*/

	func LoadStepsTable
		aStepsTable = []
		cSQL = "SELECT * FROM STEPSTREE"
		aResult = oDatabase.Execute(cSQL)
		for record in aResult {
			aStepsTable + [ 0+record[:stepid] , 
					  0+record[:parentid] , 
					  [
						  :name 	= record[:name] ,
						  :active 	= 0+record[:active] , 
						  :code 	= record[:code] , 
						  :interactionid = 0+record[:interactionid] ,
						  :visible 	= 0+record[:visible],
						  :stepnumber= 0+record[:stepnumber],
						  :steptype = 0+record[:steptype]
					  ]
					] 
		}

	/*
		Purpose : Load the Interactions Table
		Parameters : None
		Output : None
	*/

	func LoadInteractionsTable
		aInteractionsTable = []
		cSQL = "SELECT * FROM INTERACTIONS"
		aResult = oDatabase.Execute(cSQL)
		for record in aResult {
			aInteractionsTable + [ 
				0+record[:interactionid] , 
				0+record[:type] , 
				record[:component] ,
				record[:date] , 
				record[:time] ,
				record[:variablesvalues]
			] 
		}

	/*
		Purpose : Load the IDs Table
		Parameters : None
		Output : None
	*/

	func LoadIDsTable
		cSQL = "SELECT * FROM IDS"
		aResult = oDatabase.Execute(cSQL)
		record = aResult[1]
		nStepsID 		= 0+record[:stepsid]
		nInteractionsID 	= 0+record[:interactionsid]

	/*
		Purpose : Save the Steps Table
		Parameters : None
		Output : None
	*/

	func SaveStepsTable
		cSQLAll = ""
		for record in aStepsTable {						
			cSQL = "INSERT INTO STEPSTREE (STEPID,PARENTID,NAME,"+
			"ACTIVE,CODE,INTERACTIONID,VISIBLE,STEPNUMBER,STEPTYPE)"+
         		"VALUES (#{V1},#{V2},'#{V3}',#{V4},'#{V5}', #{V6},#{V7},#{V8},#{V9}); " + NL
			cSQL = substr(cSQL,"#{V1}", ""+record[C_TREEMODEL_NODEID]   )
			cSQL = substr(cSQL,"#{V2}", ""+record[C_TREEMODEL_PARENTID]  )
			cSQL = substr(cSQL,"#{V3}", record[C_TREEMODEL_CONTENT][:name]  )
			cSQL = substr(cSQL,"#{V4}", ""+record[C_TREEMODEL_CONTENT][:active]  )
			cSQL = substr(cSQL,"#{V5}", record[C_TREEMODEL_CONTENT][:code]  )
			cSQL = substr(cSQL,"#{V6}", ""+record[C_TREEMODEL_CONTENT][:interactionid]  )
			cSQL = substr(cSQL,"#{V7}", ""+record[C_TREEMODEL_CONTENT][:visible]  )			
			cSQL = substr(cSQL,"#{V8}", ""+record[C_TREEMODEL_CONTENT][:stepnumber]  )			
			cSQL = substr(cSQL,"#{V9}", ""+record[C_TREEMODEL_CONTENT][:steptype]  )			
			cSQLALL += cSQL					
		}
		oDatabase.Execute("begin")
		oDatabase.Execute(cSQLAll)
		oDatabase.Execute("end")

	/*
		Purpose : Save the Interactions table
		Parameters : None
		Output : None
	*/

	func SaveInteractionsTable
		cSQLAll = ""		
		for record in aInteractionsTable {						
			cSQL = "INSERT INTO INTERACTIONS (INTERACTIONID,TYPE,COMPONENT,DATE,TIME,VARIABLESVALUES)
         				VALUES (#{V1},#{V2},'#{V3}','#{V4}','#{V5}','#{V6}'); " + NL
			cSQL = substr(cSQL,"#{V1}", ""+record[C_INTERACTIONRECORD_ID])
			cSQL = substr(cSQL,"#{V2}", ""+record[C_INTERACTIONRECORD_TYPE])
			cSQL = substr(cSQL,"#{V3}", record[C_INTERACTIONRECORD_COMPONENT])
			cSQL = substr(cSQL,"#{V4}", record[C_INTERACTIONRECORD_DATE])
			cSQL = substr(cSQL,"#{V5}", record[C_INTERACTIONRECORD_TIME])
			cSQL = substr(cSQL,"#{V6}", record[C_INTERACTIONRECORD_VARIABLESVALUES])
			cSQLAll += cSQL						
		}
		oDatabase.Execute("begin")
		oDatabase.Execute(cSQLAll)	
		oDatabase.Execute("end")

	/*
		Purpose : Save the IDs Table
		Parameters : None
		Output : None
	*/

	func SaveIDsTable						
		cSQL = "INSERT INTO IDS (STEPSID,INTERACTIONSID)
         			VALUES (#{V1},#{V2}); " 
		cSQL = substr(cSQL,"#{V1}", ""+nStepsID)
		cSQL = substr(cSQL,"#{V2}", ""+nInteractionsID)						
		oDatabase.Execute(cSQL)	

