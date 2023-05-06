# Copyright (c) 2014 Ramon Santamaria (@raysan5)
# Ported to RingRayLib by Ring Team
load "raylib.ring"
func main  { 
	screenWidth = 800
	screenHeight = 450
	SetConfigFlags(FLAG_MSAA_4X_HINT)
	InitWindow(screenWidth,screenHeight,"raylib [shaders] example - model shader")
	camera = camera3D(4.0,4.0,4.0,0.0,1.0,-1.0,0.0,1.0,0.0,45.0,CAMERA_PERSPECTIVE)
	model = LoadModel("models/watermill.obj")
	texture = LoadTexture("models/watermill_diffuse.png")
	shader = LoadShader(NULL,"shaders/grayscale.fs")
	setmodelmaterialshader(model,0,shader)
	setmodelmaterialtexture(model,0,MAP_DIFFUSE,texture)
	position = Vector3(0.0,0.0,0.0)
	SetCameraMode(camera,CAMERA_FREE)
	SetTargetFPS(60)
	while !WindowShouldClose() { 
		UpdateCamera(camera)
		BeginDrawing()
		ClearBackground(RAYWHITE)
		BeginMode3D(camera)
		DrawModel(model,position,0.2,WHITE)
		DrawGrid(10,1.0)
		EndMode3D()
		DrawText("(c) Watermill 3D model by Alberto Cano",screenWidth-210,screenHeight-20,10,GRAY)
		DrawFPS(10,10)
		EndDrawing()
	} 
	UnloadShader(shader)
	UnloadTexture(texture)
	UnloadModel(model)
	CloseWindow()
} 
