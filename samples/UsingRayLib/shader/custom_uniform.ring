# Copyright (c) 2015 Ramon Santamaria (@raysan5)
# Ported to RingRayLib by Ring Team
load "raylib.ring"
func main  { 
	screenWidth = 800
	screenHeight = 450
	SetConfigFlags(FLAG_MSAA_4X_HINT)
	InitWindow(screenWidth,screenHeight,"raylib [shaders] example - custom uniform variable")
	camera = Camera3D(8.0,8.0,8.0,0.0,1.5,0.0,0.0,1.0,0.0,45.0,CAMERA_PERSPECTIVE)
	model = LoadModel("models/barracks.obj")
	texture = LoadTexture("models/barracks_diffuse.png")
	setmodelmaterialtexture(model,0,MAP_DIFFUSE,texture)
	position = Vector3(0.0,0.0,0.0)
	shader = LoadShader("","shaders/swirl.fs")
	swirlCenterLoc = GetShaderLocation(shader,"center")
	swirlCenter = [screenWidth/2,screenHeight/2]
	target = LoadRenderTexture(screenWidth,screenHeight)
	SetCameraMode(camera,CAMERA_ORBITAL)
	SetTargetFPS(60)
	while (!WindowShouldClose()) { 
		mousePosition = GetMousePosition()
		swirlCenter[1] = mousePosition.x
		swirlCenter[2] = screenHeight-mousePosition.y
		SetShaderVec2(shader,swirlCenterLoc,swirlCenter)
		UpdateCamera(camera)
		BeginDrawing()
		ClearBackground(RAYWHITE)
		BeginTextureMode(target)
		ClearBackground(RAYWHITE)
		BeginMode3D(camera)
		DrawModel(model,position,0.5,WHITE)
		DrawGrid(10,1.0)
		EndMode3D()
		DrawText("TEXT DRAWN IN RENDER TEXTURE",200,10,30,RED)
		EndTextureMode()
		BeginShaderMode(shader)
		DrawTextureRec(target.texture,Rectangle(0,0,target.texture.width,-target.texture.height),Vector2(0,0),WHITE)
		EndShaderMode()
		DrawText("(c) Barracks 3D model by Alberto Cano",screenWidth-220,screenHeight-20,10,GRAY)
		DrawFPS(10,10)
		EndDrawing()
	} 
	UnloadShader(shader)
	UnloadTexture(texture)
	UnloadModel(model)
	UnloadRenderTexture(target)
	CloseWindow()
} 
