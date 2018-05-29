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
			/*
			exec("PRAGMA page_size = 4096;");
			exec("PRAGMA cache_size = 16384;");
			exec("PRAGMA temp_store = MEMORY;");
			exec("PRAGMA journal_mode = OFF;");
			exec("PRAGMA foreign_keys = OFF;");
			exec("PRAGMA locking_mode = EXCLUSIVE;");
			exec("PRAGMA synchronous = OFF;");
			*/
			setForwardOnly(true)		
			prepare(cSQL)	
			exec_2()
			oRecord = record()
			nMax = oRecord.count()
			aRecord = []
			for x = 1 to nMax {
				aRecord + oRecord.fieldName(x-1)
			}
			while movenext() {				
				aRow = []			
				for x = 1 to nMax {
					aRow + [
						aRecord[x],
						value(x-1).tostring()
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
