#!ring -cgi
load "weblib.ring"
import System.Web

new WebPage { 
	Div { 
		style = StyleGradient(30)
		text("Hello, World!")
	}
	H1 { 
		text("Welcome to the Ring programming language")
		style = StyleGradient(20)
		for x = 1 to 10 step 1 { 
			text(x)
			html("<br>")
		}
	}
	Table { 
		style = StyleGradient(40)
		TH { 
			text("First")
		}
		TH { 
			text("Second")
		}
		TR { 
			TD { 
				text("one")
			}
			TD { 
				text("two")
			}
		}
		TR { 
			TD { 
				text("three")
			}
			TD { 
				text("four")
			}
		}
	}
}
