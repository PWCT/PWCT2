AutoDecrement(10)
AutoDecrement(5)
AutoDecrement(-5)
func AutoDecrement nStart
	if nStart < 0 { 
		? "This function expect a positive number!"
		return 
	}
	See "Number: "
	? nStart
	if nStart !=0 { 
		AutoDecrement(nStart-1)
	}
