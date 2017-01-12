/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  File System - Visual Source File (*.pwct extension)
**	Date : 2017.01.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class VisualSourceFile

	cFileName = "application.pwct"

	oDatabase = new Database

	aStepsTable = []

	aInteractionsTable = []

	nStepsID = 0 		nInteractionsID = 0	

	func RemoveFile
		remove(cFileName)

	func Open 
		/*
			We call init() here not after oDatabase = new Database
			Because when we call close() we need init() again before open()
		*/
		oDatabase.init()
		oDatabase.Open(cFileName)

	func Close
		oDatabase.Close()

	func SetFile cFile
		cFileName = cFile

	func GetFile
		return cFileName

	func SetStepsTreeTable aData
		aStepsTable = aData

	func GetStepsTreeTable
		return aStepsTable

	func SetInteractionsTable aData
		aInteractionsTable = aData

	func GetInteractionsTable
		return aInteractionsTable

	func SetStepsID nID
		nStepsID = nID

	func GetStepsID
		return nStepsID

	func SetInteractionsID nID
		nInteractionsID = nID

	func GetInteractionsID 
		return nInteractionsID

	func CreateTables
		CreateIDsTable()
		CreateStepsTable()
		CreateInteractionsTable()

	func LoadTables
		LoadIDsTable()
		LoadStepsTable()
		LoadInteractionsTable()

	func SaveTables
		SaveIDsTable()
		SaveStepsTable()
		SaveInteractionsTable()

	func CreateStepsTable
		cSql = "CREATE TABLE STEPSTREE(
		         	STEPID 		INT 	PRIMARY KEY	NOT NULL,
		         	PARENTID 		INT 			NOT NULL,
         			NAME  			TEXT  			NOT NULL,
         			ACTIVE          		INT     			NOT NULL,
         			CODE        		TEXT,
         			INTERACTIONID        INT     			NOT NULL,
         			VISIBLE         		INT );"
		oDatabase.Execute(cSQL)

	func CreateInteractionsTable
		cSql = "CREATE TABLE INTERACTIONS(
		         	INTERACTIONID 		INT 	PRIMARY KEY	NOT NULL,
		         	TYPE 				INT 			NOT NULL,
         			COMPONENT  			TEXT  			NOT NULL,
         			DATE        			TEXT,
         			TIME        			TEXT );"
		oDatabase.Execute(cSQL)

	func CreateIDsTable
		cSql = "CREATE TABLE IDS(
		         	STEPSID		INT 		NOT NULL,
		         	INTERACTIONSID	INT 		NOT NULL );"
		oDatabase.Execute(cSQL)

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
						  :visible 	= 0+record[:visible]
					  ]
					] 
		}

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
				record[:time] 
			] 
		}

	func LoadIDsTable
		cSQL = "SELECT * FROM IDS"
		aResult = oDatabase.Execute(cSQL)
		record = aResult[1]
		nStepsID 		= 0+record[:stepsid]
		nInteractionsID 	= 0+record[:interactionsid]

	func SaveStepsTable
		cSQLAll = ""
		for record in aStepsTable {						
			cSQL = "INSERT INTO STEPSTREE (STEPID,PARENTID,NAME,ACTIVE,CODE,INTERACTIONID,VISIBLE)
         				VALUES (#{V1},#{V2},'#{V3}',#{V4},'#{V5}', #{V6},#{V7}); " + NL
			cSQL = substr(cSQL,"#{V1}", ""+record[C_TREEMODEL_NODEID]   )
			cSQL = substr(cSQL,"#{V2}", ""+record[C_TREEMODEL_PARENTID]  )
			cSQL = substr(cSQL,"#{V3}", record[C_TREEMODEL_CONTENT][:name]  )
			cSQL = substr(cSQL,"#{V4}", ""+record[C_TREEMODEL_CONTENT][:active]  )
			cSQL = substr(cSQL,"#{V5}", record[C_TREEMODEL_CONTENT][:code]  )
			cSQL = substr(cSQL,"#{V6}", ""+record[C_TREEMODEL_CONTENT][:interactionid]  )
			cSQL = substr(cSQL,"#{V7}", ""+record[C_TREEMODEL_CONTENT][:visible]  )			
			cSQLALL += cSQL					
		}
		oDatabase.Execute("begin")
		oDatabase.Execute(cSQLAll)
		oDatabase.Execute("end")

	func SaveInteractionsTable
		cSQLAll = ""		
		for record in aInteractionsTable {						
			cSQL = "INSERT INTO INTERACTIONS (INTERACTIONID,TYPE,COMPONENT,DATE,TIME)
         				VALUES (#{V1},#{V2},'#{V3}','#{V4}','#{V5}'); " + NL
			cSQL = substr(cSQL,"#{V1}", ""+record[C_INTERACTIONRECORD_ID])
			cSQL = substr(cSQL,"#{V2}", ""+record[C_INTERACTIONRECORD_TYPE])
			cSQL = substr(cSQL,"#{V3}", record[C_INTERACTIONRECORD_COMPONENT])
			cSQL = substr(cSQL,"#{V4}", record[C_INTERACTIONRECORD_DATE])
			cSQL = substr(cSQL,"#{V5}", record[C_INTERACTIONRECORD_TIME])
			cSQLAll += cSQL						
		}
		oDatabase.Execute("begin")
		oDatabase.Execute(cSQLAll)	
		oDatabase.Execute("end")

	func SaveIDsTable						
		cSQL = "INSERT INTO IDS (STEPSID,INTERACTIONSID)
         			VALUES (#{V1},#{V2}); " 
		cSQL = substr(cSQL,"#{V1}", ""+nStepsID)
		cSQL = substr(cSQL,"#{V2}", ""+nInteractionsID)						
		oDatabase.Execute(cSQL)	

