load "gameengine.ring"
# Give control to the game engine
func main  { 
	# Called by the Game Engine
	# Create the Game Object
	oGame = new Game
	{
		title = "My First Game"
		text {
			x = 10
			y = 50
			animate = false
			size = 20
			file = "fonts/pirulen.ttf"
			text = "game development using ring is very fun!"
			color = rgb(0,0,0)
		}
	}
	# Start the Events Loop	
} 
