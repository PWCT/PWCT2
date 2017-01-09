/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  File System - Database API - SQLite
**	Date : 2017.01.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class DatabaseSQLite

	oSQLite 

	func init
		oSQLite = sqlite_init()

	func open cFileName
		SQLite_Open(oSQLite,cFileName)

	func execute cSQL
		return SQLite_Execute(oSQLite,cSQL)

	func close
		SQLite_close(oSQLite)
		
