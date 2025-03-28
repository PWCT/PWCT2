#--------------------------------------------------------------------------------
#Copyright (c) 2019 Ramon Santamaria (@raysan5)
#Ported to RingRayLib by Mahmoud Fayed & Bert Mariani
#2020, accelerated by Ilir Liburn (iliribur@gmail.com)
#--------------------------------------------------------------------------------
load "raylib.ring"
load "stdlibcore.ring"
func main  { 
	screenWidth = 800
	screenHeight = 600
	InitWindow(screenWidth,screenHeight,"raylib [models] example - first person maze")
	#Define the camera to look into our 3d world
	camera = Camera3D(0.2,0.4,0.2,18.5,4.0,0.0,0.0,1.0,0.0,45.0,CAMERA_PERSPECTIVE)
	imMap = LoadImage("cubicmap.png")
	#Load cubicmap image (RAM)
	cubicmap = LoadTextureFromImage(imMap)
	#Convert image to texture to display (VRAM)
	mesh = GenMeshCubicmap(imMap,Vector3(1.0,1.0,1.0))
	model = LoadModelFromMesh(mesh)
	#NOTE: By default each cube is mapped to one part of texture atlas
	texture = LoadTexture("cubicmap_atlas.png")
	#Load map texture
	SetModelMaterialTexture(model,0,MAP_DIFFUSE,texture)
	#Get map image data to be used for collision detection
	mapPixels = LoadImageColors(imMap)
	#Color *mapPixels
	UnloadImage(imMap)
	#Unload image from RAM
	mapPosition = Vector3(-16.0,0.0,-8.0)
	#Set model position
	playerPosition = camera.position
	#Set player position
	SetTargetFPS(60)
	#Set our game to run at 60 frames-per-second
	aList = list(cubicmap.height,cubicmap.width)
	for y = 0 to cubicmap.height-1 step 1 { 
		for x = 0 to cubicmap.width-1 step 1 { 
			if GetImagePixelR(mapPixels,y,x,cubicmap.width) = 255 { 
				aList[y+1][x+1] = true
			} 
		} 
	} 
	#Detect window close button or ESC key
	while !WindowShouldClose() { 
		oldCamPos = camera.position
		#Store old camera position
		UpdateCamera(camera,CAMERA_FIRST_PERSON)
		#Update &camera
		#Check player collision (we simplify to 2D collision detection)
		playerPos = Vector2(camera.position.x,camera.position.z)
		playerRadius = 0.1
		#Collision radius (player is modelled as a cylinder for collision)
		playerCellX = (playerPos.x-mapPosition.x+0.5)
		playerCellY = (playerPos.y-mapPosition.z+0.5)
		#Out-of-limits security check
		if playerCellX < 0 { 
			playerCellX = 0
			elseif playerCellX >= cubicmap.width
				playerCellX = cubicmap.width-1
		} 
		if playerCellY < 0 { 
			playerCellY = 0
			elseif playerCellY >= cubicmap.height
				playerCellY = cubicmap.height-1
		} 
		playerX = playerCellX+(playerPos.x-oldCamPos.x)*11
		playerY = playerCellY+(playerPos.y-oldCamPos.z)*11
		playerX = floor(playerX+1)
		playerY = floor(playerY+1)
		if aList[playerY][playerX] = true { 
			camera.position = oldCamPos
		} 
		BeginDrawing()
		ClearBackground(RAYWHITE)
		BeginMode3D(camera)
		DrawModel(model,mapPosition,1.0,WHITE)
		#Draw maze map
		EndMode3D()
		DrawTextureEx(cubicmap,Vector2(GetScreenWidth()-cubicmap.width*4-20,20),0.0,4.0,WHITE)
		DrawRectangleLines(GetScreenWidth()-cubicmap.width*4-20,20,cubicmap.width*4,cubicmap.height*4,GREEN)
		#Draw player position radar
		DrawRectangle(GetScreenWidth()-cubicmap.width*4-21.5+playerCellX*4,18.5+playerCellY*4,4,4,RED)
		DrawFPS(10,10)
		EndDrawing()
	} 
	UnloadTexture(cubicmap)
	#Unload cubicmap texture
	UnloadTexture(texture)
	#Unload map texture
	UnloadModel(model)
	#Unload map model
	#Close window and OpenGL context
	CloseWindow()
} 
