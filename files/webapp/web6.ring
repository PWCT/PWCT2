#!ring -cgi
load "weblib.ring"
import System.Web

new WebPage { 
	text("Hello, World!")
}
