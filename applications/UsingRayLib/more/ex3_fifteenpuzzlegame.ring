#Project : CalmoSoft Fifteen Puzzle Game
#Date    : 02/10/2019-09:00:00
#Update  : 03/10/2019-09:21:36
#Author  : Gal Zsolt & Bert Mariani
load "raylib.ring"
screenWidth = 800
screenHeight = 450
InitWindow(screenWidth,screenHeight,"CalmoSoft Fifteen Puzzle Game")
nr = 0
sum = 0
empty = 16
size = 4
tiles = list(size*size)
SetTargetFPS(60)
while !WindowShouldClose() { 
	sum = sum+1
	if IsMouseButtonPressed(MOUSE_LEFT_BUTTON) { 
		posx = GetMouseX()
		posy = GetMouseY()
		x = floor((posx-45)/45+1)
		y = floor((posy-45)/45+1)
		nr = (y-1)*4+x
		movetiles()
	} 
	BeginDrawing()
	ClearBackground(RAYWHITE)
	for n = 1 to size step 1 { 
		for m = 1 to size step 1 { 
			tnr = (m-1)*4+n
			if sum = 1 { 
				tiles[tnr] = string(tnr)
			} 
			DrawRectangle(50+(n-1)*45,50+(m-1)*45,40,40,BLUE)
			DrawText(tiles[tnr],65+(n-1)*45,65+(m-1)*45,10,WHITE)
		} 
	} 
	if sum = 1 { 
		scramble()
	} 
	EndDrawing()
} 
CloseWindow()
func scramble () { 
	for n = 1 to 1000 step 1 { 
		tile = random(15)+1
		up = (empty = (tile-4))
		down = (empty = (tile+4))
		left = ((empty = tile-1) AND (tile%4 != 1))
		right = ((empty = tile+1) AND (tile%4 != 0))
		move = (up OR down OR left OR right)
		if (move = true) { 
			tiles[empty] = tiles[tile]
			tiles[tile] = "---"
			empty = tile
		} 
	} 
	for n = 1 to size step 1 { 
		for m = 1 to size step 1 { 
			tnr = (n-1)*4+m
			temp = tiles[tnr]
			DrawRectangle(50+(n-1)*45,50+(m-1)*45,40,40,BLUE)
			DrawText(temp,65+(n-1)*45,65+(m-1)*45,10,WHITE)
		} 
	} 
} 
func movetiles () { 
	tile = nr
	up = (empty = (tile-4))
	down = (empty = (tile+4))
	left = ((empty = tile-1) AND (tile%4 != 1))
	right = ((empty = tile+1) AND (tile%4 != 0))
	move = (up OR down OR left OR right)
	if (move = true) { 
		tiles[empty] = tiles[tile]
		tiles[tile] = "---"
		empty = tile
	} 
	for n = 1 to size step 1 { 
		for m = 1 to size step 1 { 
			tnr = (n-1)*4+m
			temp = tiles[tnr]
			DrawRectangle(50+(n-1)*45,50+(m-1)*45,40,40,BLUE)
			DrawText(temp,65+(n-1)*45,65+(m-1)*45,10,WHITE)
		} 
	} 
} 
