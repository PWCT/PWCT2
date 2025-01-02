aList = [
["Koko","Male",4634643],
["Nono","Female",3523632],
["Toto","Female",3463463]
]
? aList
nSize = len(aList)
for t = 1 to nSize step 1 { 
	nSize2 = len(aList[t])
	See "["
	for t2 = 1 to nSize2 step 1 { 
		See aList[t][t2]
		if t2 != nSize { 
			See ", "
		}
	}
	? "]"
}
