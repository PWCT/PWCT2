load "stdlib.ring"
load "guilib.ring"
try { 
	print("test"+x+"','"+"nice")
catch 
} 
import System.GUI
cName = "ring"
one()
two()three()
test(1,2)
sum(1,2,3)
see "Hello, World!"+(3*2)+cName
see "Welcome to the Ring programming language"
see "Ring is a great language!"
? "The current Ring version is Ring 1.15"
? "Hello, World!"+(3*2)+cName
if 3 = 1+2 { 
	? "True"
	? "Nice work!"
	? "Now the import feature works fine"
} 
if 1+2 = 3 { 
	? "True Answer"
} 
x = 10
while x>0 { 
	? "x = "+x
	x--
} 
x = 10
while x>0 { 
	? "x = "+x
	x--
} 
startScene =  new StartScene
while !WindowShouldClose() { 
	? :good
	exit 1
} 
if x = 1 { 
	? "one"
	elseif x = 2
		? "two"
	elseif x = 3
		? "three"
	elseif x = 4
		? "four"
	else
		? "other number"
} 
for x = 1 to 10 step 1 { 
	? x
	if x = 3 { 
		loop 1
	} 
	if x = 7 { 
		exit 1
	} 
} 
aList = [1,2,3]
for x in aList step 1 { 
	? x
} 
x = 10
do 
	? "x = "+x
	x--
again x>0
x = 3
switch x { 
	case 1
		? "One"
	case 2
		? "Two"
	case 3
		? "Three"
	else
		? "Other number"
} 
try { 
	? "Try some code"
	1/0
catch 
	? "Catch the error"
} 
import myfirstPackage
myobj = new myclass()
	 {
		myobj.myclass_m1()
		myobj.myclass_m2()
	}
myfunc = func  {
	? "test"
}
call myfunc()
myobj2 = new myclass()
	 {
		myclass_m1()
		myclass_m2()
	}
myobj3 = new myclass
	 {
		? "just a test!"
	}
myobj3 {
	? "Another test!"
}
? "Thanks"
? "End of program!"
myend()
func myend  { 
	shutdown(0)
} 
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
	if x = 1 { 
		if y = 2 { 
			if z = 3 { 
				if r = nice() { 
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
	"Enter Name: "
	give name
	? "Hello "+name
} 
func WindowShouldClose  { 
	return false
} 
class StartScene
private
package MyFirstPackage
class myparent
private
class myclass from myparent
	? "hello from myclass"
	func init  { 
		return self
	} 
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
package Application.Sales.Database
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
