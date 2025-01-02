x = 1
while x <= 10 { 
	? x
	x = x+1
}
for t = 1 to 10 step 1 { 
	if t=5 { 
		loop 1
	}
	? t
	if t=3 { 
		? "Three"
	}
	if t=7 { 
		exit 1
	}
}
