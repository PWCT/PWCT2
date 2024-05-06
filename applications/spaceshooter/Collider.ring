class Collider
	x
	y
	w
	h
	#Function to check if a point intersect with a rectangle
	func intersectWithPoint x,y { 
		if x >= this.x AND x <= (this.x+w) AND y >= this.y AND y <= (this.y+h) { 
			return True
		} 
		return False
	} 
private
