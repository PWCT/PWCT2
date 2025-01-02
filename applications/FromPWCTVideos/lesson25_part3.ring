aList = ["start","one","two","three","four","five","end"]
? aList
nIndex = find(aList,"three")
? nIndex
aList = sort(aList)
? aList
nIndex = binarysearch(aList,"two")
? nIndex
mystring = list2str(aList)
? mystring
? mystring[1]
? mystring[10]
for t = 1 to len(mystring) step 1 { 
	? mystring[t]
}
