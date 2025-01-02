load "stdlibcore.ring"
load "gamelib.ring"
load "opengl21lib.ring"
load "gamefiles.ring"
al_run_main()
func al_game_start  { 
	main()
} 
func main  { 
	new GameEngine
	{
		Run()
	}
} 
