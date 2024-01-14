# The Maze Game - Level Designer		   	
load "stdlibcore.ring"
load "gameengine.ring"
# Give control to the game engine
func main  { 
	# Called by the Game Engine
	load "level.ring"
	GE_SCREEN_W = 650
	GE_SCREEN_H = 460
	# Create the Game Object
	oGame = new Game
	{
		title = "Maze - Level Designer"
		icon = "images/wall.jpg"
		Map {
			blockwidth = 15
			blockheight = 15
			aMap = aLevel
			aImages = ["images/empty.jpg","images/wall.jpg","images/player.jpg","images/door.jpg"]
			mouse = func ogame,oself,nType,aMouseList {
				if nType = GE_MOUSE_UP { 
					oSelf {
						mX = aMouseList[GE_MOUSE_X]
						mY = aMouseList[GE_MOUSE_Y]
						nRow = GetRow(mX,mY)
						nCol = GetCol(mX,mY)
						aMap[nRow][nCol]++
						if aMap[nRow][nCol] = 5 { 
							aMap[nRow][nCol] = 1
						} 
					}
					write("level.ring","aLevel = "+List2Code(oGame.aObjects[1].aMap))
				} 
			}
		}
	}
	# Start the Events Loop	
} 
