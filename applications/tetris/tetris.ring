# Map Size
C_LEVEL_ROWSCOUNT = 20
C_LEVEL_COLSCOUNT = 10
# Map Items
C_EMPTY = 1
C_BLOCK = 2
# The Map Data
aLevel = []
# Block Data
clearLevelData()
aBlock = []
nShape = 1
cDirection = :Down
# For Game Restart
aLevelCopy = aLevel
# Timers
nKeyClock = clock()
nMoveClock = clock()
# Game Over
nRotateClock = clock()
lGameOver = False
# Speed
nKeyboardSpeed = 10
nMovementSpeed = 10
# Score
nScore = 0
# Rotation
nRotationIndex = 1
# ============================================================================#
# Game User Interface
# ============================================================================#
load "gameengine.ring"
func main  { 
	# Set the Window width & height
	GE_SCREEN_W = 300
	GE_SCREEN_H = 650
	oGame = new Game
	{
		# Set the Window title & icon
		title = "Tetris"
		icon = "images/block4.png"
		# Display the score!
		text {
			name = :Score
			size = 16
			file = "fonts/pirulen.ttf"
			x = 10
			y = 10
			color = rgb(0,0,0)
			animate = False
			text = "Score : "+nScore
		}
		# The Game Map is used for drawing the blocks
		Map {
			# Set a name for the object, to get it using oGame.Find()
			name = "map"
			# Leave a space for the Score text
			y = 50
			# Set the block width & height
			blockwidth = 30
			blockheight = 30
			# Load the Map Data
			aMap = aLevel
			aImages = ["images/empty.png","images/block1.png","images/block2.png","images/block3.png","images/block4.png","images/block5.png","images/block6.png"]
			# Respond to Keyboard Events
			keypress = func oGame,oSelf,nkey {
				# Don't respond if we have (Game Over)
				if lGameOver { 
					return 
				} 
				# Avoid getting many keys in short time
				if (clock()-nKeyClock) < clockspersecond()/nKeyboardSpeed { 
					return 
				} 
				# Check the key
				nKeyClock = Clock()
				switch nkey { 
					case Key_Esc
						oGame.Shutdown()
					case Key_Space
						Restart(oGame)
					case Key_Right
						cDirection = :Right
					case Key_Left
						cDirection = :Left
					case Key_Down
						nMovementSpeed = 100
						cDirection = :Down
					case Key_Up
						cDirection = :Rotate
				} 
			}
			# Update the State, i.e. Draw & Move the blocks!	
			state = func oGame,oSelf {
				if clock()-nMoveClock >= clockspersecond()/nMovementSpeed { 
					nMoveClock = clock()
					MoveBlock(oGame,oSelf)
				} 
			}
		}
		# Start the game by adding new block!
		AddNewShape(self)
	}
	# ============================================================================#
	# Game Logic
	# ============================================================================#
} 
func MoveBlock oGame,oMap { 
	# Don't move the blocks if we have (Game Over)
	if lGameOver { 
		return 
	} 
	# Display the Shape
	for t = len(aBlock) to 1 step -1 { 
		aHead = aBlock[t]
		ShowCell(aHead)
	} 
	UpdateGameMap(oGame)
	# Get a copy from the game data
	aLevelCopy = aLevel
	aBlockCopy = aBlock
	switch cDirection { 
		case :right
			if MoveRightOrLeft(oGame,oMap,aLevelCopy,aBlockCopy,C_LEVEL_COLSCOUNT,1) { 
				return 
			} 
		case :left
			if MoveRightOrLeft(oGame,oMap,aLevelCopy,aBlockCopy,1,-1) { 
				return 
			} 
		case :rotate
			if RotateShape(oGame,oMap,aLevelCopy,aBlockCopy) { 
				return 
			} 
		case :down
			if MoveDown(oGame,oMap,aLevelCopy,aBlockCopy) { 
				return 
			} 
	} 
	UpdateGameMap(oGame)
} 
func MoveRightOrLeft oGame,oMap,aLevelCopy,aBlockCopy,nLimit,nIncrement { 
	# Next move will be Down
	cDirection = :Down
	# Don't go outsize the screen (Right|Left Corner)
	for t = 1 to len(aBlock) step 1 { 
		aHead = aBlock[t]
		# Be sure we have a move down!
		if aHead[2] = nLimit { 
			MoveBlock(oGame,oMap)
			return True
		} 
	} 
	# Hide Shape Blocks, Then Move one step to the Right|Left	
	for t = 1 to len(aBlock) step 1 { 
		aHead = aBlock[t]
		HideCell(aHead)
		aHead[2] = aHead[2]+nIncrement
		aBlock[t] = aHead
	} 
	# Move the shape only if the move is possible for all of the shape blocks	
	if MoveShapeIfPossible(oGame,oMap,aLevelCopy,aBlockCopy,True) { 
		return True
	} 
	# Be sure we have a move down! even if someone keep pressing the Right key
	MoveBlock(oGame,oMap)
	return False
	# False means Return from the end of the function
} 
func MoveShapeIfPossible oGame,oMap,aLevelCopy,aBlockCopy,lCallMoveDown { 
	# Move the shape only if the move is possible for all of the shape blocks	
	for t = 1 to len(aBlock) step 1 { 
		aHead = aBlock[t]
		if aHead[1] < 1 OR aHead[2] < 1 { 
			loop 1
		} 
		if aLevel[aHead[1]][aHead[2]]! = C_EMPTY { 
			aLevel = aLevelCopy
			aBlock = aBlockCopy
			# Be sure we have a move down!
			if lCallMoveDown { 
				ShowShape()
				MoveBlock(oGame,oMap)
			} 
			return True
		} 
		ShowCell(aHead)
	} 
	return False
} 
func MoveDown oGame,oMap,aLevelCopy,aBlockCopy { 
	# Hide Shape Blocks then move one step down
	for t = len(aBlock) to 1 step -1 { 
		aHead = aBlock[t]
		if aHead[1] = C_LEVEL_ROWSCOUNT { 
			aLevel = aLevelCopy
			NewShape(oGame)
			return True
		} 
		HideCell(aHead)
		aHead[1]++
		aBlock[t] = aHead
	} 
	# Move the shape only if the move is possible for all of the shape blocks	
	for t = 1 to len(aBlock) step 1 { 
		aHead = aBlock[t]
		if aHead[1] < 1 OR aHead[2] < 1 { 
			loop 1
		} 
		if aLevel[aHead[1]][aHead[2]]! = C_EMPTY { 
			aLevel = aLevelCopy
			NewShape(oGame)
			return True
		} 
		ShowCell(aHead)
	} 
	# Tells caller that Return from the end of the function
	return False
} 
func HideCell aCell { 
	# Check if we are outside the screen
	if IsOutsideTheScreen(aCell) { 
		return 
	} 
	# Hide the block
	aLevel[aCell[1]][aCell[2]] = C_EMPTY
} 
func ShowCell aCell { 
	# Check if we are outside the screen
	if IsOutsideTheScreen(aCell) { 
		return 
	} 
	# Dispaly the block
	aLevel[aCell[1]][aCell[2]] = C_BLOCK
} 
func IsOutsideTheScreen aCell { 
	# Check if a point is outside the screen corners
	x = aCell[2]
	y = aCell[1]
	if x < 1 OR y < 1 OR x > C_LEVEL_COLSCOUNT OR y > C_LEVEL_ROWSCOUNT { 
		return True
	} 
	return False
} 
func UpdateGameMap oGame { 
	# Move the Map Data from the aLevel list to the Map Object (For Dispaly)
	oGame.find(:Map).aMap = aLevel
} 
func DisplayGameOver oGame { 
	# Call this function one time
	if lGameOver { 
		return 
	} 
	lGameOver = True
	# Create a Text Object for the Game Over message
	oGame {
		text {
			size = 30
			file = "fonts/pirulen.ttf"
			text = "Game Over !!!"
			x = 5
			y = 10
			color = rgb(0,0,0)
			# Animation Part =================================================
			animate = true
			# Use Animation
			direction = GE_DIRECTION_INCVERTICAL
			# Increase y
			point = 550
			# Continue until y=500
			nStep = 12
			# Each time y+= 6
			# =================================================================
			state = func oGame,oSelf {
				if oSelf.y >= oSelf.point { 
					oGame.Remove(oSelf.nIndex)
					Restart(oGame)
				} 
			}
		}
	}
} 
func Restart oGame { 
	# Set The Map Data
	# Add the Block
	clearLevelData()
	AddNewShape(oGame)
	# Restart the Level
	cDirection = :Down
	UpdateGameMap(oGame)
	lGameOver = False
	# Set the Speed
	nMovementSpeed = 10
	# Set the score
	nScore = 0
	oGame.find(:Score).text = "Score : "+nScore
	# Rotation
	nRotationIndex = 1
} 
func ClearLevelData  { 
	# Set all cells to Empty
	aLevel = list(C_LEVEL_ROWSCOUNT)
	for nRow = 1 to C_LEVEL_ROWSCOUNT step 1 { 
		aLevel[nRow] = list(C_LEVEL_COLSCOUNT)
		for nCol = 1 to C_LEVEL_COLSCOUNT step 1 { 
			aLevel[nRow][nCol] = C_EMPTY
		} 
	} 
} 
func NewShape oGame { 
	# Before inserting new blocks, check complete rows and game over 	
	CheckCompleteRow(oGame)
	CheckGameOver(oGame)
	AddNewShape(oGame)
} 
func AddNewShape oGame { 
	# Support different shapes
	nShape = Random(6)+1
	# The second cell is used as a center for the Rotation
	switch nShape { 
		case 1
			# O
			aBlock = [[1,1],[2,1],[1,2],[2,2]]
		case 2
			# I
			aBlock = [[1,2],[2,2],[3,2],[4,2]]
		case 3
			# S
			aBlock = [[3,1],[3,2],[2,2],[2,3]]
		case 4
			# Z
			aBlock = [[1,1],[1,2],[2,2],[2,3]]
		case 5
			# L
			aBlock = [[1,1],[2,1],[3,1],[3,2]]
		case 6
			# J
			aBlock = [[1,2],[2,2],[3,2],[3,1]]
		case 7
			# T
			aBlock = [[2,1],[2,2],[2,3],[3,2]]
	} 
	# Start the Shape outside the screen
	for t = 1 to len(aBlock) step 1 { 
		aBlock[t][1] = aBlock[t][1]-4
	} 
	# Start the Shape at random position 	
	nXMove = random(6)
	if nXMove! = 0 { 
		for t = 1 to len(aBlock) step 1 { 
			aBlock[t][2] += nXMove
		} 
	} 
	# Select shape style to be different from the previous one	
	nOldStyle = C_BLOCK
	C_BLOCK = random(6)+2
	if nOldStyle = C_BLOCK { 
		C_BLOCK++
	} 
	if C_BLOCK > 7 { 
		C_BLOCK = 2
	} 
	# Display the block and set the default speed
	ShowShape()
	nMovementSpeed = 10
	nRotationIndex = 1
} 
func ShowShape  { 
	# Show the different cells in the shape
	for t = len(aBlock) to 1 step -1 { 
		aHead = aBlock[t]
		ShowCell(aHead)
	} 
} 
func CheckGameOver oGame { 
	# When we can't insert new shapes, display (Game Over) message!
	for t = 1 to len(aBlock) step 1 { 
		if aBlock[t][1] < 1 OR aBlock[t][2] < 1 { 
			DisplayGameOver(oGame)
			exit 1
		} 
	} 
} 
func CheckCompleteRow oGame { 
	# Scan Rows from the bottom to up
	for nRow = C_LEVEL_ROWSCOUNT to 1 step -1 { 
		lDeleteRow = True
		# Check if we can't delete a row
		for nCol = 1 to C_LEVEL_COLSCOUNT step 1 { 
			if aLevel[nRow][nCol] = C_EMPTY { 
				lDeleteRow = False
				exit 1
			} 
		} 
		# Delete the row 			
		# Increase the score
		if lDeleteRow { 
			nScore += 10
			# Remove the row blocks
			del(aLevel,nRow)
			# Move other rows down
			insert(aLevel,0,list(C_LEVEL_COLSCOUNT))
			for nCol = 1 to C_LEVEL_COLSCOUNT step 1 { 
				aLevel[1][nCol] = C_EMPTY
			} 
			UpdateGameMap(oGame)
			# Update the Score
			oGame.find(:Score).text = "Score : "+nScore
			# Draw Objects
			# Wait half second
			oGame.DrawObjs()
			Delay(0.5)
			# Support nested rows deletion
			nRow++
		} 
	} 
	UpdateGameMap(oGame)
} 
func Delay nTime { 
	# Wait for some time (nTime in seconds)
	t1 = clock()
	while clock()-t1 < (nTime*Clockspersecond()) { 
	} 
} 
func RotateShape oGame,oMap,aLevelCopy,aBlockCopy { 
	cDirection = :Down
	# Don't respond many times in short time
	if (clock()-nRotateClock)/clockspersecond() < 0.3 { 
		MoveBlock(oGame,oMap)
		return 
	} 
	# Avoid O Shape
	nRotateClock = clock()
	if nShape = 1 { 
		return 
	} 
	# Apply the rotation
	for t = 1 to len(aBlock) step 1 { 
		aHead = aBlock[t]
		HideCell(aHead)
		y1 = aBlock[t][1]
		x1 = aBlock[t][2]
		py = aBlockCopy[2][1]
		px = aBlockCopy[2][2]
		x2 = (y1+px-py)
		y2 = (px+py-x1)
		# I Shape Rotation
		if nShape = 2 { 
			switch nRotationIndex { 
				case 1
					# Do Nothing
				case 2
					# Increment Y,X
					x2++
					y2++
				case 3
					# Do Nothing
				case 4
					# Decrement Y,X
					x2--
					y2--
			} 
		} 
		aBlock[t][1] = y2
		aBlock[t][2] = x2
		# Avoid rotation outside the screen borders
		if IsOutsideTheScreen(aBlock[t]) { 
			aBlock = aBlockCopy
			return True
		} 
	} 
	# Check for collisions 	
	if MoveShapeIfPossible(oGame,oMap,aLevelCopy,aBlockCopy,True) { 
		return True
	} 
	# We did the rotation, Update the Rotation index
	nRotationIndex++
	if nRotationIndex = 5 { 
		nRotationIndex = 1
	} 
	# Be sure we have a move down! even if someone keep pressing the Right key
	MoveBlock(oGame,oMap)
} 
