#===================================================================#
#Copyright (c) 2016 Ramon Santamaria (@raysan5)
#Ported to RingRayLib by Ring Team
#===================================================================#
load "raylib.ring"
MAX_GESTURE_STRINGS = 20
#Initialization
#--------------------------------------------------------------------------------------
screenWidth = 800
screenHeight = 450
InitWindow(screenWidth,screenHeight,"Input Textures Detection")
touchPosition = Vector2(0,0)
touchArea = Rectangle(220,10,screenWidth-230,screenHeight-20)
gesturesCount = 1
gestureStrings = list(32)
currentGesture = GESTURE_NONE
lastGesture = GESTURE_NONE
SetTargetFPS(60)
#Set our game to run at 60 frames-per-second
#--------------------------------------------------------------------------------------
#Main game loop
#Detect window close button or ESC key
#Update
#----------------------------------------------------------------------------------
while !WindowShouldClose() { 
	lastGesture = currentGesture
	currentGesture = GetGestureDetected()
	touchPosition = GetTouchPosition(0)
	if CheckCollisionPointRec(touchPosition,touchArea) AND (currentGesture != GESTURE_NONE) { 
		if currentGesture != lastGesture { 
			switch currentGesture { 
				case GESTURE_TAP
					gestureStrings[gesturesCount] = "GESTURE TAP"
				case GESTURE_DOUBLETAP
					gestureStrings[gesturesCount] = "GESTURE DOUBLETAP"
				case GESTURE_HOLD
					gestureStrings[gesturesCount] = "GESTURE HOLD"
				case GESTURE_DRAG
					gestureStrings[gesturesCount] = "GESTURE DRAG"
				case GESTURE_SWIPE_RIGHT
					gestureStrings[gesturesCount] = "GESTURE SWIPE RIGHT"
				case GESTURE_SWIPE_LEFT
					gestureStrings[gesturesCount] = "GESTURE SWIPE LEFT"
				case GESTURE_SWIPE_UP
					gestureStrings[gesturesCount] = "GESTURE SWIPE UP"
				case GESTURE_SWIPE_DOWN
					gestureStrings[gesturesCount] = "GESTURE SWIPE DOWN"
				case GESTURE_PINCH_IN
					gestureStrings[gesturesCount] = "GESTURE PINCH IN"
				case GESTURE_PINCH_OUT
					gestureStrings[gesturesCount] = "GESTURE PINCH OUT"
			} 
			gesturesCount++
			#Reset gestures strings
			if gesturesCount >= MAX_GESTURE_STRINGS { 
				for i = 1 to MAX_GESTURE_STRINGS step 1 { 
					gestureStrings[i] = GESTURE_NONE
				} 
				gesturesCount = 1
			} 
		}
	}
	#----------------------------------------------------------------------------------
	#Draw
	#----------------------------------------------------------------------------------
	BeginDrawing()
	ClearBackground(RAYWHITE)
	DrawRectangleRec(touchArea,GRAY)
	DrawRectangle(225,15,screenWidth-240,screenHeight-30,RAYWHITE)
	DrawText("GESTURES TEST AREA",screenWidth-270,screenHeight-40,20,GRAY)
	for i = 1 to gesturesCount-1 step 1 { 
		if (i%2 = 0) { 
			DrawRectangle(10,30+20*i,200,20,Fade(LIGHTGRAY,0.5))
			else
				DrawRectangle(10,30+20*i,200,20,Fade(LIGHTGRAY,0.3))
		} 
		if (i < gesturesCount-1) { 
			DrawText(gestureStrings[i],35,36+20*i,10,DARKGRAY)
			else
				DrawText(gestureStrings[i],35,36+20*i,10,MAROON)
		} 
	} 
	DrawRectangleLines(10,29,200,screenHeight-50,GRAY)
	DrawText("DETECTED GESTURES",50,15,10,GRAY)
	if currentGesture != GESTURE_NONE { 
		DrawCircleV(touchPosition,30,MAROON)
	}
	#----------------------------------------------------------------------------------
	EndDrawing()
} 
#De-Initialization
#--------------------------------------------------------------------------------------
#Close window and OpenGL context
#--------------------------------------------------------------------------------------
CloseWindow()
