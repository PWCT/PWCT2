func SayHello
	? "Hello, World!"
func line
	? copy("=",50)
func title cTitle
	line()
	? cTitle
	line()
func Menu aList
	for cOption in aList step 1 { 
		? cOption
	}
	give nOption 
	nOption = 0 + nOption
return nOption
