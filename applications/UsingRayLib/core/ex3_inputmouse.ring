#===================================================================#
#Copyright (c) 2014 Ramon Santamaria (@raysan5)
#Ported to RingRayLib by Ring Team
#===================================================================#
load "raylib.ring"
screenWidth = 800
screenHeight = 450
InitWindow(screenWidth,screenHeight,"raylib [core] example - mouse input")
ballPosition = Vector2(100,100)
ballColor = DARKBLUE
SetTargetFPS(60)
while !WindowShouldClose() { 
	ballPosition = GetMousePosition()
	if IsMouseButtonPressed(MOUSE_LEFT_BUTTON) { 
		ballColor = MAROON
		elseif IsMouseButtonPressed(MOUSE_MIDDLE_BUTTON)
			ballColor = LIME
		elseif IsMouseButtonPressed(MOUSE_RIGHT_BUTTON)
			ballColor = DARKBLUE
	} 
	BeginDrawing()
	ClearBackground(BLACK)
	DrawCircleV(ballPosition,40,ballColor)
	DrawText("move ball with mouse and click mouse button to change color",10,10,20,YELLOW)
	EndDrawing()
} 
CloseWindow()
