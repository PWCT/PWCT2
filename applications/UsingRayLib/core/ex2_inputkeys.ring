#===================================================================#
#Copyright (c) 2014 Ramon Santamaria (@raysan5)
#Ported to RingRayLib by Ring Team
#===================================================================#
load "raylib.ring"
screenWidth = 800
screenHeight = 450
InitWindow(screenWidth,screenHeight,"raylib [core] example - keyboard input")
ballPosition = Vector2(screenWidth/2,screenHeight/2)
SetTargetFPS(60)
while !WindowShouldClose() { 
	if IsKeyDown(KEY_RIGHT) { 
		ballPosition.x += 2
	} 
	if IsKeyDown(KEY_LEFT) { 
		ballPosition.x -= 2
	} 
	if IsKeyDown(KEY_UP) { 
		ballPosition.y -= 2
	} 
	if IsKeyDown(KEY_DOWN) { 
		ballPosition.y += 2
	} 
	BeginDrawing()
	ClearBackground(RAYWHITE)
	DrawText("move the ball with arrow keys",10,10,20,DARKGRAY)
	DrawCircleV(ballPosition,50,MAROON)
	EndDrawing()
} 
CloseWindow()
