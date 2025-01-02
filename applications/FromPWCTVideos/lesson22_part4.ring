aList = [5,10,11,20,3]
? aList
nMax = aList[1]
nMin = aList[1]
for t = 2 to len(aList) step 1 { 
	if aList[t] > nMax { 
		nMax = aList[t]
	}
	if aList[t] < nMin { 
		nMin = aList[t]
	}
}
See "The maximum number: "
? nMax
See "The minimum number: "
? nMin
