/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Test File
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "stdlib.ring"
load "guilib.ring"

import System.GUI

cName = :ring
one() two() three()
test(1,2)
sum(1,2,3)
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
x = 10
while x > 0
	? "x = " + x 
	x--
end
if x = 1 
	? "one"
but x = 2
	? "two"
but x = 3
	? "three"
but x = 4
	? "four"
else 
	? "other number" 
ok
for x=1 to 10
	? x
	if x = 3 
		loop
	ok
	if x = 7
		exit 
	ok
next 
aList = [1,2,3]
for x in aList 
	? x
next

x = 10
do 
	? "x = " + x 
	x--
again x > 0

x = 3
switch x
	on 1
		? "One"
	on 2
		? "Two"
	on 3 
		? "Three"
	other 
		? "Other number"
off

try	
	? "Try some code"
	1/0
catch 
	? "Catch the error"
end

myobj = new myclass() {
	myobj.myclass_m1()
	myobj.myclass_m2()
}

myfunc = func { ? "test" }
call myfunc()

? "Thanks"
? "End of program!"

bye

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

func testgive 
	? "Enter Name: " give name 
	? "Hello " + name 

Package MyFirstPackage

class myclass from myparent 
	? "hello from myclass"
	func myclass_m1 
		? "m1"
	func myclass_m2
		? "m2"
	private 
		? "myclass - private section"
		func private_method1
			? "private method 1"
		func private_method2
			? "private method 2"

Package Application.Sales.Database

class human
	? "hello from human"
	func humanname 
		? "human name"
	func humanage
		? "human age"
	private 
		? "human - private section"
class employee from human 
	? "hello from employee"
	func employeejob
		? "job"
	func salary
		? "salary"
	private 
		func oldsalary
			? "old salary"
