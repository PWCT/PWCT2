load "stdlib.ring"
one()
two()three()
test(1,2)
sum(1,2,3)
see "Hello, World!"+(3*2)+cname
see "Welcome to the Ring programming language"
see "Ring is a great language!"
? "The current Ring version is Ring 1.12"
? "Hello, World!"+(3*2)+cname
if 3=1+2 { 
	? "True"
	? "Nice work!"
	? "Now the import feature works fine"
} 
? "Thanks"
? "End of program!"
func one  { 
	? "hello from one"
} 
func two  { 
	? "hello from two"
} 
func three  { 
	? "hello from three "
} 
func test x,y { 
	? "Hello from Test!"
} 
func sum a,b,c { 
	return a+b+c
} 
func testif  { 
	if x=1 { 
		if y=2 { 
			if z=3 { 
				if r=nice() { 
					? "r test"
				} 
				? "z test"
			} 
			? "y test"
		} 
		? "x test"
	} 
} 
func testgive  { 
	? "Enter Name: "
	give name
	? "Hello "+name
} 
package myfirstpackage
class myclass from myparent
	? "hello from myclass"
	func myclass_m1  { 
		? "m1"
	} 
	func myclass_m2  { 
		? "m2"
	} 
private
	? "myclass - private section"
	func private_method1  { 
		? "private method 1"
	} 
	func private_method2  { 
		? "private method 2"
	} 
package application.sales.database
class human
	? "hello from human"
	func humanname  { 
		? "human name"
	} 
	func humanage  { 
		? "human age"
	} 
private
	? "human - private section"
class employee from human
	? "hello from employee"
	func employeejob  { 
		? "job"
	} 
	func salary  { 
		? "salary"
	} 
private
	func oldsalary  { 
		? "old salary"
	} 
