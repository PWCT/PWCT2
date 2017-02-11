/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  File System - Database API
**	Date : 2017.01.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class Database

	oDatabase = new DatabaseSQLite

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func init
		oDatabase.init()

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func open cFileName
		oDatabase.Open(cFileName)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func execute cSQL
		return oDatabase.Execute(cSQL)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func close
		oDatabase.close()
		
