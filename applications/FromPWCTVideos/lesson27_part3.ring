aList = []
while True { 
	? "Enter the Programming Language name"
	give cLang 
	if cLang = NULL { 
		exit 1
	}
	? "Enter the release year"
	give nYear  
	nYear  = 0 + nYear 
	Add(aList,[cLang,nYear])
}
? "Search Operation:"
? "Enter the Programming Language name"
give cLang 
? aList[cLang]
