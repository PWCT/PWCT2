first()
second()
sum(3,5)
sum(1000,2000)
? fact(5)
if novalue() = NULL { 
	? "the NoValue() function doesn't return a value"
} 
func first  { 
	? "message from the first function"
} 
func second  { 
	? "message from the second function"
} 
func sum x,y { 
	? x+y
} 
func fact x { 
	if x = 0 { 
		return 1
		else
			return x*fact(x-1)
	} 
} 
func novalue  { 
} 
