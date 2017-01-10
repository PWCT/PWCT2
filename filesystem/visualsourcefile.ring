/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  File System - Visual Source File (*.pwct extension)
**	Date : 2017.01.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class VisualSourceFile

	cFileName = "application.pwct"

	oDatabase = new Database()

	aStepsTable = []

	aInteractionsTable = []

	func Open 
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

	func CreateTables
		CreateStepsTable()
		CreateInteractionsTable()

	func LoadTables
		LoadStepsTable()
		LoadInteractionsTable()

	func SaveTables
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

	func LoadStepsTable
		aStepsTable = []
		cSQL = "SELECT * FROM STEPSTREE"
		aResult = oDatabase.Execute(cSQL)
		for record in aResult {
			aStepsTable + [ record[:interactionid] , record[:type] , record[:component] ,
					   record[:date] , record[:time] ] 
		}

	func LoadInteractionsTable
		aInteractionsTable = []
		cSQL = "SELECT * FROM INTERACTIONS"
		aResult = oDatabase.Execute(cSQL)
		for record in aResult {
			aStepsTable + [ record[:stepid] , record[:parentid] , record[:name] ,
					   record[:active] , record[:code] , record[:interactionid] ,
					   record[:visible] ] 
		}

	func SaveStepsTable
		for record in aStepsTable {
			cSQL = "INSERT INTO STEPSTREE (STEPID,PARENTID,NAME,ACTIVE,CODE,INTERACTIONID,VISIBLE)
         				VALUES (#{V1},#{V2},'#{V3}',#{V4},'#{V5}', #{V6},#{V7}); " 
			cSQL = substr(cSQL,"#{V1}", ""+record[C_TREEMODEL_NODEID]   )
			cSQL = substr(cSQL,"#{V2}", ""+record[C_TREEMODEL_PARENTID]  )
			cSQL = substr(cSQL,"#{V3}", record[C_TREEMODEL_CONTENT][:name]  )
			cSQL = substr(cSQL,"#{V4}", ""+record[C_TREEMODEL_CONTENT][:active]  )
			cSQL = substr(cSQL,"#{V5}", record[C_TREEMODEL_CONTENT][:code]  )
			cSQL = substr(cSQL,"#{V6}", ""+record[C_TREEMODEL_CONTENT][:interactionid]  )
			cSQL = substr(cSQL,"#{V7}", ""+record[C_TREEMODEL_CONTENT][:visible]  )
			oDatabase.Execute(cSQL)
		}

	func SaveInteractionsTable
		for record in aInteractionsTable {
			cSQL = "INSERT INTO INTERACTIONS (INTERACTIONID,TYPE,COMPONENT,DATE,TIME)
         				VALUES (#{V1},#{V2},'#{V3}','#{V4}','#{V5}'); " 
			cSQL = substr(cSQL,"#{V1}", ""+record[C_INTERACTIONRECORD_ID])
			cSQL = substr(cSQL,"#{V2}", ""+record[C_INTERACTIONRECORD_TYPE])
			cSQL = substr(cSQL,"#{V3}", record[C_INTERACTIONRECORD_COMPONENT])
			cSQL = substr(cSQL,"#{V4}", record[C_INTERACTIONRECORD_DATE])
			cSQL = substr(cSQL,"#{V5}", record[C_INTERACTIONRECORD_TIME])
			oDatabase.Execute(cSQL)
		}

