load "gameengine.ring"
# Give control to the game engine
func main  { 
	# Called by the Game Engine
	# Create the Game Object
	oGame = new Game
	{
		title = "My First Game"
		Map {
			blockwidth = 80
			blockheight = 80
			aMap = [[0,0,0,0,0,0,0,0,0,1,0,0,0,3,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,1,0,0,0],[0,0,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,3,0,0,0,1,0,0,0,1,0,0,0],[0,0,0,0,0,0,0,0,0,3,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,3,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]]
			aImages = ["images/fbwall.png","images/fbwallup.png","images/fbwalldown.png"]
			state = func oGame,oSelf {
				oSelf {
					x -= 3
					if x < -2100 { 
						x = 0
					} 
				}
			}
			mouse = func ogame,oself,nType,aMouseList {
				if nType = GE_MOUSE_UP { 
					oSelf {
						mX = aMouseList[GE_MOUSE_X]
						mY = aMouseList[GE_MOUSE_Y]
						nValue = GetValue(mX,mY)
						nRow = GetRow(mX,mY)
						nCol = GetCol(mX,mY)
						switch nValue { 
							case 1
								aMap[nRow][nCol] = 0
							case 2
								aMap[nRow][nCol] = 0
							case 3
								aMap[nRow][nCol] = 0
							case 0
								aMap[nRow][nCol] = 1
						} 
					}
				} 
			}
		}
	}
	# Start the Events Loop	
} 
