# Author : Gal Zsolt
	load "stdlibcore.ring"
	load "lightguilib.ring"
	C_GAMETITLE = "2048 Game"
	C_WINDOWBACKGROUND = "background-color: gray;"
	C_LABELFONTSIZE = "font-size:50px;"
	C_BUTTONFONTSIZE = "font-size:80px;"
	C_PLAYERSCORESTYLE = "color:white;background-color:rgb(50,50,50);border-radius:17px;"+C_LABELFONTSIZE
	C_NEWGAMESTYLE = "color:white;background-color:rgb(50,50,50);border-radius:17px;"+C_LABELFONTSIZE
	C_EMPTYBUTTONSTYLE = "border-radius:17px;background-color:silver;"+C_BUTTONFONTSIZE
	C_BUTTON2STYLE = "border-radius:17px;color:black; background-color: yellow ;"+C_BUTTONFONTSIZE
	C_BUTTON4STYLE = "border-radius:17px;color:black; background-color: violet ;"+C_BUTTONFONTSIZE
	C_BUTTON8STYLE = "border-radius:17px;color:white; background-color: purple ;"+C_BUTTONFONTSIZE
	C_BUTTON16STYLE = "border-radius:17px;color:white; background-color: blue ;"+C_BUTTONFONTSIZE
	C_BUTTON32STYLE = "border-radius:17px;color:white; background-color: red ;"+C_BUTTONFONTSIZE
	C_BUTTON64STYLE = "border-radius:17px;color:black; background-color: lightgray ;"+C_BUTTONFONTSIZE
	C_BUTTON128STYLE = "border-radius:17px;color:black; background-color: white ;"+C_BUTTONFONTSIZE
	C_BUTTON256STYLE = "border-radius:17px;color:white; background-color: black ;"+C_BUTTONFONTSIZE
	C_BUTTON512STYLE = "border-radius:17px;color:white; background-color: Purple ;"+C_BUTTONFONTSIZE
	C_BUTTON1024STYLE = "border-radius:17px;color:black; background-color: Yellow ;"+C_BUTTONFONTSIZE
	C_BUTTON2048STYLE = "border-radius:17px;color:white; background-color: Green ;"+C_BUTTONFONTSIZE
	C_LAYOUTSPACING = 10
	C_PLAYERSCORE = "Player Score :  "
	# Global Variables
		size = 4
		limit = 2
		num = 0
		flag = 0
		x1 = 0
		x2 = 0
		y1 = 0
		y2 = 0
		nScore = 0
		button = newlist(size,size)
		buttonsave = newlist(size,size)
		LayoutButtonRow = list(size+2)
		moveleft = []
		moveright = []
		moveup = []
		movedown = []
		myfilter2 = null
		myfilter3 = null
		winheight = 0
		winwidth = 0
	# Create the GUI Window
		app = new qApp
		{
			StyleFusion()
			processevents()
			win = new qWidget()
			{
				setWinIcon(win,"2048_logo.png")
				setWindowTitle(C_GAMETITLE)
				resize(600,700)
				setminimumwidth(300)
				setminimumheight(300)
				grabkeyboard()
				setstylesheet(C_WINDOWBACKGROUND)
				for n = 1 to size step 1 { 
					for m = 1 to size step 1 { 
						button[n][m] = new MyButton(win)
					} 
				} 
				newgame = new qLabel(win)
				playerscore = new qLabel(win)
				myfilter3 = new qAllEvents(win)
				{
					setMouseButtonPressEvent("pPress()")
					setMouseButtonReleaseEvent("pRelease()")
				}
				installeventfilter(myfilter3)
				myfilter2 = new qAllEvents(win)
				{
					setkeypressevent("keypress()")
				}
				installeventfilter(myfilter2)
				winwidth = win.width()
				winheight = win.height()
				for n = 1 to size+2 step 1 { 
					LayoutButtonRow[n] = new QHBoxLayout()
					{
						setSpacing(C_LAYOUTSPACING)
					}
				} 
				for n = 1 to size step 1 { 
					for m = 1 to size step 1 { 
						button[n][m] {
							temp = text()
						}
						buttonsave[n][m] = temp
						button[n][m] = new MyButton(win)
						{
							setalignment(Qt_AlignHCenter|Qt_AlignVCenter)
							setstylesheet(C_EMPTYBUTTONSTYLE)
							show()
						}
					} 
				} 
				for n = 1 to size step 1 { 
					for m = 1 to size step 1 { 
						LayoutButtonRow[n].AddWidget(button[m][n])
						win.show()
						temp = buttonsave[n][m]
						button[n][m].settext(temp)
					} 
					LayoutButtonRow[n].setSpacing(C_LAYOUTSPACING)
				} 
				playerscore {
					setGeometry(0,4*floor(winheight/6),winwidth,floor(winheight/6))
					setalignment(Qt_AlignHCenter|Qt_AlignVCenter)
					settext(C_PLAYERSCORE+nScore)
					setStylesheet(C_PLAYERSCORESTYLE)
					show()
				}
				newgame {
					setGeometry(0,5*floor(winheight/6),winwidth,floor(winheight/6))
					setalignment(Qt_AlignHCenter|Qt_AlignVCenter)
					setstylesheet(C_NEWGAMESTYLE)
					settext("New Game")
					myfilter4 = new qallevents(newgame)
					myfilter4.setMouseButtonPressEvent("pbegin()")
					installeventfilter(myfilter4)
					show()
				}
				LayoutButtonRow[size+1].AddWidget(playerscore)
				LayoutButtonRow[size+2].AddWidget(newgame)
				LayoutButtonMain = new QVBoxLayout()
				{
					setSpacing(C_LAYOUTSPACING)
					for n = 1 to size+2 step 1 { 
						AddLayout(LayoutButtonRow[n])
						win.show()
					} 
				}
				win.setLayout(LayoutButtonMain)
				win.show()
				pbegin()
				show()
			}
			exec()
		}
	func pPress () { 
		x1 = myfilter3.getglobalx()
		y1 = myfilter3.getglobaly()
	} 
	func pRelease () { 
		x2 = myfilter3.getglobalx()
		y2 = myfilter3.getglobaly()
		difx = x2-x1
		dify = y2-y1
		if fabs(difx) > fabs(dify) { 
			if difx < 0 { 
				pleft()
				else
					pRight()
			} 
			else
				if dify < 0 { 
					pUp()
					else
						pDown()
				} 
		} 
	} 
	func keypress () { 
		nKey = myfilter2.getkeycode()
		switch nKey { 
			case 16777234
				pleft()
			case 16777236
				pright()
			case 16777235
				pup()
			case 16777237
				pdown()
		} 
	} 
	func pbegin () { 
		numbers = [["2","2"],["2","4"]]
		randnew = newlist(2,2)
		for n = 1 to size step 1 { 
			for m = 1 to size step 1 { 
				button[n][m].setStylesheet(C_EMPTYBUTTONSTYLE)
				button[n][m].settext("")
			} 
		} 
		while true { 
			rn1 = random(size-1)+1
			rm1 = random(size-1)+1
			rn2 = random(size-1)+1
			rm2 = random(size-1)+1
			bool = (rn1 = rn2) AND (rm1 = rm2)
			if  NOT bool { 
				exit 1
			} 
		} 
		rand = random(limit-1)+1
		button[rn1][rm1].settext(numbers[rand][1])
		button[rn2][rm2].settext(numbers[rand][2])
		nScore = 0
		playerscore.settext(C_PLAYERSCORE)
	} 
	func pMoveInDirection cFunc { 
		num = gameover()
		if num = size*size { 
			flag = 1
			msgBox("You lost!")
			pbegin()
		} 
		if flag = 0 { 
			call cFunc()
			sleep(0.5)
			newnum()
		} 
	} 
	func pdown () { 
		pMoveInDirection(:pMoveDown)
	} 
	func pup () { 
		pMoveInDirection(:pMoveUp)
	} 
	func pleft () { 
		pMoveInDirection(:pMoveLeft)
	} 
	func pright () { 
		pMoveInDirection(:pMoveRight)
	} 
	func pmoveleft () { 
		for n = 1 to size step 1 { 
			moveleft = []
			for m = 1 to size step 1 { 
				button[m][n] {
					temp = text()
				}
				if temp! = "" { 
					add(moveleft,temp)
				} 
			} 
			movetilesleft(n,moveleft)
		} 
	} 
	func pmoveright () { 
		for n = 1 to size step 1 { 
			moveright = []
			for m = size to 1 step -1 { 
				button[m][n] {
					temp = text()
				}
				if temp! = "" { 
					add(moveright,temp)
				} 
			} 
			movetilesright(n,moveright)
		} 
		return 
	} 
	func pmoveup () { 
		for n = 1 to size step 1 { 
			moveup = []
			for m = 1 to size step 1 { 
				button[n][m] {
					temp = text()
				}
				if temp! = "" { 
					add(moveup,temp)
				} 
			} 
			movetilesup(n,moveup)
		} 
		return 
	} 
	func pmovedown () { 
		for n = 1 to size step 1 { 
			movedown = []
			for m = size to 1 step -1 { 
				button[n][m] {
					temp = text()
				}
				if temp! = "" { 
					add(movedown,temp)
				} 
			} 
			movetilesdown(n,movedown)
		} 
		return 
	} 
	func movetilesleft (nr,moveleft) { 
		for p = 1 to len(moveleft)-1 step 1 { 
			temp1 = moveleft[p]
			temp2 = moveleft[p+1]
			temp = string(number(temp1)+number(temp2))
			if (temp1 = temp2) AND (temp1! = "0") AND (temp2! = "0") AND (temp1! = "") AND (temp2! = "") { 
				if temp! = "0" AND temp! = "" { 
					nScore = nScore+temp
					playerscore.settext(C_PLAYERSCORE+nScore)
					flag = 1
					moveleft[p] = temp
					del(moveleft,p+1)
				} 
			} 
		} 
		for n = 1 to len(moveleft) step 1 { 
			button[n][nr].settext(moveleft[n])
		} 
		for n = len(moveleft)+1 to size step 1 { 
			if n <= size { 
				button[n][nr].setStylesheet(C_EMPTYBUTTONSTYLE)
				button[n][nr].settext("")
			} 
		} 
		return 
	} 
	func movetilesright (nr,moveright) { 
		flag = 0
		for p = 2 to len(moveright) step 1 { 
			temp1 = moveright[p]
			temp2 = moveright[p-1]
			if (temp1 = temp2) AND (temp1! = "0") AND (temp2! = "0") AND (temp1! = "") AND (temp2! = "") { 
				temp = string(number(temp1)+number(temp2))
				if temp! = "0" AND temp! = "" { 
					nScore = nScore+temp
					playerscore.settext(C_PLAYERSCORE+nScore)
					flag = 1
					moveright[p] = temp
					del(moveright,p-1)
				} 
			} 
		} 
		for n = 1 to len(moveright) step 1 { 
			button[size-n+1][nr].settext(moveright[n])
		} 
		for n = 1 to size-len(moveright) step 1 { 
			if n <= size { 
				button[n][nr].setStylesheet(C_EMPTYBUTTONSTYLE)
				button[n][nr].settext("")
			} 
		} 
	} 
	func movetilesup (nr,moveup) { 
		flag = 0
		for p = 1 to len(moveup)-1 step 1 { 
			temp1 = moveup[p]
			temp2 = moveup[p+1]
			if (temp1 = temp2) AND (temp1! = "0") AND (temp2! = "0") AND (temp1! = "") AND (temp2! = "") { 
				temp = string(number(temp1)+number(temp2))
				if temp! = "0" AND temp! = "" { 
					nScore = nScore+temp
					playerscore.settext(C_PLAYERSCORE+nScore)
					flag = 1
					moveup[p] = temp
					del(moveup,p+1)
				} 
			} 
		} 
		for n = 1 to len(moveup) step 1 { 
			button[nr][n].settext(moveup[n])
		} 
		for n = len(moveup)+1 to size step 1 { 
			if n <= size { 
				button[nr][n].setStylesheet(C_EMPTYBUTTONSTYLE)
				button[nr][n].settext("")
			} 
		} 
	} 
	func movetilesdown (nr,movedown) { 
		flag = 0
		for p = 1 to len(movedown)-1 step 1 { 
			temp1 = movedown[p]
			temp2 = movedown[p+1]
			if (temp1 = temp2) AND (temp1! = "0") AND (temp2! = "0") AND (temp1! = "") AND (temp2! = "") { 
				temp = string(number(temp1)+number(temp2))
				if temp! = "0" AND temp! = "" { 
					nScore = nScore+temp
					playerscore.settext(C_PLAYERSCORE+nScore)
					flag = 1
					movedown[p] = temp
					del(movedown,p+1)
				} 
			} 
		} 
		for n = 1 to len(movedown) step 1 { 
			button[nr][size-n+1].settext(movedown[n])
		} 
		for n = size-len(movedown) to 1 step -1 { 
			if n <= size { 
				button[nr][n].setStylesheet(C_EMPTYBUTTONSTYLE)
				app.processevents()
				button[nr][n].settext("")
			} 
		} 
	} 
	func newnum () { 
		while true { 
			rn = random(size-1)+1
			rm = random(size-1)+1
			if button[rn][rm].text() = "" { 
				button[rn][rm].settext("2")
				exit 1
			} 
		} 
		return 
	} 
	func gameover () { 
		num = 0
		flag = 0
		for n = 1 to size step 1 { 
			for m = 1 to size step 1 { 
				if button[n][m].text()! = "" { 
					num = num+1
				} 
			} 
		} 
		return num
	} 
	func msgBox (text) { 
		m = new qMessageBox(win)
		{
			setWindowTitle("2048 Game")
			setText(text)
			show()
		}
	} 
	func showarray (vect) { 
		see "["
		svect = ""
		for n = 1 to len(vect) step 1 { 
			svect = svect+vect[n]+" "
		} 
		svect = left(svect,len(svect)-1)
		see svect
		see "]"+nl
	} 
	class MyButton from qLabel
		func setText (cValue) { 
			Super.setText(cValue)
			switch cValue { 
				case "2"
					setStyleSheet(C_BUTTON2STYLE)
				case "4"
					setStylesheet(C_BUTTON4STYLE)
				case "8"
					setStylesheet(C_BUTTON8STYLE)
				case "16"
					setStylesheet(C_BUTTON16STYLE)
				case "32"
					setStylesheet(C_BUTTON32STYLE)
				case "64"
					setStylesheet(C_BUTTON64STYLE)
				case "128"
					setStylesheet(C_BUTTON128STYLE)
				case "256"
					setStylesheet(C_BUTTON256STYLE)
				case "512"
					setStylesheet(C_BUTTON512STYLE)
				case "1024"
					setStylesheet(C_BUTTON1024STYLE)
				case "2048"
					setStylesheet(C_BUTTON2048STYLE)
			} 
		} 
	private
