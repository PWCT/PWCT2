func main
	See "hello world" + nl 
	for x = 1 to 10 step 1 { 
		See x + nl 
	}
	test()
func test
	See "hello from test" + nl 
	new point
	{
		x = 10
		y = 20
		z = 30
		print()
	}
class point
	x y z
	func print
		See self
private
