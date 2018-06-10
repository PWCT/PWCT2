/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  File System - Database API - SQLite (Using Qt)
**	Date : 2017.11.19
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class DatabaseSQLiteQt

	oSQLite 

	query  

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
			exec("PRAGMA synchronous = OFF")
			exec("PRAGMA journal_mode = OFF")
		}

		query = new QSqlQuery() 

	/*
		Purpose : Execute the query
		Parameters : The SQL Statement
		Output : The Query Result
	*/

	func execute cSQL
		aResult = []
		query {			
			setForwardOnly(true)		
			exec(cSQL)
			oRecord = record()
			nMax = oRecord.count()
			aRecord = []
			for x = 1 to nMax {
				aRecord + oRecord.fieldName(x-1)
			}
			/*
				To increase the performance in this section 
				value(x-1).tostring() changed to 
				qvariant_tostring(qsqlquery_value(query.pObject,x-1))
				because value() was consuming 1ms
				Which lead to low performance when we have large files 
					, Mahmoud Fayed 
					, @performance - 2018/05/30 
			*/
			query = this.query
			while movenext() {		
				aRow = list(nMax)	
				for x = 1 to nMax {
					aRow[x] = [
						aRecord[x],
						qvariant_tostring(qsqlquery_value(query.pObject,x-1))
					]
				}
				aResult + aRow
			}
			finish()
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
