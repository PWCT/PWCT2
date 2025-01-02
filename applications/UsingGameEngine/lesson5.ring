load "gameengine.ring"
# Give control to the game engine
func main  { 
	# Called by the Game Engine
	# Create the Game Object
	oGame = new Game
	{
		title = "My First Game"
		animate {
			file = "images/fire.png"
			x = 100
			y = 200
			framewidth = 40
			height = 42
			nStep = 3
			# Used for delay
			transparent = true
			state = func oGame,oSelf {
				# Called by engine each frame
				oSelf {
					nStep--
					if nStep = 0 { 
						nStep = 3
						# we have 13 frames in animation
						if frame < 13 { 
							frame++
							# move to next frame
							else
								oGame.remove(oself.nIndex)
								# remove object
						} 
					} 
				}
			}
		}
	}
	# Start the Events Loop	
} 
