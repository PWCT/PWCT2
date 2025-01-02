#===================================================================#
#Copyright (c) 2013-2019 Ramon Santamaria (@raysan5)
#Ported to RingRayLib by Ring Team
#===================================================================#
load "raylib.ring"
screenWidth = 800
screenHeight = 450
InitWindow(screenWidth,screenHeight,"raylib [shapes] example - collision area")
#Box A: Moving box
boxA = Rectangle(10,GetScreenHeight()/2-50,200,100)
boxASpeedX = 4
#Box B: Mouse moved box
boxB = Rectangle(GetScreenWidth()/2-30,GetScreenHeight()/2-30,60,60)
boxCollision = GetCollisionRec(boxA,boxB)
boxCollision = Rectangle(0,0,0,0)
#Collision rectangle
screenUpperLimit = 40
#Top menu limits
pause = false
#Movement pause
collision = false
#Collision detection
SetTargetFPS(60)
#Move box if not paused
while !WindowShouldClose() { 
	if ( NOT pause) { 
		boxA.x += boxASpeedX
	} 
	#Bounce box on x screen limits
	if (((boxA.x+boxA.width) >= GetScreenWidth()) OR (boxA.x <= 0)) { 
		boxASpeedX = boxASpeedX*(-1)
	} 
	#Update player-controlled-box (box02)
	boxB.x = GetMouseX()-boxB.width/2
	boxB.y = GetMouseY()-boxB.height/2
	#Make sure Box B does not go out of move area limits
	if ((boxB.x+boxB.width) >= GetScreenWidth()) { 
		boxB.x = GetScreenWidth()-boxB.width
		else
			(boxB.x <= 0)
			boxB.x = 0
	} 
	if ((boxB.y+boxB.height) >= GetScreenHeight()) { 
		boxB.y = GetScreenHeight()-boxB.height
		else
			(boxB.y <= screenUpperLimit)
			boxB.y = screenUpperLimit
	} 
	#Check boxes collision
	collision = CheckCollisionRecs(boxA,boxB)
	#Get collision rectangle (only on collision)
	if (collision) { 
		boxCollision = GetCollisionRec(boxA,boxB)
	} 
	#Pause Box A movement
	if (IsKeyPressed(KEY_SPACE)) { 
		pause = NOT pause
	} 
	BeginDrawing()
	ClearBackground(RAYWHITE)
	if collision = true { 
		color = RED
		else
			color = BLACK
	} 
	DrawRectangle(0,0,screenWidth,screenUpperLimit,color)
	DrawRectangleRec(boxA,GOLD)
	boxB.x = GetMouseX()-boxB.width/2
	boxB.y = GetMouseY()-boxB.height/2
	collision = CheckCollisionRecs(boxA,boxB)
	DrawRectangleRec(boxB,BLUE)
	boxCollision = GetCollisionRec(boxA,boxB)
	#Draw collision area
	if (collision) = true { 
		DrawRectangleRec(boxCollision,LIME)
		#Draw collision message
		DrawText("COLLISION!",GetScreenWidth()/2-MeasureText("COLLISION!",20)/2,screenUpperLimit/2-10,20,BLACK)
		#Draw collision area
		DrawText("Collision Area: "+string(boxCollision.width*boxCollision.height),GetScreenWidth()/2-100,screenUpperLimit+10,20,BLACK)
	} 
	DrawFPS(10,10)
	EndDrawing()
} 
CloseWindow()
