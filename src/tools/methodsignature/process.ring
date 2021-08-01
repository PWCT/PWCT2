cInput = read("input.txt")
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
	? "Count : " + len(aProcess)
	write("output.txt",cStr)

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
