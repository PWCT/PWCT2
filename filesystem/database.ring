/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  File System - Database API
**	Date : 2017.01.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class Database

	oDatabase = new DatabaseSQLite

	func init
		oDatabase.init()

	func open cFileName
		oDatabase.Open(cFileName)

	func execute cSQL
		return oDatabase.Execute(cSQL)

	func close
		oDatabase.close()
		
