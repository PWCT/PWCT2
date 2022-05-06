load "guilib.ring"
oApp =  new qApp {
	win = new qMainWindow() { 
	setWindowTitle("Many Counters")
	move(10,10)
	resize(400,400)
	setStyleSheet("background-color:black;")
		aButton = list(10)
		aTarget = list(10)
		aButton2 = list(10)
		for t = 1 to 10 step 1 { 
			aButton[t] = new qPushButton(win) { 
			setText("" + t)
			move(10,10+30*t)
			resize(100,30)
			setStyleSheet("background-color:white")
			setClickEvent("hidebutton("+t+")")
			}
			aTarget[t] = t+1+random(10)
			aButton2[t] = new qPushButton(win) { 
			setText("" + aTarget[t])
			move(120,10+30*t)
			resize(100,30)
			setStyleSheet("color:white;background-color:purple ")
			setClickEvent("hidebutton("+t+")")
			}
		}
	show()
	}
exec() 
}
func hidebutton nIndex
	aButton[nIndex].settext(""+(1+aButton[nIndex].text()))
	if aButton[nIndex].text() = aButton2[nIndex].text() { 
		aButton[nIndex].setStyleSheet("background-color:yellow;")
	}
