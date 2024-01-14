# Author : Gal Zsolt
	load "stdlibcore.ring"
	load "lightguilib.ring"
	# Global variables and constants
		size = 7
		player1 = 0
		player2 = 0
		player = 0
		playercomp = 0
		C_ROWCOUNT = 7
		C_COLCOUNT = 7
		C_SPACING = 5
		C_EMPTYBUTTONSTYLE = "border-radius:17px;background-color:blue"
		C_BUTTONREDSTYLE = "border-radius:17px;color:black; background-color: red"
		C_BUTTONYELLOWSTYLE = "border-radius:17px;color:black; background-color: yellow"
		C_BUTTONVIOLETSTYLE = "border-radius:17px;color:black; background-color: violet"
		C_MENUSTYLE = "color:white;background-color:rgb(50,50,50);border-radius:17px"
		button = list(C_ROWCOUNT,C_COLCOUNT)
		LayoutButtonRow = list(C_ROWCOUNT+3)
		buttonsum1 = dimlist([size,size,1])
		buttonsum2 = dimlist([size,size,1])
	# Create the GUI
		app = new QApp
		{
			StyleFusion()
			win = new QWidget()
			{
				setWindowTitle("Tessera Game")
				setWindowIcon(new QIcon(new QPixmap("thought.png")))
				move(490,100)
				resize(600,600)
				setstylesheet("background-color:white")
				playcomp = new QPushButton(win)
				playcomp {
					setstylesheet(C_MENUSTYLE)
					setstylesheet("font-size:30px")
					settext("Play with computer")
					setclickevent("pcomputer()")
					setSizePolicy(1,1)
					show()
				}
				playtwo = new QPushButton(win)
				playtwo {
					setstylesheet(C_MENUSTYLE)
					setstylesheet("font-size:30px")
					settext("Two players")
					setclickevent("ptwo()")
					setSizePolicy(1,1)
					show()
				}
				playexit = new QPushButton(win)
				playexit {
					setstylesheet(C_MENUSTYLE)
					setstylesheet("font-size:30px")
					settext("Exit")
					setclickevent("pexit()")
					setSizePolicy(1,1)
					show()
				}
				LayoutButtonMain = new QVBoxLayout()
				LayoutButtonMain.setSpacing(C_SPACING)
				LayoutButtonMain.setContentsmargins(0,0,0,0)
				for Row = 1 to C_ROWCOUNT step 1 { 
					LayoutButtonRow[Row] = new QHBoxLayout()
					{
						setSpacing(C_SPACING)
						setContentsmargins(0,0,0,0)
					}
					for Col = 1 to C_COLCOUNT step 1 { 
						button[Row][Col] = new QPushButton(win)
						{
							setstylesheet(C_EMPTYBUTTONSTYLE)
							setclickevent("pplay("+string(Row)+","+string(Col)+")")
							setSizePolicy(1,1)
						}
						LayoutButtonRow[Row].AddWidget(button[Row][Col])
						if Row = C_ROWCOUNT AND Col = C_COLCOUNT { 
						} 
					} 
					LayoutButtonMain.AddLayout(LayoutButtonRow[Row])
				} 
				oMainLayout = new QVBoxlayout()
				{
					AddWidget(playcomp)
					AddWidget(playtwo)
					AddWidget(playexit)
				}
				LayoutButtonMain.AddLayout(oMainLayout)
				setLayout(LayoutButtonMain)
				show()
			}
			pComputer()
			exec()
		}
	func compenter () { 
		row2 = 0
		while row2 = 0 { 
			n2 = random(size-1)+1
			for x = size to 1 step -1 { 
				bool = (buttonsum1[n2][x][1]! = 1) AND (buttonsum2[n2][x][1]! = 2)
				if bool = 1 { 
					row2 = x
					exit 2
				} 
			} 
		} 
		pcolor(n2,row2,C_BUTTONYELLOWSTYLE)
		button[row2][n2] {
			setstylesheet(C_BUTTONYELLOWSTYLE)
			playercomp = 0
			player = 1
		}
		buttonsum2[n2][row2][1] = 2
		if row2 = 1 { 
			for nr = 1 to size step 1 { 
				button[nr][n2].setenabled(false)
			} 
		} 
	} 
	func pcolor (n,row,bcolor) { 
		for x = 1 to row-1 step 1 { 
			app.processevents()
			sleep(0.1)
			button[x][n].setstylesheet(bcolor)
			app.processevents()
			sleep(0.1)
			button[x][n].setstylesheet(C_EMPTYBUTTONSTYLE)
		} 
	} 
	func pplay (m,n) { 
		if playercomp = 1 { 
			n = random(size-1)+1
		} 
		for x = size to 1 step -1 { 
			bool = (buttonsum1[n][x][1]! = 1) AND (buttonsum2[n][x][1]! = 2)
			if bool = 1 { 
				row = x
				exit 1
			} 
		} 
		if player = 1 OR player1 = 1 { 
			pcolor(n,row,C_BUTTONREDSTYLE)
		} 
		if player2 = 1 { 
			pcolor(n,row,C_BUTTONYELLOWSTYLE)
		} 
		if player = 1 { 
			button[row][n] {
				setstylesheet(C_BUTTONREDSTYLE)
				player = 0
				playercomp = 1
			}
			buttonsum1[n][row][1] = 1
			gameover()
			compenter()
		} 
		if player1 = 1 { 
			button[row][n] {
				setstylesheet(C_BUTTONREDSTYLE)
			}
			buttonsum1[n][row][1] = 1
		} 
		if player2 = 1 { 
			button[row][n] {
				setstylesheet(C_BUTTONYELLOWSTYLE)
			}
			buttonsum2[n][row][1] = 2
		} 
		if player1 = 1 AND player = 0 AND playercomp = 0 { 
			player1 = 0
			player2 = 1
			elseif player1 = 0 AND player = 0 AND playercomp = 0
				player1 = 1
				player2 = 0
		} 
		if row = 1 { 
			for nr = 1 to size step 1 { 
				button[nr][n].setenabled(false)
			} 
		} 
		gameover()
	} 
	func gameover
		buttonsum = 0
		for n = 1 to size-3 step 1 { 
			for m = 1 to size step 1 { 
				bool1 = (buttonsum1[n][m][1] = 1) AND (buttonsum1[n+1][m][1] = 1)
				bool2 = (buttonsum1[n+2][m][1] = 1) AND (buttonsum1[n+3][m][1] = 1)
				bool9 = (buttonsum2[n][m][1] = 2) AND (buttonsum2[n+1][m][1] = 2)
				bool10 = (buttonsum2[n+2][m][1] = 2) AND (buttonsum2[n+3][m][1] = 2)
				if bool1 AND bool2 { 
					button[m][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m][n+1].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m][n+2].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m][n+3].setstylesheet(C_BUTTONVIOLETSTYLE)
					msgBox("Player1 won!")
				} 
				if bool9 AND bool10 { 
					button[m][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m][n+1].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m][n+2].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m][n+3].setstylesheet(C_BUTTONVIOLETSTYLE)
					msgBox("Player2 won!")
				} 
			} 
		} 
		for n = 1 to size step 1 { 
			for m = 1 to size-3 step 1 { 
				bool3 = (buttonsum1[n][m][1] = 1) AND (buttonsum1[n][m+1][1] = 1)
				bool4 = (buttonsum1[n][m+2][1] = 1) AND (buttonsum1[n][m+3][1] = 1)
				bool11 = (buttonsum2[n][m][1] = 2) AND (buttonsum2[n][m+1][1] = 2)
				bool12 = (buttonsum2[n][m+2][1] = 2) AND (buttonsum2[n][m+3][1] = 2)
				if bool3 AND bool4 { 
					button[m][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+1][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+2][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+3][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					msgBox("Player1 won!")
				} 
				if bool11 AND bool12 { 
					button[m][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+1][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+2][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+3][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					msgBox("Player2 won!")
				} 
			} 
		} 
		for n = 1 to size-3 step 1 { 
			for m = 1 to size-3 step 1 { 
				bool5 = (buttonsum1[n][m][1] = 1) AND (buttonsum1[n+1][m+1][1] = 1)
				bool6 = (buttonsum1[n+2][m+2][1] = 1) AND (buttonsum1[n+3][m+3][1] = 1)
				bool13 = (buttonsum2[n][m][1] = 2) AND (buttonsum2[n+1][m+1][1] = 2)
				bool14 = (buttonsum2[n+2][m+2][1] = 2) AND (buttonsum2[n+3][m+3][1] = 2)
				if bool5 AND bool6 { 
					button[m][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+1][n+1].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+2][n+2].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+3][n+3].setstylesheet(C_BUTTONVIOLETSTYLE)
					msgBox("Player1 won!")
				} 
				if bool13 AND bool14 { 
					button[m][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+1][n+1].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+2][n+2].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+3][n+3].setstylesheet(C_BUTTONVIOLETSTYLE)
					msgBox("Player2 won!")
				} 
			} 
		} 
		for n = 1 to size-3 step 1 { 
			for m = 1 to size-3 step 1 { 
				bool7 = (buttonsum1[n+3][m][1] = 1) AND (buttonsum1[n+2][m+1][1] = 1)
				bool8 = (buttonsum1[n+1][m+2][1] = 1) AND (buttonsum1[n][m+3][1] = 1)
				bool15 = (buttonsum2[n+3][m][1] = 2) AND (buttonsum2[n+2][m+1][1] = 2)
				bool16 = (buttonsum2[n+1][m+2][1] = 2) AND (buttonsum2[n][m+3][1] = 2)
				if bool7 AND bool8 { 
					button[m][n+3].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+1][n+2].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+2][n+1].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+3][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					msgBox("Player1 won!")
				} 
				if bool15 AND bool16 { 
					button[m][n+3].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+1][n+2].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+2][n+1].setstylesheet(C_BUTTONVIOLETSTYLE)
					button[m+3][n].setstylesheet(C_BUTTONVIOLETSTYLE)
					msgBox("Player2 won!")
				} 
			} 
		} 
		for n = 1 to size step 1 { 
			for m = 1 to size step 1 { 
				bool = (buttonsum1[n][m][1] = 1) OR (buttonsum2[n][m][1] = 2)
				if bool = 1 { 
					buttonsum = buttonsum+1
				} 
			} 
		} 
		if buttonsum = size*size { 
			msgBox("Game Over!")
		} 
	func pbegin
		buttonsum1 = dimlist([size,size,1])
		buttonsum2 = dimlist([size,size,1])
		for n = 1 to size step 1 { 
			for m = 1 to size step 1 { 
				button[n][m] {
					setstylesheet(C_EMPTYBUTTONSTYLE)
					buttonsum1[n][m][1] = 0
					buttonsum2[n][m][1] = 0
					setenabled(true)
					win.show()
				}
			} 
		} 
	func pcomputer
		player = 1
		playercomp = 0
		player1 = 0
		player2 = 0
		pbegin()
	func ptwo
		player1 = 1
		player2 = 0
		player = 0
		playercomp = 0
		pbegin()
	func pexit
		win.close()
		app.quit()
	func dimlist (dimArray) { 
		sizeList = len(dimArray)
		newParms = []
		for i = 2 to sizeList step 1 { 
			Add(newParms,dimArray[i])
		} 
		alist = list(dimArray[1])
		if sizeList = 1 { 
			return aList
		} 
		for t in alist step 1 { 
			t = dimlist(newParms)
		} 
		return alist
	} 
	func msgBox (cText) { 
		mb = new qMessageBox(win)
		{
			setWindowTitle("Tessera Game")
			setText(cText)
			setstandardbuttons(QMessageBox_OK)
			result = exec()
			pbegin()
		}
	} 
