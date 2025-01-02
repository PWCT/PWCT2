#=============================================================================#
#Copyright (c) 2018 Vlad Adrian (@demizdor) and Ramon Santamaria (@raysan5)
#Ported to RingRayLib by Ring Team
#=============================================================================#
load "raylib.ring"
MOUSE_SCALE_MARK_SIZE = 12
screenWidth = 800
screenHeight = 450
InitWindow(screenWidth,screenHeight,"raylib [shapes] example - rectangle scaling mouse")
rec = Rectangle(100,100,200,80)
mousePosition = Vector2(0,0)
mouseScaleReady = false
mouseScaleMode = false
SetTargetFPS(60)
while !WindowShouldClose() { 
	mousePosition = GetMousePosition()
	if (CheckCollisionPointRec(mousePosition,rec) AND CheckCollisionPointRec(mousePosition,Rectangle(rec.x+rec.width-MOUSE_SCALE_MARK_SIZE,rec.y+rec.height-MOUSE_SCALE_MARK_SIZE,MOUSE_SCALE_MARK_SIZE,MOUSE_SCALE_MARK_SIZE))) { 
		mouseScaleReady = true
		if (IsMouseButtonPressed(MOUSE_LEFT_BUTTON)) { 
			mouseScaleMode = true
		} 
		else
			mouseScaleReady = false
	} 
	if (mouseScaleMode) { 
		mouseScaleReady = true
		rec.width = (mousePosition.x-rec.x)
		rec.height = (mousePosition.y-rec.y)
		if (rec.width < MOUSE_SCALE_MARK_SIZE) { 
			rec.width = MOUSE_SCALE_MARK_SIZE
		} 
		if (rec.height < MOUSE_SCALE_MARK_SIZE) { 
			rec.height = MOUSE_SCALE_MARK_SIZE
		} 
		if (IsMouseButtonReleased(MOUSE_LEFT_BUTTON)) { 
			mouseScaleMode = false
		} 
	} 
	BeginDrawing()
	ClearBackground(RAYWHITE)
	DrawText("Scale rectangle dragging from bottom-right corner!",10,10,20,GRAY)
	DrawRectangleRec(rec,Fade(GREEN,0.5))
	if (mouseScaleReady) { 
		DrawRectangleLinesEx(rec,1,RED)
		DrawTriangle(Vector2(rec.x+rec.width-MOUSE_SCALE_MARK_SIZE,rec.y+rec.height),Vector2(rec.x+rec.width,rec.y+rec.height),Vector2(rec.x+rec.width,rec.y+rec.height-MOUSE_SCALE_MARK_SIZE),RED)
	} 
	EndDrawing()
} 
CloseWindow()
