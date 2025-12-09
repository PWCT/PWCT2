func main  { 
	? :Welcome
	new myclass
	new point
	{
		x = 10
		y = 20
		z = 30
		? self
		test()
	}
} 
class myclass
	func init  { 
		return self 
	} 
	func operator cOp,vValue { 
	} 
	func bracestart  { 
	} 
	func braceexpreval vValue { 
	} 
	func braceerror  { 
	} 
	func braceend  { 
	} 
private
class point
	x
	y
	z
	func test  { 
		for t = 1 to 10 step 1 { 
			? t
			if t = 3 { 
				? :three
			} 
		} 
	} 
private
