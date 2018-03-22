#!ring -cgi
load "weblib.ring"
import System.Web

new page
	{
		text("Hello, World")
		h1("Hello")
		h2("Hello")
		h3("Hello")
		h4("Hello")
		h5("Hello")
		h6("Hello")
		list2ul(1:10)
	}
