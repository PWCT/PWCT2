load "gameengine.ring"
# Give control to the game engine
func main  { 
	# Called by the Game Engine
	# Create the Game Object
	oGame = new Game
	{
		title = "My First Game"
		Object {
			x = 400
			y = 300
			width = 200
			height = 200
			draw = func oGame,oSelf {
				oSelf {
					for t = 1 to 210 step 1 { 
						gl_draw_rectangle(x+t,y+t,x+t*2,y+t*2,gl_map_rgb(t*random(255),t*2,t*3),1)
						gl_draw_rectangle(x+t*2,y+t*2,x-t*2,y-t*2,gl_map_rgb(t*random(255),t*2,t*3),1)
					} 
				}
			}
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
		}
	}
	# Start the Events Loop	
} 
