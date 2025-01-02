checkVar(123)
checkVar("HELLO")
checkVar([1,2,3,"FOUR","FIVE"])
checkVar(NULL)
func checkVar value
	cType = type(value)
	lList = islist(value)
	lNull = isnull(value)
	lNumber = isnumber(value)
	lString = isstring(value)
	? cType
	? lString
	? lNumber
	? lList
	? lNull
