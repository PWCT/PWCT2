#!ring -cgi
load "weblib.ring"
import System.Web
new page {
	text("Hello, World!")
	newline()
	for t = 1 to 10 step 1 { 
		text("Number: " + t)
		newline()
	}
}
