load "guilib.ring"
oApp =  new qApp {
	win = new qMainWindow() { 
setWindowTitle("Hello, World")
move(10,10)
resize(400,400)
setStyleSheet(" ")
		aLabels = list(10)
		for t = 1 to 10 step 1 { 
			aLabels[t] = new qLabel(win ) { 
setText("Time : ")
move(10,10*t*2)
resize(100,30)
setStyleSheet(" ")
			}
		}
		timer1 = new QTimer(win) { 
setinterval(1000)
settimeoutevent("mytimer()")
start()
		}
		mytimer()
	show()
}
 exec() 
}
func mytimer
	cTime = time()
	for t = 1 to 10 step 1 { 
		aLabels[t].settext("Time : " + cTime)
	}
