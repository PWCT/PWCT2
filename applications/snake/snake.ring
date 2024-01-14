# The Snake Game  				   	
# Game Data
# Map Size
C_LEVEL_ROWSCOUNT = 20
C_LEVEL_COLSCOUNT = 27
# Map Items
C_EMPTY = 1
C_WALL = 2
C_DOOR = 3
# The Map Data
aLevel = list(C_LEVEL_ROWSCOUNT)
for nRow = 1 to C_LEVEL_ROWSCOUNT step 1 { 
	aLevel[nRow] = list(C_LEVEL_COLSCOUNT)
	for nCol = 1 to C_LEVEL_COLSCOUNT step 1 { 
		aLevel[nRow][nCol] = C_EMPTY
	} 
} 
# Add the Snake
aSnake = [[3,3],[3,4],[3,5]]
aLevel[3][3] = C_WALL
aLevel[3][4] = C_WALL
aLevel[3][5] = C_WALL
cDirection = :Right
# Create the first Door
# For Game Restart
NewDoor()
aLevelCopy = aLevel
# Timers
nKeyClock = clock()
# Game Over
nMoveClock = clock()
lGameOver = False
# Speed
nKeyboardSpeed = 10
nMovementSpeed = 15
load "gameengine.ring"
func main  { 
	GE_SCREEN_W = 800
	GE_SCREEN_H = 600
	oGame = new Game
	{
		title = "Snake"
		icon = "images/door.jpg"
		Map {
			blockwidth = 30
			blockheight = 30
			aMap = aLevel
			aImages = ["images/empty.jpg","images/wall.jpg","images/door.jpg"]
			keypress = func oGame,oSelf,nkey {
				if lGameOver { 
					return 
				} 
				# Avoid getting many keys in short time
				if (clock()-nKeyClock) < clockspersecond()/nKeyboardSpeed { 
					return 
				} 
				nKeyClock = Clock()
				switch nkey { 
					case Key_Esc
						oGame.Shutdown()
					case Key_Space
						Restart(oGame)
					case Key_Right
						if cDirection = :UP OR cDirection = :Down { 
							cDirection = :Right
						} 
					case Key_Left
						if cDirection = :UP OR cDirection = :Down { 
							cDirection = :Left
						} 
					case Key_Up
						if cDirection = :Left OR cDirection = :Right { 
							cDirection = :Up
						} 
					case Key_Down
						if cDirection = :Left OR cDirection = :Right { 
							cDirection = :Down
						} 
				} 
			}
			state = func oGame,oSelf {
				if clock()-nMoveClock >= clockspersecond()/nMovementSpeed { 
					nMoveClock = clock()
					MoveSnake(oGame,oSelf)
				} 
			}
		}
	}
} 
func MoveSnake oGame,oMap { 
	if lGameOver { 
		return 
	} 
	aHead = aSnake[len(aSnake)]
	switch cDirection { 
		case :right
			if aHead[2] = C_LEVEL_COLSCOUNT { 
				DisplayGameOver(oGame)
				return 
			} 
			aHead[2]++
		case :left
			if aHead[2] = 1 { 
				DisplayGameOver(oGame)
				return 
			} 
			aHead[2]--
		case :up
			if aHead[1] = 1 { 
				DisplayGameOver(oGame)
				return 
			} 
			aHead[1]--
		case :down
			if aHead[1] = C_LEVEL_ROWSCOUNT { 
				DisplayGameOver(oGame)
				return 
			} 
			aHead[1]++
	} 
	if aLevel[aHead[1]][aHead[2]] = C_EMPTY { 
		HideCell(aSnake[1])
		del(aSnake,1)
		elseif aLevel[aHead[1]][aHead[2]] = C_DOOR
			NewDoor()
		else
			DisplayGameOver(oGame)
			return 
	} 
	aSnake+aHead
	ShowCell(aHead)
	UpdateGameMap(oGame)
} 
func NewDoor  { 
	lNewDoor = False
	while lNewDoor = False { 
		newY = 2+random(C_LEVEL_ROWSCOUNT-3)
		newX = 2+random(C_LEVEL_COLSCOUNT-3)
		if aLevel[newY][newX] = C_EMPTY { 
			aLevel[newY][newX] = C_DOOR
			lNewDoor = True
		} 
	} 
} 
func HideCell aCell { 
	aLevel[aCell[1]][aCell[2]] = C_EMPTY
} 
func ShowCell aCell { 
	aLevel[aCell[1]][aCell[2]] = C_WALL
} 
func UpdateGameMap oGame { 
	# The Map is our first object in Game Objects
	oGame.aObjects[1].aMap = aLevel
} 
func DisplayGameOver oGame { 
	if lGameOver { 
		return 
	} 
	lGameOver = True
	oGame {
		text {
			point = 800
			size = 30
			nStep = 9
			file = "fonts/pirulen.ttf"
			text = "Game Over !!!"
			x = 10
			y = 10
			state = func oGame,oSelf {
				if oSelf.y >= 800 { 
					oGame.Remove(oSelf.nIndex)
					Restart(oGame)
				} 
			}
		}
	}
} 
func Restart oGame { 
	# Restart the Level
	aLevel = aLevelCopy
	aSnake = [[3,3],[3,4],[3,5]]
	cDirection = :Right
	UpdateGameMap(oGame)
	lGameOver = False
} 
