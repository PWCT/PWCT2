	load "guilib.ring"
	load "stdlib.ring"
	See "Hello, World" + nl 
	for x = 1 to 10 step 1 { 
		See x  + nl 
		if x = 3 { 
			See "wow number there" + nl 
		}
	}
	aList = 1:10
	See aList + nl 
	great()
	func great
		load "guilib.ring"
		oApp =  new qApp {
			win1 = new qMainWindow() { 
			setWindowTitle("Hello, World")
			move(10,10)
			resize(400,400)
			setStyleSheet("background-color:purple")
			
				btn1 = new qPushButton(win1) { 
				setText("Say Hello")
				move(10,10)
				resize(100,30)
				setStyleSheet("background-color: yellow")
				setClickEvent("test()")
				
				}
			show()
			}
		 exec() 
		}
	func test
		msginfo("Hello","Welcome to my application ")
