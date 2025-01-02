load "gameengine.ring"
# Give control to the game engine
func main  { 
	# Called by the Game Engine
	# Create the Game Object
	oGame = new Game
	{
		title = "My First Game"
		sprite {
			type = GE_TYPE_PLAYER
			# Just for our usage
			x = 400
			y = 400
			width = 100
			height = 100
			file = "images/player.png"
			transparent = true
			Animate = false
			Move = false
			# Custom Movement
			Scaled = true
			keypress = func oGame,oSelf,nKey {
				oSelf {
					switch nKey { 
						case KEY_LEFT
							x -= 10
						case KEY_RIGHT
							x += 10
						case KEY_UP
							y -= 10
						case KEY_DOWN
							y += 10
					} 
				}
			}
			mouse = func oGame,oSelf,nType,aMouseList {
				if nType = GE_MOUSE_UP { 
					oSelf {
						x = aMouseList[GE_MOUSE_X]
						y = aMouseList[GE_MOUSE_Y]
					}
				} 
			}
		}
	}
	# Start the Events Loop	
} 
