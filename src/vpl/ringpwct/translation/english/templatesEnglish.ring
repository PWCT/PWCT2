/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  templates Component
**	Date : 2021.08.10
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


T_CT_TEMPLATES_IP_TITLE = "Templates Component"
T_CT_TEMPLATES_IP_VALUE = "Template"
T_CT_TEMPLATES_IP_VALUE2 = "No Comments"
T_CT_TEMPLATES_IP_VALUELIST = [
	"Hello World",
	"Say Hello",
	"Variables",
	"Deep Copy",
	"Implicit Conversion",
	"Operators Precedence",
	"Loop and Condition",
	"Main Menu",
	"Dynamic Loop",
	"Modify lists using Loop",
	"Exit from two loops",
	"The Loop Command",
	"Short-circuit evaluation"
]

T_CT_TEMPLATES_IP_VALUECODE = [
`
	//
	// Hello
	// Welcome to the Programming World!
	// In this lesson we will create our first program
	// From the Components Browser and using the (Print) Component 
	// We will print a "Hello, World!" message on the Screen
	//
	? "Hello, World!"
`,
`
	//
	// In the next steps we asks the User to enter his/her name
	// Then we print the "Hello" Message then the User Name
	//
	// Using the Components Browser
	// To print messages we will use the (Print) component
	// To get input from the User we will use the (Get Input) component
	//
	? "Enter your name?" 
	give cName 
	? "Hello " + cName
`,
`
	#
	# x is a string
	x = "Hello" 
	? x 
	#
	# x is a number (int)
	x = 5                   
	? x 
	# x is a number (double)
	x = 1.2                 
	? x 
	#
	# x is a list
	x = [1,2,3,4]           
	# print list items
	? x
	#
	# x is a string contains date                   
	x = date()              
	? x 
	#
	# x is a string contains time
	x = time()              
	? x 
	# x is a number (logical value = 1)
	x = true                
	? x 
	#
	# x is a number (logical value = 0)
	x = false               
	? x 
`,
`
	#
	# We can use the assignment operator ‘=’ to copy variables.
	# We can do that to copy values like strings & numbers. 
	# Also, we can copy complete lists & objects. 
	# The assignment operator will do a complete duplication for us. 
	# This operation called Deep Copy
	#
	list = [1,2,3,"four","five"]
	list2 = list
	list = []
	# print the first list - no items to print
	? list        
	#
	? "********" 
	#
	# print the second list - contains 5 items
	? list2       
`,
`
	#
	# The language can automatically convert between numbers and strings.
	#
	# NUMBER + STRING is NUMBER
	# STRING + NUMBER is STRING
	#
	# The same operator "+" can be used as an arithmetic operator 
	# Or for string concatenation.
 	#
	# x is a number
	x = 10                  
	#
	# y is a string
	y = "20"       
	#
	# sum is a number (y will be converted to a number) 
	sum = x + y          
	#
	# Msg is a string (sum will be converted to a string)   
	Msg = "Sum = " + sum    
	? Msg 
`,
`
	# 
	# Example about operators precedence
	#
	# The output will be : 23
	See 3+5*4       
`,
`
	//
	// In the next steps we create a loop that count from one to ten
	// We print each number on the Screen 
	// Also we print a special message when we reach number Three
	//
	for t=1 to 10
		? t
		if t=3 
			? "Three"
		ok
	next
`,
`
	#
	# We will learn how to create a Main Menu
	# Using a While loop and a Switch statement
	#
	While True
	? ""
        ? "Main Menu"
	? "--------------"
	? "(1) Say Hello"
	? "(2) About"
	? "(3) Exit" 
	? ""
	Give nOption
        Switch nOption
        On 1
                ? "Hello!"
        On 2
                ? "Just a simple program!" 
        On 3
		? "End of program!"
                Bye
        Other
                ? "bad option..."
        Off
	End
`,
`
	#
	# Dynamic loop
	#
	see "Start : " give nStart
	see "End   : " give nEnd
	see "Step  : " give nStep
	#
	For x = nStart to nEnd Step nStep
	        ? x
	Next
`,
`
	#
	# Create list contains numbers from 1 to 5
	aList = 1:5
	#
	# Replace list numbers with strings
	for x in aList
	        switch x
        	on 1  x = "one"
	        on 2  x = "two"
        	on 3  x = "three"
	        on 4  x = "four"
        	on 5  x = "five"
	        off
	next
	#
	# Print the list items
	see aList       

`,
`
	#
	# In this example we will create two loops
	# Then we will use the Exit command 
	# To exit from these two loops together
	#

	for x = 1 to 10
	        for y = 1 to 10
	                ? "x=" + x + " y=" + y 
	                if x = 3 and y = 5
				# Exit from 2 loops
	                        exit 2     
	                ok
	        next
	next

`,
`
	#
	# Using the Loop command inside a For Loop
	#
	for x = 1 to 10
	        if x = 3
	                ? "Number Three" 
	                loop
	        ok
	        ? x
	next

`,
`
	#
	# Short-circuit evaluation
	#
	x = 0 y = 10
	#
	? "Test 1"
	if (x = 0 and nice()) and (y = 10 and nice())
	        ? "Great" 
	ok
	#
	? "Test 2"
	if (x = 1 and nice()) and (y = 10 and nice())
	        ? "Great" 
	ok
	#
	? "Test 3"
	if (x = 0 and nice()) or (y = 10 and nice())
	        ? "Great" 
	ok
	#
	func nice  ? "Nice" return 1

`
]
