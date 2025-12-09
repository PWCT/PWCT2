func main 
	? :Welcome
	new myclass 

	new point { x=10 y=20 z=30 ? Self test() }

class myclass 

	func init 
		return self 

	func operator cOp,vValue 

	func braceStart

	func braceExprEval vValue 

	func braceError 

	func braceEnd 

class point 

	x y z  

	func test 

		for t=1 to 10 
			? t
			if t=3 
				? :three 
			ok
		next
