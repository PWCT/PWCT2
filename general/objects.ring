/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Objects Functions
**	Date : 2016.11.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


# List of objects (Windows/Forms)
	$ObjectsList = []

# Variable used for Windows/Forms object name - used for setting events 
	$ObjName = ""

/*
	The next function create new object, add the object to the $ObjectsList
	Then set $ObjName to the object in the $ObjectsList
	Then call the start() method
*/

func Open_Window cClass
	$ObjectsList + ""
	$ObjName = "$ObjectsList[" + len($ObjectsList) + "]"
	cCode = $ObjName + " = new " + cClass + nl + 
		  $ObjName + ".start()"
	eval(cCode)

/*
	The next class is the parent class for Windows/Forms Classes
*/

class WindowsBase

	nID = len($ObjectsList)

	func Close
		del($ObjectsList,nID)
