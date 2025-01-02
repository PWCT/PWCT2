x = 10
func main
	? "Hello, World!"
	? x
	test()
	? x
	x = 30
	test()
	? x
	try { 
		? y
	Catch 
		? "We can't access the y variable!"
	} 
func test
	? x
	x = 20
	y = 50
	? y
