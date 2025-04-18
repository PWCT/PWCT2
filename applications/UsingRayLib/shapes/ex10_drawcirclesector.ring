#===============================================================================#
#Copyright (c) 2018 Vlad Adrian (@demizdor) and Ramon Santamaria (@raysan5)
#Ported to RingRayLib by Ring Team
#===============================================================================#
load "raylib.ring"
#Initialization
#--------------------------------------------------------------------------------------
screenWidth = 800
screenHeight = 450
InitWindow(screenWidth,screenHeight,"raylib [shapes] example - draw circle sector")
center = Vector2((GetScreenWidth()-300)/2,GetScreenHeight()/2)
outerRadius = 180
startAngle = 0
endAngle = 180
segments = 0
SetTargetFPS(60)
#Set our game to run at 60 frames-per-second
#--------------------------------------------------------------------------------------
#Main game loop
#Detect window close button or ESC key
#Update
#----------------------------------------------------------------------------------
#NOTE: All variables update happens inside GUI control functions
#----------------------------------------------------------------------------------
#Draw
#----------------------------------------------------------------------------------
while !WindowShouldClose() { 
	BeginDrawing()
	ClearBackground(RAYWHITE)
	DrawLine(500,0,500,GetScreenHeight(),Fade(LIGHTGRAY,0.6))
	DrawRectangle(500,0,GetScreenWidth()-500,GetScreenHeight(),Fade(LIGHTGRAY,0.3))
	DrawCircleSector(center,outerRadius,startAngle,endAngle,segments,Fade(MAROON,0.3))
	DrawCircleSectorLines(center,outerRadius,startAngle,endAngle,segments,Fade(MAROON,0.6))
	#Draw GUI controls
	#------------------------------------------------------------------------------
	startAngle = GuiSliderBar(Rectangle(600,40,120,20),"StartAngle",startAngle,0,720,true)
	endAngle = GuiSliderBar(Rectangle(600,70,120,20),"EndAngle",endAngle,0,720,true)
	outerRadius = GuiSliderBar(Rectangle(600,140,120,20),"Radius",outerRadius,0,200,true)
	segments = GuiSliderBar(Rectangle(600,170,120,20),"Segments",segments,0,100,true)
	#------------------------------------------------------------------------------
	if segments >= 4 { 
		text1 = "MANUAL"
		color = MAROON
		else
			text1 = "AUTO"
			color = DARKGRAY
	} 
	DrawText("MODE: "+text1,600,200,10,color)
	DrawFPS(10,10)
	#----------------------------------------------------------------------------------
	EndDrawing()
} 
#De-Initialization
#--------------------------------------------------------------------------------------
#Close window and OpenGL context
#--------------------------------------------------------------------------------------
CloseWindow()
