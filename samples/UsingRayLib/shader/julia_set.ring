# Copyright (c) 2019 eggmund (@eggmund) and Ramon Santamaria (@raysan5)
# Ported to RingRayLib by Ring Team
load "raylib.ring"
POINTS_OF_INTEREST = [[-0.348827,0.607167],[-0.786268,0.169728],[-0.8,0.156],[0.285,0.0],[-0.835,-0.2321],[-0.70176,-0.3842]]
func main  { 
	screenWidth = 800
	screenHeight = 450
	InitWindow(screenWidth,screenHeight,"raylib [shaders] example - julia sets")
	shader = LoadShader(NULL,"shaders/julia_set.fs")
	c = [POINTS_OF_INTEREST[1][1],POINTS_OF_INTEREST[1][2]]
	offset = [-screenWidth/2,-screenHeight/2]
	zoom = 1.0
	offsetSpeed = Vector2(0.0,0.0)
	cLoc = GetShaderLocation(shader,"c")
	zoomLoc = GetShaderLocation(shader,"zoom")
	offsetLoc = GetShaderLocation(shader,"offset")
	screenDims = [screenWidth,screenHeight]
	SetShaderVec2(shader,GetShaderLocation(shader,"screenDims"),screenDims)
	SetShaderVec2(shader,cLoc,c)
	SetShaderFloat(shader,zoomLoc,zoom)
	SetShaderVec2(shader,offsetLoc,offset)
	target = LoadRenderTexture(screenWidth,screenHeight)
	incrementSpeed = 0
	showControls = true
	pause = false
	SetTargetFPS(60)
	while !WindowShouldClose() { 
		if IsKeyPressed(KEY_ONE)||IsKeyPressed(KEY_TWO)||IsKeyPressed(KEY_THREE)||IsKeyPressed(KEY_FOUR)||IsKeyPressed(KEY_FIVE)||IsKeyPressed(KEY_SIX) { 
			if IsKeyPressed(KEY_ONE) { 
				c[1] = POINTS_OF_INTEREST[1][1]
				c[2] = POINTS_OF_INTEREST[1][2]
				elseif IsKeyPressed(KEY_TWO)
					c[1] = POINTS_OF_INTEREST[2][1]
					c[2] = POINTS_OF_INTEREST[2][2]
				elseif IsKeyPressed(KEY_THREE)
					c[1] = POINTS_OF_INTEREST[3][1]
					c[2] = POINTS_OF_INTEREST[3][2]
				elseif IsKeyPressed(KEY_FOUR)
					c[1] = POINTS_OF_INTEREST[4][1]
					c[2] = POINTS_OF_INTEREST[4][2]
				elseif IsKeyPressed(KEY_FIVE)
					c[1] = POINTS_OF_INTEREST[5][1]
					c[2] = POINTS_OF_INTEREST[5][2]
				elseif IsKeyPressed(KEY_SIX)
					c[1] = POINTS_OF_INTEREST[6][1]
					c[2] = POINTS_OF_INTEREST[6][2]
			} 
			SetShaderVec2(shader,cLoc,c)
		} 
		if IsKeyPressed(KEY_SPACE) { 
			pause = !pause
		} 
		if IsKeyPressed(KEY_F1) { 
			showControls = !showControls
		} 
		if !pause { 
			if IsKeyPressed(KEY_RIGHT) { 
				incrementSpeed++
				elseif IsKeyPressed(KEY_LEFT)
					incrementSpeed--
			} 
			if IsMouseButtonDown(MOUSE_LEFT_BUTTON)||IsMouseButtonDown(MOUSE_RIGHT_BUTTON) { 
				if IsMouseButtonDown(MOUSE_LEFT_BUTTON) { 
					zoom += zoom*0.003
				} 
				if IsMouseButtonDown(MOUSE_RIGHT_BUTTON) { 
					zoom -= zoom*0.003
				} 
				mousePos = GetMousePosition()
				offsetSpeed.x = mousePos.x-screenWidth/2
				offsetSpeed.y = mousePos.y-screenHeight/2
				offset[1] += GetFrameTime()*offsetSpeed.x*0.8
				offset[2] += GetFrameTime()*offsetSpeed.y*0.8
				else
					offsetSpeed = Vector2(0.0,0.0)
			} 
			SetShaderFloat(shader,zoomLoc,zoom)
			SetShaderVec2(shader,offsetLoc,offset)
			amount = GetFrameTime()*incrementSpeed*0.0005
			c[1] += amount
			c[2] += amount
			SetShaderVec2(shader,cLoc,c)
		} 
		BeginDrawing()
		ClearBackground(BLACK)
		BeginTextureMode(target)
		ClearBackground(BLACK)
		DrawRectangle(0,0,GetScreenWidth(),GetScreenHeight(),BLACK)
		EndTextureMode()
		BeginShaderMode(shader)
		DrawTexture(target.texture,0,0,WHITE)
		EndShaderMode()
		if showControls { 
			DrawText("Press Mouse buttons right/left to zoom in/out and move",10,15,10,RAYWHITE)
			DrawText("Press KEY_F1 to toggle these controls",10,30,10,RAYWHITE)
			DrawText("Press KEYS [1 - 6] to change point of interest",10,45,10,RAYWHITE)
			DrawText("Press KEY_LEFT | KEY_RIGHT to change speed",10,60,10,RAYWHITE)
			DrawText("Press KEY_SPACE to pause movement animation",10,75,10,RAYWHITE)
		} 
		EndDrawing()
	} 
	UnloadShader(shader)
	UnloadRenderTexture(target)
	CloseWindow()
} 
