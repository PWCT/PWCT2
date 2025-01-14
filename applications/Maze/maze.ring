# The Maze Game  				   	
# Game Data
aPlayer = [:Row = 3,:Col = 4]
# Get the Level Data ---> List Called aLevel
load "level.ring"
# For Game Restart
aLevelCopy = aLevel
aPlayerCopy = aPlayer
C_LEVEL_ROWSCOUNT = len(aLevel)
C_LEVEL_COLSCOUNT = len(aLevel[1])
C_EMPTY = 1
C_WALL = 2
C_PLAYER = 3
C_DOOR = 4
nKeyClock = clock()
lWin = False
load "gameengine.ring"
func main  { 
	GE_SCREEN_W = 800
	GE_SCREEN_H = 600
	oGame = new Game
	{
		title = "Maze"
		icon = "images/wall.jpg"
		Map {
			blockwidth = 30
			blockheight = 30
			aMap = aLevel
			aImages = ["images/empty.jpg","images/wall.jpg","images/player.jpg","images/door.jpg"]
			keypress = func oGame,oSelf,nkey {
				# Avoid getting many keys in short time
				if (clock()-nKeyClock) < clockspersecond()/10 { 
					return 
				} 
				nKeyClock = Clock()
				switch nkey { 
					case Key_Esc
						oGame.Shutdown()
					case Key_Space
						# Restart the Level
						aLevel = aLevelCopy
						aPlayer = aPlayerCopy
						UpdateGameMap(oGame)
						if lWin { 
							lWin = False
							oGame.Remove(oGame.Find(:YouWin).nIndex)
						} 
					case Key_Right
						if aPlayer[:col] < C_LEVEL_COLSCOUNT { 
							nRowDiff = 0
							nColDiff = 1
							MoveObject(oGame,aPlayer[:row],aPlayer[:col]+1)
						} 
					case Key_Left
						if aPlayer[:col] > 1 { 
							nRowDiff = 0
							nColDiff = -1
							MoveObject(oGame,aPlayer[:row],aPlayer[:col]-1)
						} 
					case Key_Up
						if aPlayer[:row] > 1 { 
							nRowDiff = -1
							nColDiff = 0
							MoveObject(oGame,aPlayer[:row]-1,aPlayer[:col])
						} 
					case Key_Down
						if aPlayer[:row] < C_LEVEL_ROWSCOUNT { 
							nRowDiff = 1
							nColDiff = 0
							MoveObject(oGame,aPlayer[:row]+1,aPlayer[:col])
						} 
				} 
				# Move the Camera with the player
				oSelf.y = max(-((max(aPlayer[:row],3)-3)*oSelf.BlockWidth),-oSelf.BlockWidth*10)
				oSelf.x = max(-((max(aPlayer[:col],4)-4)*oSelf.BlockWidth),-oSelf.BlockWidth*16)
			}
		}
	}
} 
func MoveObject oGame,nNewRow,nNewCol { 
	switch aLevel[nNewRow][nNewCol] { 
		case C_EMPTY
			aLevel[aPlayer[:row]][aPlayer[:col]] = C_EMPTY
			aLevel[nNewRow][nNewCol] = C_PLAYER
			UpdateGameMap(oGame)
			aPlayer[:row] = nNewRow
			aPlayer[:col] = nNewCol
		case C_DOOR
			aLevel[aPlayer[:row]][aPlayer[:col]] = C_EMPTY
			aLevel[nNewRow][nNewCol] = C_PLAYER
			UpdateGameMap(oGame)
			aPlayer[:row] = nNewRow
			aPlayer[:col] = nNewCol
			lWin = True
			DisplayYouWin(oGame)
	} 
	return 
} 
func UpdateGameMap oGame { 
	# The Map is our first object in Game Objects
	oGame.aObjects[1].aMap = aLevel
} 
func DisplayYouWin oGame { 
	oGame {
		text {
			name = :YouWin
			point = 400
			size = 30
			nStep = 9
			file = "fonts/pirulen.ttf"
			text = "You Win !!!"
			x = 500
			y = 10
		}
	}
} 
