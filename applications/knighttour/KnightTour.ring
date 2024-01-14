# ## Author:	 Bert Mariani, Nestor Kuka
	load "stdlibcore.ring"
	load "lightguilib.ring"
	# Constants & Global Variables
		lTrackMoves = False
		sizeX = 800
		sizeY = 600
		hSize = 8+2+2
		vSize = 8+2+2
		h = 0
		v = 0
		aArray = null
		aButton = null
		workWidget = null
		ManualGame = null
		OldMoveColor = null
		Slider1 = null
		TitleKnightMoves = null
		TitleKnightInvalidMove = null
		LayoutButtonRow = null
		Knight = AppFile("knight.png")
		oKnight = new QPixmap(Knight)
		bWidth = oKnight.width()
		bHeight = oKnight.height()
		nMoves = 0
		oldH = 0
		oldV = 0
		C_Spacing = 2
		C_ButtonIconWidth = 60
		C_ButtonIconHeight = 60
		C_ButtonMinWidth = 80
		C_ButtonMinHeight = 80
		C_ButtonFirstStyle = "border-radius:1px; color:black; background-color: rgb(229,249,203) ;"+"border-style: outset; border-width: 2px; border-radius: 2px; border-color: gray;"
		C_ButtonSecondStyle = "border-radius:1px; color:black; background-color: rgb(179,200,93); "+"border-style: outset; border-width: 2px; border-radius: 2px; border-color: darkGray; "
		animationDelay = 0.5
	# Create the GUI
		app = new qApp
		{
			DrawWidget()
			NewGameStart()
			exec()
		}
	func DrawWidget () { 
		# ## Global definition for workWidget
		workWidget = new qWidget()
		{
			# Set the Window Icon
			setWindowIcon( new qIcon( new qPixmap(KNIGHT)))
			aArray = newList(hSize,vSize)
			# ## Internal Array with Letters
			aButton = newList(hSize,vSize)
			# ## Internal Array with Letters
			setWindowTitle("Knight Tour")
			setStyleSheet("background-color:White")
			workHeight = workWidget.height()
			fontSize = 8+(workHeight/100)
			resize(sizeX,sizeY)
			# ##----------------------------------------------
			# ## Title Top Row - Moves Count
			TitleKnightMoves = new qLineEdit(workWidget)
			{
				setStyleSheet("background-color:rgb(255,255,204)")
				setFont( new qFont("Calibri",fontsize,100,0))
				setAlignment(Qt_AlignVCenter)
				setAlignment(Qt_AlignVCenter)
				setText(" Moves: "+nMoves)
			}
			TitleKnightInvalidMove = new qLineEdit(workWidget)
			{
				setStyleSheet("background-color:rgb(255,255,204)")
				setFont( new qFont("Calibri",fontsize,100,0))
				setAlignment(Qt_AlignVCenter)
				setAlignment(Qt_AlignVCenter)
				setText("Click on Square to Start")
			}
			Slider1 = new qslider(workWidget)
			{
				setorientation(Qt_Horizontal)
				setTickInterval(50)
				# ## Remember setting on New Game
				setvalue(100-(animationDelay*100))
				# ## 100 - ( 0.5 * 100) => 0.5 sec delay between moves
				setValueChangedEvent("SliderEventValueChg()")
			}
			OldMoveColor = new qcheckbox(workWidget)
			{
				setFont( new qFont("Calibri",fontsize,100,0))
				setStyleSheet("background-color:rgb(204,255,229)")
				setText("SolidColor")
			}
			ManualGame = new qcheckbox(workWidget)
			{
				setFont( new qFont("Calibri",fontsize,100,0))
				setStyleSheet("background-color:rgb(204,255,229)")
				setText("Computer")
			}
			NewGame = new QPushButton(workWidget)
			{
				setStyleSheet("background-color:rgb(255,204,229)")
				setFont( new qFont("Calibri",fontsize,100,0))
				setText(" New Game ")
				setClickEvent("NewGameStart()")
			}
			# ##-----------------------------------------------------------------------
			# ## QVBoxLayout lays out widgets in a vertical column, from top to bottom.
			# ## Vertical
			LayoutButtonMain = new QVBoxLayout()
			LayoutButtonMain.setSpacing(C_Spacing)
			LayoutButtonMain.setContentsMargins(5,5,5,5)
			# ## Horizontal - TOP ROW
			LayoutTitleRow = new QHBoxLayout()
			{
				setSpacing(C_Spacing)
				setContentsMargins(0,0,0,0)
			}
			LayoutTitleRow.AddWidget(TitleKnightMoves)
			LayoutTitleRow.AddWidget(TitleKnightInvalidMove)
			LayoutTitleRow.AddWidget(Slider1)
			LayoutTitleRow.AddWidget(OldMoveColor)
			LayoutTitleRow.AddWidget(ManualGame)
			LayoutTitleRow.AddWidget(NewGame)
			# ## Layout - Add  TITLE-ROW on TOP	
			LayoutButtonMain.AddLayout(LayoutTitleRow)
			# ## BUTTON ROWS
			LayoutButtonRow = list(hSize)
			# ## QHBoxLayout lays out widgets in a horizontal row, from left to right		
			odd = 1
			for Row = 3 to hSize-2 step 1 { 
				# ## Horizontal
				LayoutButtonRow[Row] = new QHBoxLayout()
				{
					setSpacing(C_Spacing)
					setContentsmargins(0,0,0,0)
				}
				# ## Create Buttons
				for Col = 3 to vSize-2 step 1 { 
					aButton[Row][Col] = new QPushButton(workWidget)
					{
						if odd%2 { 
							setStyleSheet(C_ButtonFirstStyle)
							odd++
							else
								setStyleSheet(C_ButtonSecondStyle)
								odd++
						} 
						setClickEvent("UserLeftClick("+string(Row)+","+string(Col)+")")
						setSizePolicy(1,1)
						setMinimumWidth(C_ButtonMinWidth)
						setMinimumHeight(C_ButtonMinHeight)
					}
					# ## Widget - Add HORIZONTAL BUTTON
					LayoutButtonRow[Row].AddWidget(aButton[Row][Col])
				} 
				odd++
				# ## Layout - Add ROW of BUTTONS			
				LayoutButtonMain.AddLayout(LayoutButtonRow[Row])
			} 
			setLayout(LayoutButtonMain)
			for h = 1 to hSize step 1 { 
				# ## e - empty Visible Squares  3--10
				for v = 1 to vSize step 1 { 
					aArray[h][v] = "e"
					# ## "." - dot InVisible Squares	 1-2,  3--10,  11-12
					if h < 3 OR h > 10 OR V < 3 OR V > 10 { 
						aArray[h][v] = "."
					} 
				} 
			} 
			show()
		}
		# ##NewLocation(3,3)
		return 
		# ## NewGameStart - Read Row Col Mines values, Score reset
		# ## Level L: 1-Beginner, 2-Intermediate, 3-Expert, 4-Custom
	} 
	func NewGameStart () { 
		workWidget.Close()
		hSize = 8+2+2
		vSize = 8+2+2
		# ## Indicate start game - User Picks Starting Square
		NewLocation(0,0)
		# ## What were previous setting
		FlagOldMoveColor = 0
		FlagManualGame = 0
		oldAnimationDelay = animationDelay
		if OldMoveColor.isChecked() { 
			FlagOldMoveColor = 1
		} 
		if ManualGame.isChecked() { 
			FlagManualGame = 1
		} 
		nMoves = 0
		TitleKnightMoves.setText(" Moves: "+nMoves)
		TitleKnightInvalidMove.setText(" Click a Square to Start")
		for h = 1 to hSize step 1 { 
			for v = 1 to vSize step 1 { 
				aArray[h][v] = "e"
				# ## e - empty
			} 
		} 
		# ## Restore previous settings
		DrawWidget()
		if FlagOldMoveColor = 1 { 
			OldMoveColor.setChecked(True)
		} 
		if FlagManualGame = 1 { 
			ManualGame.setChecked(True)
		} 
		return 
		# ## START GAME !!!
		# ## Get User - Cell Clicked - Horz-Vert
	} 
	func UserLeftClick (Row,Col) { 
		h = 0+Row
		# ## convert to number
		v = 0+Col
		if OldMoveColor.isChecked() { 
			lTrackMoves = False
			else
				lTrackMoves = True
		} 
		if ManualGame.isChecked() { 
			ComputerPlay(h,v)
			# ## Then ===>>> Calls Play(h,v)
			else
				Play(h,v)
		} 
		return 
	} 
	func Play (h,v) { 
		if ValidMove(oldH,oldV,h,v) { 
			if CheckEndOfGame() { 
				return 
			} 
			ClearOldMove()
			NewLocation(h,v)
			RecordNewMove()
			if CheckEndOfGame() { 
				return 
			} 
		} 
		return 
	} 
	func ClearOldMove () { 
		# ## oldH = 0 , oldV = 0 Before Start, No move played
		if oldH! = 0 { 
			aButton[oldh][oldv] {
				# ## True - show Knight
				if lTrackMoves { 
					nImageWidth = Width()-65
					nImageHeight = Height()-65
					oMine = new qpixmap(Knight)
					setIcon( new qIcon(oMine))
					setFont( new qFont("Calibri",14,100,0))
					setText(""+nMoves)
					setIconSize( new qSize(C_ButtonIconWidth,C_ButtonIconHeight))
					else
						# ## False show Solid Color
						oMine = new qpixmap2(0,0)
						setIcon( new qIcon(oMine))
						setStylesheet("background-color:rgb(64,128,128);")
						# ## Color blind people have problem with rgb(0,255,100);")
						setFont( new qFont("Calibri",14,100,0))
						setText(""+nMoves)
						setIconSize( new qSize(C_ButtonIconWidth,C_ButtonIconHeight))
				} 
			}
		} 
		return 
	} 
	func RecordNewMove  { 
		nMoves++
		TitleKnightMoves.setText(" Moves: "+nMoves)
		return 
	} 
	func CheckEndOfGame () { 
		for Row = 3 to vSize-2 step 1 { 
			for Col = 3 to vSize-2 step 1 { 
				if aArray[Row][Col]! = "v" { 
					return False
				} 
			} 
		} 
		cMsg = "You completed the game in "+nMoves+" moves"
		if nMoves > 63 { 
			cMsg += ", but can you do it in a fewer?"
		} 
		MsgInfo("Knight Tour",cMsg)
		return True
	} 
	func NewLocation (h,v) { 
		# ## Ignore
		if h = 0 AND V = 0 { 
			else
				aButton[h][v] {
					nImageWidth = Width()-24
					nImageHeight = Height()-24
					# oMine = oMine.scaled(nImageWidth , nImageHeight ,0,0)
					oMine = new qpixmap(Knight)
					setIcon( new qIcon(oMine))
					setIconSize( new qSize(C_ButtonIconWidth,C_ButtonIconHeight))
				}
				aArray[h][v] = "v"
		} 
		oldH = h
		oldV = v
		return 
	} 
	func ValidMove (oldH,oldV,h,v) { 
		# ## ClockWise-LD	  LU  -- UL	   UR -- RU	   RD --- RU	  DL	
		PosMove = [[-2,-1],[-2,1],[-1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2]]
		FlagValidMove = 0
		if Not (oldH=0 and oldV=0) { 
			TitleKnightInvalidMove.setText(" Msg:  Invalid Move ")
		}
		for i = 1 to 8 step 1 { 
			if h = oldH+PosMove[i][1] AND v = oldV+PosMove[i][2] { 
				FlagValidMove = 1
				TitleKnightInvalidMove.setText(" Msg:			   ")
				exit 1
			} 
		} 
		if FlagValidMove = 0 { 
			see "InvalidMove: "+oldH+"-"+oldV+" >>> "+h+"-"+v+nl
			# ## Ignore. User selects First Move
			if oldH = 0 AND oldV = 0 { 
				FlagValidMove = 1
			} 
		} 
		return FlagValidMove
	} 
	func SliderEventValueChg () { 
		# See "Change: "+ Slider1.value() +nl
		animationDelay = (100-Slider1.value())/100
		return 
	} 
	func ComputerPlay (horz,vert) { 
		# ## Possible Moves
		pm = [[-2,1],[-1,2],[1,2],[2,1],[-2,-1],[-1,-2],[1,-2],[2,-1]]
		n = 8
		# ## Number rows/columns
		cbx = n
		# ## rows
		cby = n
		# ## OverRide Random. USER Picks Starting Square.
		# ## By Calling this function ComputerPlay(horz.vert)
		Kx = horz-2
		Ky = vert-2
		NewLocation(Kx+2,Ky+2)
		# ## Board to Internal
		see "Start-field Kx-Ky: "+Kx+"-"+Ky+nl
		# ## Make Chessboard n*n
		cb = list(cby)
		for x in cb step 1 { 
			x = list(cbx)
		} 
		k = 0
		# ## jumps-counter
		while k <= cbx*cby { 
			cb[ky][kx] = k+1
			pq = []
			# ## priority Queue
			# ## row
			for i = 1 to n step 1 { 
				nx = kx+pm[i][1]
				ny = ky+pm[i][2]
				if between(nx,1,cbx) AND between(ny,1,cby) { 
					if cb[ny][nx] = 0 { 
						ctr = 0
						# ## col
						for j = 1 to n step 1 { 
							ex = nx+pm[j][1]
							ey = ny+pm[j][2]
							# ## funzt
							if between(ex,1,cbx) AND between(ey,1,cby) { 
								if cb[ey][ex] = 0 { 
									ctr++
								} 
							} 
						} 
						add(pq,(ctr*100)+i)
						# ## format zB: 302
					} 
				} 
			} 
			# ##	 -- Warnsdorff’s algorithms;	extended
			# ##		Move to the neighbor that has min number of available neighbors
			# ##		Randomization:	we could take it - or not
			if len(pq) > 0 { 
				pq = sort(pq)
				# ## min-value at begin
				minVal = 8
				# ## max loop nr
				minD = 0
				# ## min value
				for dd = 1 to len(pq) step 1 { 
					x = pq[1]
					# ## min-value
					p = floor(x/100)
					# ## ctr	 - value
					m = x%10
					# ## i	 - value (row)
					if p = minVal AND random(10) < 5 { 
						minVal = p
						minD = m
					} 
					if p < minVal { 
						minVal = p
						minD = m
					} 
					Del(pq,1)
					# ## delete item number three
				} 
				# ## dd
				m = minD
				kx = kx+pm[m][1]
				ky = ky+pm[m][2]
				# ## Call Func PLAY for this move
				app.processevents()
				Sleep(animationDelay)
				# ## Need Delay - Read from Slider1
				horz = kx+2
				# ## Internal move = Board +2
				vert = ky+2
				see "Kx-Ky: "+k+" "+kx+"-"+ky+nl
				# ## SEE "	--- Play: "+horz +"-"+ vert +nl
				Play(horz,vert)
				else
					if k < 63 { 
						see "Error in the field no .: "+k+nl+nl
						exit 1
						else
							see "Success."+nl+nl
							exit 1
					} 
			} 
			k++
		} 
		# ## Control output:
		see "..| 1| 2| 3| 4| 5| 6| 7| 8|"+nl
		# ## row
		for r = 1 to N step 1 { 
			see " "+r
			# ## col
			for c = 1 to N step 1 { 
				see "|"
				# ## separator
				if cb[c][r] <= (n+1) { 
					see "_"
					# ##see " "				### protected blank: old 255 (not enough)
					see cb[c][r]
					else
						see cb[c][r]
						# ## get content from cb
				} 
			} 
			see "|"
			see nl
		} 
	} 
	func between x,mi,mx { 
		# ## min & max are keywords
		between = (x >= mi) AND (x <= mx)
		return between
	} 
