# The Escape Game  				   	
# Game Data
# Map Size
C_LEVEL_ROWSCOUNT = 19
C_LEVEL_COLSCOUNT = 27
# Map Items
C_EMPTY = 1
C_SNAKE = 2
C_FOOD = 3
C_PLAYER = 4
C_DIE = 5
# The Map Data
aLevel = list(C_LEVEL_ROWSCOUNT)
for nRow = 1 to C_LEVEL_ROWSCOUNT step 1 { 
	aLevel[nRow] = list(C_LEVEL_COLSCOUNT)
	for nCol = 1 to C_LEVEL_COLSCOUNT step 1 { 
		aLevel[nRow][nCol] = C_EMPTY
	} 
} 
# Player
aPlayer = [:Row = 13,:Col = 4]
aLevel[13][4] = C_PLAYER
# Add the Snake
aSnake = [[3,3],[3,4],[3,5]]
aLevel[3][3] = C_SNAKE
aLevel[3][4] = C_SNAKE
aLevel[3][5] = C_SNAKE
cDirection = :Right
# For Game Restart
aLevelCopy = aLevel
# Create the first Food
oldY = 0
oldX = 0
newY = 0
newX = 0
# Timers
NewFood()
nKeyClock = clock()
# Game Over
nMoveClock = clock()
lGameOver = False
# Speed
nKeyboardSpeed = 15
nMovementSpeed = 15
# Score
nScore = 0
load "gameengine.ring"
func main  { 
	GE_SCREEN_W = 800
	GE_SCREEN_H = 600
	oGame = new Game
	{
		title = "Escape Game"
		icon = "images/empty.jpg"
		Map {
			name = :Map
			Y = 30
			blockwidth = 30
			blockheight = 30
			aMap = aLevel
			aImages = ["images/empty.jpg","images/wall.jpg","images/door.jpg","images/player.jpg","images/die.jpg"]
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
						if aPlayer[:col] < C_LEVEL_COLSCOUNT { 
							nRowDiff = 0
							nColDiff = 1
							MovePlayer(oGame,aPlayer[:row],aPlayer[:col]+1)
						} 
					case Key_Left
						if aPlayer[:col] > 1 { 
							nRowDiff = 0
							nColDiff = -1
							MovePlayer(oGame,aPlayer[:row],aPlayer[:col]-1)
						} 
					case Key_Up
						if aPlayer[:row] > 1 { 
							nRowDiff = -1
							nColDiff = 0
							MovePlayer(oGame,aPlayer[:row]-1,aPlayer[:col])
						} 
					case Key_Down
						if aPlayer[:row] < C_LEVEL_ROWSCOUNT { 
							nRowDiff = 1
							nColDiff = 0
							MovePlayer(oGame,aPlayer[:row]+1,aPlayer[:col])
						} 
				} 
			}
			state = func oGame,oSelf {
				if clock()-nMoveClock >= clockspersecond()/nMovementSpeed { 
					nMoveClock = clock()
					MoveSnake(oGame,oSelf)
				} 
				nSnakeY = aSnake[len(aSnake)][1]
				nSnakeX = aSnake[len(aSnake)][2]
				if nSnakeX < newX { 
					if cDirection = :Left { 
						cDirection = :Down
						MoveSnake(oGame,oSelf)
					} 
					cDirection = :Right
					elseif nSnakeX > newX
						if cDirection = :Right { 
							cDirection = :Up
							MoveSnake(oGame,oSelf)
						} 
						cDirection = :Left
					elseif nSnakeY > newY
						if cDirection = :Down { 
							cDirection = :Left
							MoveSnake(oGame,oSelf)
						} 
						cDirection = :UP
					elseif nSnakeY < newY
						if cDirection = :Up { 
							cDirection = :Right
							MoveSnake(oGame,oSelf)
						} 
						cDirection = :Down
				} 
			}
		}
		# Display the score!
		text {
			name = :Score
			size = 16
			file = "fonts/pirulen.ttf"
			x = 150
			y = 0
			color = rgb(0,0,0)
			animate = False
			text = "Score : "+nScore
		}
		# Display the Snake Size
		text {
			name = :SnakeSize
			size = 16
			file = "fonts/pirulen.ttf"
			x = 450
			y = 0
			color = rgb(0,0,0)
			animate = False
			text = "Snake Size : "+len(aSnake)
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
				cDirection = :Down
				MoveSnake(oGame,oMap)
				cDirection = :Left
				return 
			} 
			aHead[2]++
		case :left
			if aHead[2] = 1 { 
				cDirection = :Down
				MoveSnake(oGame,oMap)
				cDirection = :Right
				return 
			} 
			aHead[2]--
		case :up
			if aHead[1] = 1 { 
				cDirection = :Right
				MoveSnake(oGame,oMap)
				cDirection = :Down
				return 
			} 
			aHead[1]--
		case :down
			if aHead[1] = C_LEVEL_ROWSCOUNT { 
				cDirection = :Left
				MoveSnake(oGame,oMap)
				cDirection = :Up
				return 
			} 
			aHead[1]++
	} 
	if aLevel[aHead[1]][aHead[2]] = C_EMPTY { 
		if CheckAnotherCell() = False { 
			HideCell(aSnake[1])
		} 
		del(aSnake,1)
		# Snake attack the player but the player escaped
		if aHead[1] = newY AND aHead[2] = newX { 
			newY = oldY
			newX = oldX
		} 
		elseif (aLevel[aHead[1]][aHead[2]] = C_FOOD)
			NewFood()
		elseif aLevel[aHead[1]][aHead[2]] = C_SNAKE
			if CheckAnotherCell() = False { 
				HideCell(aSnake[1])
			} 
			del(aSnake,1)
		elseif aLevel[aHead[1]][aHead[2]] = C_PLAYER
			aLevel[aPlayer[:row]][aPlayer[:col]] = C_DIE
			UpdateGameMap(oGame)
			DisplayGameOver(oGame)
			return 
	} 
	aSnake+aHead
	ShowCell(aHead)
	UpdateGameMap(oGame)
	# Update the Snake Size
	oGame.find(:SnakeSize).text = "Snake Size : "+len(aSnake)
} 
func CheckAnotherCell  { 
	# Check if we don't have another cell in this place
	for t = 2 to len(aSnake) step 1 { 
		if aSnake[t][1] = aSnake[1][1] AND aSnake[t][2] = aSnake[1][2] { 
			return True
		} 
	} 
	return False
} 
func NewFood  { 
	# Snake ---> Attack the Star
	lNewFood = False
	while lNewFood = False { 
		newY = 2+random(C_LEVEL_ROWSCOUNT-3)
		newX = 2+random(C_LEVEL_COLSCOUNT-3)
		if aLevel[newY][newX] = C_EMPTY { 
			aLevel[newY][newX] = C_FOOD
			lNewFood = True
		} 
	} 
	# Snake ---> Attack the Player
	if len(aSnake)%2 = 0 { 
		oldY = newY
		oldX = newX
		newY = aPlayer[:row]
		newX = aPlayer[:col]
	} 
} 
func HideCell aCell { 
	aLevel[aCell[1]][aCell[2]] = C_EMPTY
} 
func ShowCell aCell { 
	aLevel[aCell[1]][aCell[2]] = C_SNAKE
} 
func UpdateGameMap oGame { 
	oGame.find(:Map).aMap = aLevel
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
func MovePlayer oGame,nNewRow,nNewCol { 
	switch aLevel[nNewRow][nNewCol] { 
		case C_EMPTY
			aLevel[aPlayer[:row]][aPlayer[:col]] = C_EMPTY
			aLevel[nNewRow][nNewCol] = C_PLAYER
			UpdateGameMap(oGame)
			aPlayer[:row] = nNewRow
			aPlayer[:col] = nNewCol
		case C_FOOD
			aLevel[aPlayer[:row]][aPlayer[:col]] = C_EMPTY
			aLevel[nNewRow][nNewCol] = C_PLAYER
			UpdateGameMap(oGame)
			aPlayer[:row] = nNewRow
			aPlayer[:col] = nNewCol
			NewFood()
			UpdateGameMap(oGame)
			# Update the Score
			nScore += 10
			oGame.find(:Score).text = "Score : "+nScore
		case C_SNAKE
			aLevel[aPlayer[:row]][aPlayer[:col]] = C_DIE
			UpdateGameMap(oGame)
			DisplayGameOver(oGame)
	} 
	return 
} 
func Restart oGame { 
	# Restart the Level
	lGameOver = False
	aLevel = aLevelCopy
	aSnake = [[3,3],[3,4],[3,5]]
	cDirection = :Right
	aPlayer = [:Row = 13,:Col = 4]
	aLevel[13][4] = C_PLAYER
	newX = 0
	newY = 0
	NewFood()
	UpdateGameMap(oGame)
	# Set the score
	nScore = 0
	oGame.find(:Score).text = "Score : "+nScore
} 
