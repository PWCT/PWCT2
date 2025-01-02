x = 10
? x
x = x + 1
x++
? x
try { 
	? y
Catch 
	? "Oh! We have an error!"
} 
? "We have more tasks to do!"
#==================================================
see "Start : "
give nStart
see "End   : "
give nEnd
see "Step  : "
give nStep
nStart = 0+nStart
nEnd = 0+nEnd
nStep = 0+nStep
for x = nStart to nEnd step nStep { 
	? x
} 
#==================================================
for t = 1 to 10 step 1 { 
	? t
	if t = 3 { 
		? "Three"
	} 
} 
#==================================================
for x = 1 to 10 step 1 { 
	for y = 1 to 10 step 1 { 
		? "x="+x+" y="+y
		if x = 3 AND y = 5 { 
			exit 2
		} 
	} 
} 
