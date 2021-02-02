/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  PWCT Main File
**	Date : 2016.10.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Load Ring Libraries
	load "stdlib.ring"

# Load General Libraries
	load "../src/general/globals/globals.ring"
	load "../src/general/mainlib.ring"
	load "../src/general/log.ring"
	
# Load the File System Files
	load "../src/filesystem/databasesqlite.ring"
	load "../src/filesystem/databasesqliteqt.ring"
	load "../src/filesystem/database.ring"
	load "../src/filesystem/visualsourcefile.ring"

# Mobile functions 
	load "../src/mobile/mobilefunctions.ring"

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
