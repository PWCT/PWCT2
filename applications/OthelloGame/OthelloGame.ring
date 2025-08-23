#Project : Othello Game
#Date    : 2018/10/05
#DAte    : 2024-12-02  Changed look, colors and pieces to .png
#Author : Gal Zsolt (~ CalmoSoft ~), Bert Mariani
#Email   : <calmosoft@gmail.com>
load "stdlibcore.ring"
load "lightguilib.ring"
Size = 8
Score = 0
sumMoveBlack = 0
sumMoveWhite = 0
oPicBlack = new QPixmap(AppFile("black.png"))
oPicWhite = new QPixmap(AppFile("white.png"))
oPicEmpty = new QPixmap(AppFile("empty.jpg"))
bWidth = 70
bHeight = 70
C_Spacing = 2
C_ButtonEmptyStyle = "border-radius:8px;color:black; background-color: rgb(34,177,76); "
C_ButtonBlueStyle = "border-radius:6px;color:black; background-color: Cyan"
C_ButtonYellowStyle = "border-radius:6px;color:black; background-color: Yellow"
C_ButtonOrangeStyle = "border-radius:6px;color:black; background-color: Orange"
C_ButtonGrayStyle = "border-radius:6px;color:black; background-color: rgb(213, 245, 227)"
Button = list(Size+1,Size)
LayoutButtonRow = list(Size+4)
curColor = "B"
### "B" or "W"
otherColor = "W"
FlagFlip = 0
FlagSkipTurn = 0
### Player has No Possible Valid Move
TransScript = list(1)
MoveNumber = 1
dArray = list(8)
### Flat destination array for diagonal analysis
bArray = List(8,8)
### Internal button array
oldArray = List(8,8)
### Save bArray as oldArray, See who flip for Animation
###=====================================================
###=====================================================
app = new qApp
{
	win = new qWidget()
	{
		setWindowTitle("Othello Game")
		setWinIcon(self,AppFile("White.png"))
		setStyleSheet("background-color:White")
		reSize(800,600)
		winheight = win.height()
		fontSize = 8+(winheight/100)
		PlayScoreBlack = new QLabel(win)
		{
			setFont( new qFont("Cambria",fontSize,50,0))
			setstylesheet(C_ButtonBlueStyle)
			setalignment(Qt_AlignHCenter|Qt_AlignVCenter)
			settext("Black Score: 2")
		}
		PlayScoreWhite = new QLabel(win)
		{
			setFont( new qFont("Cambria",fontSize,50,0))
			setstylesheet(C_ButtonYellowStyle)
			setalignment(Qt_AlignHCenter|Qt_AlignVCenter)
			settext("White Score: 2")
		}
		NextMove = new QLabel(win)
		{
			setFont( new qFont("Cambria",fontSize,50,0))
			setstylesheet(C_ButtonOrangestyle)
			setalignment(Qt_AlignHCenter|Qt_AlignVCenter)
			settext("Next Move: Black ")
		}
		NewGame = new QPushButton(win)
		{
			setFont( new qFont("Cambria",fontSize,50,0))
			setstylesheet("background-color:violet")
			settext("New Game:")
			setclickevent("pStart()")
			### CLICK NEW GAME >>> pStart
		}
		SkipTurn = new QPushButton(win)
		{
			setFont( new qFont("Cambria",fontSize,50,0))
			setstylesheet("background-color:violet")
			settext("Skip Turn:")
			setclickevent("pSkipTurn()")
			### CLICK SKIP TURN >>> pSkipTurn
		}
		StatusBar1 = new qstatusbar(win)
		{
			setstylesheet(C_ButtonBlueStyle)
			setFont( new qFont("Cambria",fontSize,50,0))
		}
		##------------------------------------------------------------------------------
		### QVBoxLayout lays out Button Widgets in a vertical column, from top to bottom.
		### VERTICAL
		LayoutButtonMain = new QVBoxLayout()
		LayoutButtonMain.setSpacing(C_Spacing)
		LayoutButtonMain.setContentsmargins(0,0,0,0)
		###-------------------------------------------
		### Title Top Row - LETTERS  @ A B C D E F G H
		TitleLet = list(9)
		### Array of qLabel Object
		Number = 64
		### 64=@ A B .. H
		for Col = 1 to 9 step 1 { 
			Letter = hex2str(hex(Number))
			TitleLet[Col] = new qLabel(win)
			{
				setFont( new qFont("Cambria",fontSize,50,0))
				setAlignment(Qt_AlignHCenter|Qt_AlignVCenter)
				setStyleSheet("background-color:darkgray")
				setText(Letter)
			}
			Number++
		} 
		###-----------------------------------
		### Horizontal Rows - 1 2 3 4 5 6 7 8
		LayoutTitleRow = new QHBoxLayout()
		{
			setSpacing(C_Spacing)
			setContentsMargins(0,0,0,0)
		}
		for Col = 1 to 9 step 1 { 
			LayoutTitleRow.AddWidget(TitleLet[Col])
		} 
		LayoutButtonMain.AddLayout(LayoutTitleRow)
		### Layout - Add  TITLE-ROW on TOP
		###----------------------------------------------
		### Horizontal Button Rows
		TitleNum = list(9)
		### Array of qLabel Object
		for Col = 1 to 8 step 1 { 
			Letter = ""+Col
			TitleNum[Col] = new qLabel(win)
			{
				setFont( new qFont("Cambria",fontSize,50,0))
				setAlignment(Qt_AlignHCenter|Qt_AlignVCenter)
				setStyleSheet("background-color:darkgray")
				setText(Letter)
			}
			Number++
		} 
		###-----------------------------------------------------------------------
		### QHBoxLayout lays out widgets in a horizontal row, from left to right
		for Row = 1 to Size step 1 { 
			### Horizontal
			LayoutButtonRow[Row] = new QHBoxLayout()
			{
				setSpacing(C_Spacing)
				setContentsmargins(0,0,0,0)
			}
			LayoutButtonRow[Row].AddWidget(TitleNum[Row])
			for Col = 1 to Size step 1 { 
				### Create PUSH BUTTONS
				Button[Row][Col] = new QPushButton(win)
				{
					### Button[Row][Col] { setIcon(new qIcon(new qPixMap(AppFile("empty.jpg"))))  setIconSize(new qSize(bWidth,bHeight)) }
					### Button[Row][Col] { setStyleSheet(C_ButtonEmptyStyle) }
					setClickEvent("pPlay("+string(Row)+","+string(Col)+")")
					### CLICK PLAY MOVE >>> pPlay
					setSizePolicy(1,1)
				}
				LayoutButtonRow[Row].AddWidget(Button[Row][Col])
				### Widget - Add HORIZONTAL BUTTON
			} 
			LayoutButtonMain.AddLayout(LayoutButtonRow[Row])
			### Layout - Add ROW of Buttons
		} 
		###------------------------------------------------
		### Horizontal Row Bottom
		LayoutDataRow = new QHBoxLayout()
		{
			setSpacing(C_Spacing)
			setContentsMargins(0,0,0,0)
		}
		LayoutDataRow.AddWidget(PlayScoreBlack)
		LayoutDataRow.AddWidget(PlayScoreWhite)
		LayoutDataRow.AddWidget(NextMove)
		LayoutButtonMain.AddLayout(LayoutDataRow)
		LayoutNewGameRow = new QHBoxLayout()
		{
			setSpacing(C_Spacing)
			setContentsMargins(0,0,0,0)
		}
		LayoutNewGameRow.AddWidget(NewGame)
		LayoutNewGameRow.AddWidget(SkipTurn)
		LayoutButtonMain.AddLayout(LayoutNewGameRow)
		LayoutButtonMain.AddWidget(StatusBar1)
		setLayout(LayoutButtonMain)
		###---------------------------------------------
		pStart()
		show()
	}
	exec()
}
###========================================
###========================================
### GAME START
func pStart () { 
	see nl+"===== START START ====="+nl+nl
	FlagSkipTurn = 1
	bArray = List(8,8)
	for Row = 1 to Size step 1 { 
		for Col = 1 to Size step 1 { 
			bArray[Row][Col] = "E"
			### E-Empty cell
			Button[Row][Col] {
				setIcon( new qIcon( new qPixMap(AppFile("empty.jpg"))))
				setIconSize( new qSize(bWidth,bHeight))
			}
			Button[Row][Col] {
				setStyleSheet(C_ButtonEmptyStyle)
			}
			### Needed to fill Square, image too small
			Button[Row][Col].setenabled(true)
			Button[Row][Col].blockSignals(false)
			### ??? Goes back to Complement Color ???
		} 
	} 
	Statusbar1.showMessage("Message:",0)
	curColor = "B"
	### 1
	Score = 0
	MoveNumber = 1
	TransScript = list(1)
	NextMove.settext("Next Move: Black ")
	PlayScoreBlack.settext("Black Score: 2")
	PlayScoreWhite.settext("White Score: 2")
	Button[4][4] {
		setIcon( new qIcon( new qPixMap(AppFile("Black.png"))))
		setIconSize( new qSize(bWidth,bHeight))
	}
	Button[5][5] {
		setIcon( new qIcon( new qPixMap(AppFile("Black.png"))))
		setIconSize( new qSize(bWidth,bHeight))
	}
	Button[4][5] {
		setIcon( new qIcon( new qPixMap(AppFile("White.png"))))
		setIconSize( new qSize(bWidth,bHeight))
	}
	Button[5][4] {
		setIcon( new qIcon( new qPixMap(AppFile("White.png"))))
		setIconSize( new qSize(bWidth,bHeight))
	}
	Button[4][4].blockSignals(true)
	### Leave True Color
	Button[4][5].blockSignals(true)
	### Leave True Color
	Button[5][4].blockSignals(true)
	### Leave True Color
	Button[5][5].blockSignals(true)
	### Leave True Color
	bArray[4][4] = "B"
	bArray[5][5] = "B"
	bArray[4][5] = "W"
	bArray[5][4] = "W"
	return 
	###--------------------------------
	### SCORE DISPLAY
} 
func sumMove () { 
	sumMoveBlack = 0
	sumMoveWhite = 0
	sumEmptyCells = 0
	for Row = 1 to Size step 1 { 
		for Col = 1 to Size step 1 { 
			if bArray[Row][Col] = "B" { 
				sumMoveBlack++
			} 
			if bArray[Row][Col] = "W" { 
				sumMoveWhite++
			} 
			if bArray[Row][Col] = "E" { 
				sumEmptyCells++
			} 
		} 
	} 
	###---------------------------------
	###Check is any Cells left to Play
	if sumEmptyCells = 0 { 
		Msg = "Game Over."+nl+"No more squares left to Play."
		MsgBox(Msg)
		return 
	} 
	PlayScoreBlack.settext("Black Score: "+sumMoveBlack)
	PlayScoreWhite.settext("White Score: "+sumMoveWhite)
	return 
	###=======================================================
	### PLAY MOVE - qPushButton Clicked
} 
func pPlay (Row,Col) { 
	RowPlayed = Row
	ColPlayed = Col
	ColorPlayed = curColor
	FlagSkipTurn = 0
	if curColor = "B" { 
		otherColor = "W"
		else
			otherColor = "B"
	} 
	###------------------------
	### SKIP TURN CHECK
	### Set by PushButton-SkipTurn call to Func pSkipTurn
	if FlagSkipTurn = 1 { 
		FlagSkipTurn = 0
		return 
	} 
	see nl+"------------------------"+nl+nl
	see "CLICK Row-Col: "+ColorPlayed+" "+Row+"-"+Col+nl
	###---------------------------
	### TransScript Record Moves
	Letter = char(64+Col)
	###
	if curColor = "B" { 
		MovePlayed = ""+MoveNumber+"-"+"B"+"-"+Row+"-"+Letter
		NextMove.setstylesheet(C_ButtonGrayStyle)
		NextMove.settext("Next Move: White ")
		else
			MovePlayed = ""+MoveNumber+"-"+"W"+"-"+Row+"-"+Letter
			NextMove.setstylesheet(C_ButtonOrangeStyle)
			NextMove.settext("Next Move: Black ")
	} 
	TranScript = Add(TransScript,MovePlayed)
	MoveNumber++
	see "TransScript: "+nl
	see TransScript
	see nl
	###-------------------------
	###-------------------------------------------------
	### Make a Copy of Current Board for Flip Animation
	for h = 1 to Size step 1 { 
		for v = 1 to Size step 1 { 
			oldArray[h][v] = bArray[h][v]
		} 
	} 
	###------------------------------------
	### COLOR PLAYED Button and Disable
	### RECORD the button in bArray
	FlagFlip = 0
	Statusbar1.showMessage("Message:",0)
	### Current BLACK
	if curColor = "B" { 
		bArray[Row][Col] = "B"
		Button[Row][Col] {
			setIcon( new qIcon( new qPixMap(AppFile("Black.png"))))
			setIconSize( new qSize(bWidth,bHeight))
		}
		CheckDiagonals(Row,Col,curColor)
		### >>>> CHECK Diagonals
		elseif curColor = "W"
			### Current WHITE
			bArray[Row][Col] = "W"
			Button[Row][Col] {
				setIcon( new qIcon( new qPixMap(AppFile("White.png"))))
				setIconSize( new qSize(bWidth,bHeight))
			}
			CheckDiagonals(Row,Col,curColor)
			### >>>> CHECK Diagonals
	} 
	###======================================================================================
	###-----------------------------------------------
	### Check if FlagFlip was SET , Else Illegal Move
	### Restore NextMove
	### Restore EmptyCell Color and EnableEvents
	see "FlagFlip: "+FlagFlip+nl
	### Report Move returned INVALID=0 - No Flips Possible
	if FlagFlip = 0 { 
		Msg = "Message: "+bArray[RowPlayed][ColPlayed]+" "+ColPlayed+"-"+RowPlayed+" Move INVALID. "+"No Flips Possible"
		Statusbar1.showMessage(Msg,0)
		### Restore OLD Board array
		for h = 1 to Size step 1 { 
			for v = 1 to Size step 1 { 
				bArray[h][v] = oldArray[h][v]
			} 
		} 
		see "ColorPlayed: "+curColor+" "+RowPlayed+"-"+ColPlayed+nl
		### NO Flip -- Stay with same Color
		if curColor = "B" { 
			NextMove.setstylesheet(C_ButtonOrangestyle)
			NextMove.settext("Next Move: Black.... ")
		} 
		### NO Flip -- Stay with same Color
		if curColor = "W" { 
			NextMove.setstylesheet(C_ButtonGrayStyle)
			NextMove.settext("Next Move: White.... ")
		} 
		Button[Row][Col] {
			setIcon( new qIcon( new qPixMap(AppFile("empty.jpg"))))
			setIconSize( new qSize(bWidth,bHeight))
		}
		Button[RowPlayed][ColPlayed].setenabled(true)
		return 
		### INVALID - NO FLIPS
	} 
	###======================================================================================
	###----------------------------------------
	### COLOR FLIPPED Buttons and Disable Click
	### ANIMATION of FLIPS
	### DRAW DOS Chart
	Statusbar1.showMessage("Message:",0)
	see "Color bArray_____"+nl
	for Row = 1 to Size step 1 { 
		see nl+row+" "
		for Col = 1 to Size step 1 { 
			if bArray[Row][Col] = "W" { 
				see "W "
				### Flip ANIMATION
				if oldArray[Row][Col] != bArray[Row][Col] { 
					if !isMobile() { 
						app.processevents()
						sleep(0.2)
					} 
				} 
				Button[Row][Col] {
					setIcon( new qIcon( new qPixMap(AppFile("White.png"))))
					setIconSize( new qSize(bWidth,bHeight))
				}
			} 
			if bArray[Row][Col] = "B" { 
				see "B "
				### Flip ANIMATION
				if oldArray[Row][Col] != bArray[Row][Col] { 
					if !isMobile() { 
						app.processevents()
						sleep(0.2)
					} 
				} 
				Button[Row][Col] {
					setIcon( new qIcon( new qPixMap(AppFile("Black.png"))))
					setIconSize( new qSize(bWidth,bHeight))
				}
			} 
			if bArray[Row][Col] = "E" { 
				see ". "
			} 
		} 
	} 
	see nl
	###-------------------------------------------------
	### TRUE COLORS
	for h = 1 to Size step 1 { 
		for v = 1 to Size step 1 { 
			if bArray[h][v] != "E" { 
				Button[h][v].blockSignals(true)
				### ??? Goes back to Complement Color ???
			} 
		} 
	} 
	###------------------
	### NEXT COLOR Turn
	curColor = otherColor
	sumMove()
	return 
	###=============================================
	### CHECK ALL DIRECTIONS
} 
func CheckDiagonals (Row,Col,curColor) { 
	#SEE nl+ "##################################"+nl
	#SEE "CellCLICK: Row-Col-Color: "+ Row + "-"+ Col +" "+ curColor  +nl
	###---------------------------
	### Diag-  NORTH-SOUTH Col
	### COPY to ROW to FLAT
	dArray = list(9)
	for Cell = 1 to 9 step 1 { 
		dArray[Cell] = "E"
	} 
	#See nl+"Copy-NORTH-SOUTH-To-dArray---->>>: "
	for Cell = 1 to 8 step 1 { 
		dArray[Cell] = bArray[Cell][Col]
		### ROW ---> FLAT
		#SEE " "+ dArray[Cell]
	} 
	#See nl
	CheckFlips(Row,curColor)
	### COPY BACK FLAT to COL
	#See "Copy-dArray-To-NORTH-SOUTH----<<<: "
	for Cell = 1 to 8 step 1 { 
		bArray[Cell][Col] = dArray[Cell]
		### ROW <--- FLAT
		#See " "+ dArray[Cell]
	} 
	#see nl
	###---------------------------
	### Diag-  EAST-WEST Row
	### COPY to ROW to FLAT
	dArray = list(9)
	for Cell = 1 to 9 step 1 { 
		dArray[Cell] = "E"
	} 
	#See nl+"Copy-EAST-WEST-To-dArray---->>>  : "
	for Cell = 1 to 8 step 1 { 
		dArray[Cell] = bArray[ROW][Cell]
		###  COL ----> FLAT
		#SEE " "+ dArray[Cell]
	} 
	#see nl
	CheckFlips(Col,curColor)
	### COPY BACK FLAT to ROW
	#See "Copy-dArray-To-EAST-WEST------<<<: "
	for Cell = 1 to 8 step 1 { 
		bArray[Row][Cell] = dArray[Cell]
		###  COL <---- FLAT
		#See " "+ dArray[Cell]
	} 
	#see nl
	###================================================
	### Diag- DECLINE \ 1-A to 8-H
	### COPY to ROW to FLAT
	dArray = list(9)
	for Cell = 1 to 9 step 1 { 
		dArray[Cell] = "E"
	} 
	### Backup from current Row-Col till one of them = 1
	Diff = Row-Col
	if Diff = 0 { 
		StartRow = 1
		StartCol = 1
	} 
	if Diff > 0 { 
		StartRow = Row-Col+1
		StartCol = 1
	} 
	if Diff < 0 { 
		StartRow = 1
		StartCol = Col-Row+1
	} 
	DRow = StartRow
	DCol = StartCol
	#SEE nl+"DECLINE Diff: "+ Diff +" StartRow: "+ StartRow +" StartCol "+ StartCol +nl
	#See "Copy-DECLINE-To-dArray ------->>>: "
	for Cell = 1 to 8 step 1 { 
		dArray[Cell] = bArray[DRow][DCol]
		### ROW\COL ---> FLAT
		DRow++
		DCol++
		#SEE " "+ dArray[Cell]
		if DRow > 8 OR DCol > 8 { 
			exit 1
		} 
	} 
	#See nl
	CheckFlips((Row-StartRow+1),curColor)
	### Line up dArray and Row for Cell Clicked
	### COPY BACK FLAT to ROW
	DRow = StartRow
	DCol = StartCol
	#See "Copy-dArray-To-DECLINE--------<<<: "
	for Cell = 1 to 8 step 1 { 
		bArray[DRow][DCol] = dArray[Cell]
		### ROW\COL <--- FLAT
		#See " "+ dArray[Cell]
		DRow++
		DCol++
		if DRow > 8 OR DCol > 8 { 
			exit 1
		} 
	} 
	#see nl
	###===============================================
	### Diag- INCLINE / 8-A to 1-H
	### COPY to ROW to FLAT
	dArray = list(9)
	for Cell = 1 to 9 step 1 { 
		dArray[Cell] = "E"
	} 
	### Backup from current Row-Col till one of them = 1
	Diff = Row-(9-Col)
	if Diff = 0 { 
		StartRow = 8
		StartCol = 1
	} 
	if Diff > 0 { 
		StartRow = 8
		StartCol = Col-(8-Row)
	} 
	if Diff < 0 { 
		StartRow = Col+(Row-1)
		StartCol = 1
	} 
	DRow = StartRow
	DCol = StartCol
	#SEE nl+"INCLINE Diff: "+ Diff +" StartRow: "+ StartRow +" StartCol "+ StartCol +nl
	#See "Copy-INCLINE-To-dArray-------->>>: "
	for Cell = 1 to 8 step 1 { 
		dArray[Cell] = bArray[DRow][DCol]
		### ROW\COL ---> FLAT
		DRow--
		DCol++
		#SEE " "+ dArray[Cell]
		if DRow < 1 OR DCol > 8 { 
			exit 1
		} 
	} 
	#See nl
	CheckFlips((Col-StartCol+1),curColor)
	### Line up dArray and Col for Cell Clicked
	### COPY BACK FLAT to ROW
	DRow = StartRow
	DCol = StartCol
	#See "Copy-dArray-To-INCLINE--------<<<: "
	for Cell = 1 to 8 step 1 { 
		bArray[DRow][DCol] = dArray[Cell]
		### ROW\COL <--- FLAT
		#See " "+ dArray[Cell]
		DRow--
		DCol++
		if DRow < 1 OR DCol > 8 { 
			exit 1
		} 
	} 
	#see nl
	###--------------------------------------------
	return 
	###======================================================
	### CHECK FLIPS
	###
	### dArray  Pattern to Check
	###               v              Click 4
	###         1 2 3 4 5 6 7 8 .
	###         e e B B W W B e .
	###               s     f        4--7  Right match
	###
	###         B W W B W . B e
	###         s     f              1--4  Left match
	###         B W e B W . W B
	###         s   - s   -   e      1--cancel-3  4--cancel-7   8  NO match
	###
	###           V
	###         e B W B e B W        2-4
	###           s   f - s -
	###-----------------------------------------------------
} 
func CheckFlips (cellClick,curColor) { 
	#SEE "CheckFlips: CellClick "+ cellClick +" "+ curColor +nl
	aFlip = list(9)
	### Which Cells to Flip, OverFlop when Cell +1 = 9
	aFlip[9] = "."
	### Use Dot, NOT B,W,E on Edge +1
	FlipCell = 0
	otherColor = "E"
	if curColor = "B" { 
		otherColor = "W"
	} 
	if curColor = "W" { 
		otherColor = "B"
	} 
	FlagStart = 0
	### dArray = [9]
	### 8 => OverFlow on array[8+1]
	### START ---
	for cell = 1 to 8 step 1 { 
		###  ..BW..
		if dArray[cell] = curColor AND dArray[cell+1] = otherColor { 
			cellStart = cell
			###  ..^...  FlagStart = 1
			FlagStart = 1
			#SEE "Start__: "+ FlagStart +" "+ cellStart +nl
			### END ---
			elseif dArray[cell] = otherColor AND dArray[cell+1] = curColor
				###  ..WB..
				cellEnd = cell+1
				###  ...^..
				#SEE "End____: "+ FlagStart +" "+ cellEnd +nl
				if FlagStart = 1 AND ((cellStart = cellClick) OR (cellEnd = cellClick)) { 
					FlipStart = cellStart+1
					###  ..BWB..
					FlipEnd = cellEnd-1
					###  ..^v^..
					#SEE "FLIPPER: "+ FlipStart +"-"+ FlipEnd + " >>> "
					for n = (FlipStart) to (FlipEnd) step 1 { 
						aFlip[n] = 1
						#SEE " "+ n
					} 
					#SEE nl
					FlagStart = 0
				} 
				### CANCEL ---
			elseif dArray[cell] = "E" AND FlagStart = 1
				###  EB, EW, EE => FlagStart = 0
				FlagStart = 0
				#SEE "Start_v: "+ FlagStart +" "+ cell +nl
		} 
	} 
	#SEE "FLIP___: "
	#SEE  aFlip[n]
	for n = 1 to 9 step 1 { 
		if aFlip[n] = 1 { 
			FlagFlip = 1
			dArray[n] = curColor
			### FLIP color
		} 
	} 
	#SEE nl
	#SEE "dArray-Changed-Now_______________: "
	#for n = 1 to 8  SEE " "+ dArray[n]  next #SEE nl
	#See "EndCheck:"+nl
	return 
	###============================================
	###============================================
	###--------------------------------
	### MESSAGE BOX
} 
func msgBox (cText) { 
	mb = new qMessageBox(win)
	{
		setWindowTitle("Othello Game")
		setText(cText)
		setstylesheet(C_ButtonBlueStyle)
		setstandardButtons(QMessageBox_Discard|QMessageBox_OK)
		result = exec()
	}
	return 
	###---------------------------------------------------------------------
	### SKIP TURN - Player can skip turn when there are no playable squares
} 
func pSkipTurn  { 
	FlagSkipTurn = 1
	if curColor = "B" { 
		MovePlayed = ""+MoveNumber+"-"+"B"+"-"+Row+"-"+Letter
		NextMove.setstylesheet(C_ButtonGrayStyle)
		NextMove.settext("Next Move: White ")
		curColor = "W"
		else
			MovePlayed = ""+MoveNumber+"-"+"W"+"-"+Row+"-"+Letter
			NextMove.setstylesheet(C_ButtonOrangeStyle)
			NextMove.settext("Next Move: Black ")
			curColor = "B"
	} 
	if curColor = "B" { 
		otherColor = "W"
		else
			otherColor = "B"
	} 
	MovePlayed = ""+MoveNumber+"-"+otherColor+"-Skipped-Move"
	TranScript = Add(TransScript,MovePlayed)
	MoveNumber++
	see "TransScript: "+nl
	see TransScript
	see nl
	return 
	###--------------------------------
} 
