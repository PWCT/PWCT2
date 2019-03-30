/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  PWCT Main File
**	Date : 2016.10.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Load Ring Libraries
	load "stdlib.ring"

# Load General Libraries
	load "../general/globals/globals.ring"
	load "../general/mainlib.ring"
	load "../general/log.ring"
	
# Load the File System Files
	load "../filesystem/databasesqlite.ring"
	load "../filesystem/databasesqliteqt.ring"
	load "../filesystem/database.ring"
	load "../filesystem/visualsourcefile.ring"

# Mobile functions 
	load "../mobile/mobilefunctions.ring"

nMax = 1
for m=1 to nMax
	testfs()
	? "after test"
next 
input(2)

func myinput

func testfs
	? "Testing the file system"
	oFile = new visualSourceFile
	oFIle.cfilename  =  "b:\pwct2\files\performance\large5000.pwct"
	? "started"
	myinput()
	oFile.open()
	oFile.loadtables()
	aStepsTree    	=  oFile.GetStepsTreeTable()
	aInteractions 	=  oFile.GetInteractionsTable()
	nStepsIDCounter =  oFile.GetStepsID()
	? "opened"
	myinput()
	? "closed"
	oFile.close()
	myinput()
