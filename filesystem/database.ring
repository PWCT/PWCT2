/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  File System - Database API
**	Date : 2017.01.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class Database

	if PWCTIsMobile(:Database) {
		oDatabase = new DatabaseSQLiteQt
	else 
		oDatabase = new DatabaseSQLite
	}

	/*
		Purpose : Init. the object
		Parameters : None
		Output : None
	*/

	func init
		oDatabase.init()

	/*
		Purpose : Open the database file
		Parameters : The file name
		Output :  None
	*/

	func open cFileName
		oDatabase.Open(cFileName)

	/*
		Purpose : Execute SQL Statement
		Parameters : The SQL Statement
		Output : Result of SQL Statement execution
	*/

	func execute cSQL
		return oDatabase.Execute(cSQL)

	/*
		Purpose : Close the database
		Parameters : None
		Output : None
	*/

	func close
		oDatabase.close()
		
