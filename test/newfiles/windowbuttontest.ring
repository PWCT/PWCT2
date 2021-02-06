	load "guilib.ring"
	myapp =  new qApp {
		win = new qMainWindow() { 
		setWindowTitle("Hello World")
		move(400,400)
		resize(400,400)
		setStyleSheet("background-color:black")
		
			lbl1 = new qLabel(win) { 
			setText("Welcome to the Ring language")
			move(10,10)
			resize(200,30)
			setStyleSheet("color: Yellow")
			
			}
			btn1 = new qPushButton(win) { 
			setText("Close The App")
			move(10,100)
			resize(100,30)
			setStyleSheet("background-color: Yellow")
			setClickEvent("myclose()")
			
			}
		show()
		}
	 exec() 
	}
	func myclose
		win.close()
