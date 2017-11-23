/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  File System - Database API - SQLite (Using Qt)
**	Date : 2017.11.19
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class DatabaseSQLiteQt

	oSQLite 


	/*
		Purpose : Init. the object
		Parameters : None
		Output :  None
	*/

	func init
		new QSqlDatabase() {
			this.oSQLite = addDatabase("QSQLITE")
		}

	/*
		Purpose : Open the Database
		Parameters : the file name
		Output : None
	*/

	func open cFileName
 		oSQLite {
			setDatabaseName(cFileName)
			Open()			
		}


	/*
		Purpose : Execute the query
		Parameters : The SQL Statement
		Output : The Query Result
	*/

	func execute cSQL
		aResult = []
		query = new QSqlQuery() {
			exec(cSQL)
			while movenext() {
				aRow = []
				oRecord = record()
				for x = 1 to oRecord.count() {
					aRow + [
						oRecord.fieldName(x-1) ,
						query.value(x-1).tostring()
					]
				}
				aResult + aRow
			}
			delete()
		}
		return aResult

	/*
		Purpose : Close the database
		Parameters : None
		Output : None
	*/

	func close
		oSQLite.Close()

	/*
		Purpose : Begin Group of SQL Statements
		Parameters : None
		Output : None
	*/
		
	func execBegin 
		execute("begin")

	/*
		Purpose : End Group of SQL Statements
		Parameters : None
		Output : None
	*/

	func execEnd
		execute("end")
