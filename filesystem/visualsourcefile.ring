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
		Purpose : 
		Parameters :
		Output : 
	*/

	func IsFileOpened
		if cFileName = C_VSF_NOFILENAME {
			return False
		}
		return True

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func RemoveFile
		remove(cFileName)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func Open 
		/*
			We call init() here not after oDatabase = new Database
			Because when we call close() we need init() again before open()
		*/
		oDatabase.init()
		oDatabase.Open(cFileName)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func Close
		oDatabase.Close()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SetFile cFile
		cFileName = cFile

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetFile
		return cFileName

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SetStepsTreeTable aData
		aStepsTable = aData

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetStepsTreeTable
		return aStepsTable

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SetInteractionsTable aData
		aInteractionsTable = aData

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetInteractionsTable
		return aInteractionsTable

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SetStepsID nID
		nStepsID = nID

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetStepsID
		return nStepsID

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SetInteractionsID nID
		nInteractionsID = nID

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetInteractionsID 
		return nInteractionsID

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func CreateTables
		CreateIDsTable()
		CreateStepsTable()
		CreateInteractionsTable()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func LoadTables
		LoadIDsTable()
		LoadStepsTable()
		LoadInteractionsTable()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SaveTables
		SaveIDsTable()
		SaveStepsTable()
		SaveInteractionsTable()

	/*
		Purpose : 
		Parameters :
		Output : 
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
		Purpose : 
		Parameters :
		Output : 
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
		Purpose : 
		Parameters :
		Output : 
	*/

	func CreateIDsTable
		cSql = "CREATE TABLE IDS(
		         	STEPSID		INT 		NOT NULL,
		         	INTERACTIONSID	INT 		NOT NULL );"
		oDatabase.Execute(cSQL)

	/*
		Purpose : 
		Parameters :
		Output : 
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
		Purpose : 
		Parameters :
		Output : 
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
		Purpose : 
		Parameters :
		Output : 
	*/

	func LoadIDsTable
		cSQL = "SELECT * FROM IDS"
		aResult = oDatabase.Execute(cSQL)
		record = aResult[1]
		nStepsID 		= 0+record[:stepsid]
		nInteractionsID 	= 0+record[:interactionsid]

	/*
		Purpose : 
		Parameters :
		Output : 
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
		Purpose : 
		Parameters :
		Output : 
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
		Purpose : 
		Parameters :
		Output : 
	*/

	func SaveIDsTable						
		cSQL = "INSERT INTO IDS (STEPSID,INTERACTIONSID)
         			VALUES (#{V1},#{V2}); " 
		cSQL = substr(cSQL,"#{V1}", ""+nStepsID)
		cSQL = substr(cSQL,"#{V2}", ""+nInteractionsID)						
		oDatabase.Execute(cSQL)	

