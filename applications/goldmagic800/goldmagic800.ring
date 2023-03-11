# Load Libraries
load "stdlibcore.ring"
load "gamelib.ring"
load "opengl21lib.ring"
# Load Files
load "gamefiles.ring"
# ==============================================================
# To Support MacOS X
# Called by al_run_main()
al_run_main()
func al_game_start  { 
	# Now we call our main function
	# ==============================================================
	main()
} 
func main  { 
	new GameEngine
	{
		Run()
	}
} 
