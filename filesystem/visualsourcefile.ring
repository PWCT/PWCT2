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

	func Open cFile
		cFileName = cFile
		oDatabase.Open(cFileName)

	func Close
		oDatabase.Close()

	func SetFile cFile
		cFileName = cFile

	func GetFile
		return cFileName

	func SetStepsTable aData
		aStepsTable = aData

	func GetStepsTable
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

	func SaveTable
		SaveStepsTable()
		SaveInteractionsTable()

	func CreateStepsTable

	func CreateInteractionsTable

	func LoadStepsTable

	func LoadInteractionsTable

	func SaveStepsTable

	func SaveInteractionsTable


