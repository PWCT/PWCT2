	load "guilib.ring"
	? "Hello, World!"
	for t = 1 to 10 step 1 { 
		? t
		if t= 3 { 
			? "three"
		}
		test()
	}
	load "guilib.ring"
	oApp =  new qApp {
		oWin = new qMainWindow() { 
		setWindowTitle("Hello, World!")
		move(10,10)
		resize(400,400)
		setStyleSheet("background-color:purple")
		
			lbl1 = new qLabel(oWin) { 
			setText("Hello World")
			move(10,10)
			resize(200,30)
			setStyleSheet("color: White")
			
			}
			btn1 = new qPushButton(oWin) { 
			setText("Close ")
			move(100,10)
			resize(100,30)
			setStyleSheet("color:white")
			setClickEvent("oWin.close()")
			
			}
		show()
		}
	 exec() 
	}
	func test
		? "Hello from the Test function"
		p1 = new POint
			{
				x = 10
				y = 20
				z = 30
				? self
			}
	class point
		x y z
	private
