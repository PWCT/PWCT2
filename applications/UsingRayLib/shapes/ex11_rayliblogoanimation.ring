#===================================================================#
#Copyright (c) 2014 Ramon Santamaria (@raysan5)
#Ported to RingRayLib by Ring Team
#===================================================================#
load "raylib.ring"
#Initialization
#--------------------------------------------------------------------------------------
screenWidth = 800
screenHeight = 450
InitWindow(screenWidth,screenHeight,"Raylib Logo Animation")
logoPositionX = screenWidth/2-128
logoPositionY = screenHeight/2-128
framesCounter = 0
lettersCount = 0
topSideRecWidth = 16
leftSideRecHeight = 16
bottomSideRecWidth = 16
rightSideRecHeight = 16
state = 0
#Tracking animation states (State Machine)
alpha = 1.0
#Useful for fading
SetTargetFPS(60)
#Set our game to run at 60 frames-per-second
#--------------------------------------------------------------------------------------
#Main game loop
#Detect window close button or ESC key
#Update
#----------------------------------------------------------------------------------
while !WindowShouldClose() { 
	switch state { 
		case 0
			#State 0: Small box blinking
			framesCounter++
			if framesCounter = 120 { 
				state = 1
				framesCounter = 0
				#Reset counter... will be used later...
			} 
		case 1
			#State 1: Top and left bars growing
			topSideRecWidth += 4
			leftSideRecHeight += 4
			if topSideRecWidth = 256 { 
				state = 2
			} 
		case 2
			#State 2: Bottom and right bars growing
			bottomSideRecWidth += 4
			rightSideRecHeight += 4
			if bottomSideRecWidth = 256 { 
				state = 3
			} 
		case 3
			#State 3: Letters appearing (one by one)
			framesCounter++
			#Every 12 frames, one more letter!
			if framesCounter/12 { 
				lettersCount++
				framesCounter = 0
			} 
			#When all letters have appeared, just fade out everything
			if lettersCount >= 10 { 
				alpha -= 0.02
				if alpha <= 0.0 { 
					alpha = 0.0
					state = 4
				} 
			} 
		case 4
			#State 4: Reset and Replay
			if IsKeyPressed("R") { 
				framesCounter = 0
				lettersCount = 0
				topSideRecWidth = 16
				leftSideRecHeight = 16
				bottomSideRecWidth = 16
				rightSideRecHeight = 16
				alpha = 1.0
				state = 0
				#Return to State 0
			} 
	} 
	#----------------------------------------------------------------------------------
	#Draw
	#----------------------------------------------------------------------------------
	BeginDrawing()
	ClearBackground(RAYWHITE)
	switch state { 
		case 0
			if ((framesCounter/15)%2) { 
				DrawRectangle(logoPositionX,logoPositionY,16,16,BLACK)
			} 
		case 1
			DrawRectangle(logoPositionX,logoPositionY,topSideRecWidth,16,BLACK)
			DrawRectangle(logoPositionX,logoPositionY,16,leftSideRecHeight,BLACK)
		case 2
			DrawRectangle(logoPositionX,logoPositionY,topSideRecWidth,16,BLACK)
			DrawRectangle(logoPositionX,logoPositionY,16,leftSideRecHeight,BLACK)
			DrawRectangle(logoPositionX+240,logoPositionY,16,rightSideRecHeight,BLACK)
			DrawRectangle(logoPositionX,logoPositionY+240,bottomSideRecWidth,16,BLACK)
		case 3
			DrawRectangle(logoPositionX,logoPositionY,topSideRecWidth,16,Fade(BLACK,alpha))
			DrawRectangle(logoPositionX,logoPositionY+16,16,leftSideRecHeight-32,Fade(BLACK,alpha))
			DrawRectangle(logoPositionX+240,logoPositionY+16,16,rightSideRecHeight-32,Fade(BLACK,alpha))
			DrawRectangle(logoPositionX,logoPositionY+240,bottomSideRecWidth,16,Fade(BLACK,alpha))
			DrawRectangle(screenWidth/2-112,screenHeight/2-112,224,224,Fade(RAYWHITE,alpha))
			DrawText(TextSubtext("raylib",0,lettersCount),screenWidth/2-44,screenHeight/2+48,50,BLACK)
		case 4
			DrawText("[R] REPLAY",340,200,20,GRAY)
	} 
	#----------------------------------------------------------------------------------
	EndDrawing()
} 
#--------------------------------------------------------------------------------------
#Close window and OpenGL context
#--------------------------------------------------------------------------------------
CloseWindow()
