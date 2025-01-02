for t = 10 to 1 step -1 { 
	? t
}
for t = 1 to 10 step 1 { 
	See "Number : "
	See t
	See " Square: "
	? t*t
}
for t = 10 to 1 step -1 { 
	? "Number: " + t + " Square: " + (t*t)
}
for t = 1 to 10 step 1 { 
	for t2 = 1 to 10 step 1 { 
		See t2
		if t=5 and t2=10 { 
			exit 2
		}
	}
	? ""
}
