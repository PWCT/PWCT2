load "guilib.ring"
x = 0
test2()
load "guilib.ring"
app =  new qApp {
	w = new qMainWindow() { 
	move(400,400)
	resize(400,400)
	
		btn = new qPushButton(w) { 
		setText("close")
		move(10,10)
		resize(400,400)
		setClickEvent("test()" )
		
		}
	show()
	}
 exec() 
}
func test
	? "before"
	w2 = new qMainWindow() { 
	move(400,400)
	resize(400,400)
	setStyleSheet("background-color: purple")
	
	show()
	}
	w2.raise() 
	x++
	? "test" +x
	msginfo("wow","test "+x)
	w2.close() 
func test2
	x++
	for x = 1 to 200 step 1 { 
		w2 = new qMainWindow() { 
		move(400,400)
		resize(400,400)
		setStyleSheet("background-color: purple")
		
		show()
		}
	}
