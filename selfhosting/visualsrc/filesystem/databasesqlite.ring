#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  File System - Database API - SQLite
#**	Date : 2017.01.09
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class DatabaseSQLite
	oSQLite
	#/*
	#		Purpose : Init. the object
	#		Parameters : None
	#		Output :  None
	#	*/
	func init  { 
		#/*
		#		Purpose : Open the Database
		#		Parameters : the file name
		#		Output : None
		#	*/
		oSQLite = sqlite_init()
	} 
	func open cFileName { 
		SQLite_Open(oSQLite,cFileName)
		#/*
		#		Purpose : Execute the query
		#		Parameters : The SQL Statement
		#		Output : The Query Result
		#	*/
	} 
	func execute cSQL { 
		return SQLite_Execute( oSQLite, cSQL ) 
		#/*
		#		Purpose : Close the database
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func close  { 
		SQLite_close(oSQLite)
		#/*
		#		Purpose : Begin Group of SQL Statements
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func execBegin  { 
		execute("begin")
		#/*
		#		Purpose : End Group of SQL Statements
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func execEnd  { 
		execute("end")
	} 
private
