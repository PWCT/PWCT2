aList = 1:5
for x in aList step 1 { 
	switch x { 
		case 1
			x = "one"
		case 2
			x = "two"
		case 3
			x = "three"
		case 4
			x = "four"
		case 5
			x = "five"
	} 
} 
see aList
