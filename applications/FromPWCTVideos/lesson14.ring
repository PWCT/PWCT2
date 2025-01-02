# Using the Do Again Loop
#==================================================
x = 10
do 
	? x
	x = x-1
again x > 0
? "======="
#==================================================
x = 0
do 
	? x
	x = x-1
again x > 0
? "======="
#==================================================
do 
	? "Enter number greater than 10 "
	give x 
	x = 0 + x
again x <= 10
? "Thanks for entering a number greater than 10"
