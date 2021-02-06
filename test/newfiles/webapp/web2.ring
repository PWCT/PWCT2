#!ring -cgi
load "weblib.ring"
import System.Web
new webpage
	{
		text("Hello, World")
	}
