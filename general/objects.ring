/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Objects Functions
**	Date : 2016.11.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


# List of objects (Windows/Forms)
	$ObjectsList = []	# Contains sub lists [object ID , Object]

# The Object ID Counter
	$ObjectID = 0

# Variable used for Windows/Forms object name - used for setting events 
	$ObjName = ""

# The next constants for the Objects List
	C_OBJECTSLIST_ID 		= 1
	C_OBJECTSLIST_OBJECT 	= 2

/*
	The next function create new object, add the object to the $ObjectsList
	Then set $ObjName to the object in the $ObjectsList
	Then call the start() method
*/

func Open_Window cClass
	$ObjectID++
	$ObjectsList + [$ObjectID,""]	
	$ObjName = "$ObjectsList[Get_Window_Pos("+$ObjectID+")]" +
			 "[C_OBJECTSLIST_OBJECT]"
	cCode = $ObjName + " = new " + cClass + nl + 
		  $ObjName + ".start()"
	eval(cCode)	

/*
	The next function return the last window created
*/

func Last_Window
	return $ObjectsList[len($ObjectsList)][C_OBJECTSLIST_OBJECT]

/*
	The next function for using in GUI controls events
*/

func Method cMethod
	return $objname+"."+cMethod

/*
	The next function get the Window ID
	Then search in the Objects List to find the Window Item Position
*/

func Get_Window_Pos nID
	return find($ObjectsList,nID,C_OBJECTSLIST_ID)

/*
	The next class is the parent class for Windows/Forms Classes
	When you create a new class, just use from WindowsBase
	When you close the window just use Super.Close()
*/

class WindowsBase

	nID = $ObjectID

	func Close
		nPos = Get_Window_Pos(nID)
		del($ObjectsList,nPos)
