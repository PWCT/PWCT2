load "current.ring"

cInput = read("input.txt")
cInput = substr(cInput,"const char *","char *")
cInput = substr(cInput,"* ","*")
cInput += windowsnl() + "void delete(void)
object init(parent)
pointer objectpointer(void)"
aList  = str2list(cInput)

aProcess = []

func main
	for cLine in aList 
		cLine = trim(cLine)	
		if cLine != NULL 
			process(cLine)
		ok
	next
	aProcess = Sort(aProcess,2)
	cStr = "[" + nl
	x = 0
	for cLine in aProcess
		x++
		? cLine[1]
		if x = len(aProcess) 
			cStr += Tab + Char(34) + cLine[1] + Char(34) + nl
		else 
			cStr += Tab + Char(34) + cLine[1] + Char(34) + "," + nl
		ok
	next
	cStr += "]"
	write("output.txt",cStr)

	# Check the Output
	? Copy("=",50)
	? " Old List Size : " + len(aOldList)
	? " New List Size : " + len(aProcess)
	? Copy("=",50)
	x = 0
	nCount = 0
	for cLine in aProcess
		x++
		see aOldList[x] + " ---> " + cLine[2] + " : "
		if trim(cLine[2]) = trim(aOldList[x])
			see "TRUE" + nl
		else 
			nCount++
			see "FALSE" + nl
		ok
	next
	? Copy("=",50)
	if (nCount = 0) and (len(aOldList) = len(aProcess))
		? "Mapping is correct!"
	ok

	# Missing Methods
	? Copy("=",50)
	? "Missing Methods.."
	nCount = 0
	for cOld in aOldList
		if not find(aProcess,cOld,2)
			nCount++
			? cOld
		ok
	next
	if nCount = 0
		? "All methods exist!"
	ok
	? Copy("=",50)

func process cLine
	# Get Output 
	nPos  = substr(cLine, " ")
	nPos2 = substr(cLine, "(")
	cOutput = left(cLine,nPos-1)
	cFuncName = substr(cLine,nPos+1,nPos2-nPos-1)
	# Remove * in the start of function name
		if left(cFuncName,1) = "*"
			cFuncName= substr(cFuncName,2)
		ok
	# replace @ with _ 
		cFuncName = substr(cFuncName,"@","_")
	cPara = substr(cLine,nPos2)
	cSignature = cFuncName + cPara + " --> " + cOutput	
	if not find(aProcess,lower(cFuncName),2)
		aProcess + [cSignature,lower(cFuncName)]
	ok
