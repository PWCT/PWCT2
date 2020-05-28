/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Test File
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "stdlib.ring"

see "Hello, World!"+(3*2)+cName
see "Welcome to the Ring programming language"
see "Ring is a great language!"
? "The current Ring version is Ring 1.12"
? "Hello, World!"+(3*2)+cName
if 3=1+2
	? "True"
	? "Nice work!"
	? "Now the import feature works fine"
ok
? "Thanks"
? "End of program!"

func one 
	? "hello from one"

func two
	? "hello from two"

func three 
	? "hello from three "

func test x,y
	? "Hello from Test!"

func sum a,b,c
	return a+b+c

func testif 
	if x = 1 
		if y = 2
			if z = 3
				if r = nice()
					? "r test"
				ok
				? "z test"
			ok
			? "y test"
		ok
		? "x test"
	ok
end 
