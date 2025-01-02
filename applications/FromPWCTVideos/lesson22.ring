x = 10
if x = 10 { 
	? "Yes"
}
x = 11
if x != 10 { 
	? "Oh, x != 10"
}
if True { 
	? "Message 1"
}
if 1 { 
	? "Message 2"
}
if False { 
	? "Message 3"
}
if 0 { 
	? "Message 4"
}
if test1() { 
	? "Test1() is executed!"
}
if test2() { 
	? "Test2() is executed!"
}
y = 11
if (x=11 and y=11) or (x=100 and y=100) { 
	? "We have a advanced condition/expression"
}
func test1
return 1
func test2
return 0
