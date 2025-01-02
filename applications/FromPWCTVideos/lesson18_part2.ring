mylist = 1:10
? sumList(mylist)
mylist = [1,10,11]
? sumList(mylist)
mylist = []
do 
	? "Enter a number: "
	give nNum 
	nNum = 0 + nNum
	Add(mylist,nNum)
again nNum != 0
? sumList(mylist)
func sumList aList
	nSum = 0
	for t in aList step 1 { 
		nSum += t
	}
	return nSum
