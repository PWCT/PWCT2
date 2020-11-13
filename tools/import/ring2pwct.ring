load "import.ring"

? "========================================================"
? "Ring2PWCT - 2020, Mahmoud Fayed <msfclipper@yahoo.com>"
? "Usage: ring2pwct <inputfile.ring>"
? "========================================================"

aPara = GetParameters("ring2pwct")
if len(aPara) > 0 {
	cInput  = aPara[1]
	cOutput = substr(cInput,".ring",".pwct") 
	? "Input : " + cInput 
	? "Output: " + cOutput
	importFile(cInput,cOutput,C_IGNOREOUTPUT)
else
	? "No input!"
}


func GetParameters cProgramName
	aPara = sysargv
	cEXEFileName = lower(JustFileName(exefilename()))
	# Windows ---> ring.exe | ringw.exe 
	# Linux | macOS --->  ring 
	# Remove .exe from the file name 
		cEXEFileName = substr(cEXEFileName,".exe","")
	if cEXEFileName != cProgramName
		nStart = 3
	else			# ringpm.exe 
		nStart = 2
	ok
	aList = []
	if len(aPara) >= nStart
		for x = nStart to len(aPara)
			aList + aPara[x]
		next
	ok
	return aList
