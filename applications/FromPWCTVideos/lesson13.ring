aList = [1,2,3,4,5,6,7,8,9,10]
? aList
aList = 1:20
? aList
for t in aList step 1 { 
	? t
}
aList = ["one","two","three","four","five"]
? aList
for t in aList step 1 { 
	? t
}
aList = 1:5
? aList
for t in aList step 1 { 
	switch t { 
		case 1
			t = "one"
		case 2
			t = "two"
		case 3
			t = "three"
		case 4
			t = "four"
		case 5
			t = "five"
	}
}
? aList
