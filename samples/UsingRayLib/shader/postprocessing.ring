# Copyright (c) 2015 Ramon Santamaria (@raysan5)
# Ported to RingRayLib by Ring Team
load "raylib.ring"
MAX_POSTPRO_SHADERS = 12
FX_GRAYSCALE = 1
FX_POSTERIZATION = 2
FX_DREAM_VISION = 3
FX_PIXELIZER = 4
FX_CROSS_HATCHING = 5
FX_CROSS_STITCHING = 6
FX_PREDATOR_VIEW = 7
FX_SCANLINES = 8
FX_FISHEYE = 9
FX_SOBEL = 10
FX_BLOOM = 11
FX_BLUR = 12
postproShaderText = ["GRAYSCALE","POSTERIZATION","DREAM_VISION","PIXELIZER","CROSS_HATCHING","CROSS_STITCHING","PREDATOR_VIEW","SCANLINES","FISHEYE","SOBEL","BLOOM","BLUR"]
func main  { 
	screenWidth = 800
	screenHeight = 450
	SetConfigFlags(FLAG_MSAA_4X_HINT)
	InitWindow(screenWidth,screenHeight,"raylib [shaders] example - postprocessing shader")
	camera = Camera3D(2.0,3.0,2.0,0.0,1.0,0.0,0.0,1.0,0.0,45.0,0)
	model = LoadModel("models/church.obj")
	texture = LoadTexture("models/church_diffuse.png")
	setmodelmaterialtexture(model,0,MAP_DIFFUSE,texture)
	position = Vector3(0.0,0.0,0.0)
	shaders = list(MAX_POSTPRO_SHADERS)
	shaders[FX_GRAYSCALE] = LoadShader("","shaders/grayscale.fs")
	shaders[FX_POSTERIZATION] = LoadShader("","shaders/posterization.fs")
	shaders[FX_DREAM_VISION] = LoadShader("","shaders/dream_vision.fs")
	shaders[FX_PIXELIZER] = LoadShader("","shaders/pixelizer.fs")
	shaders[FX_CROSS_HATCHING] = LoadShader("","shaders/cross_hatching.fs")
	shaders[FX_CROSS_STITCHING] = LoadShader("","shaders/cross_stitching.fs")
	shaders[FX_PREDATOR_VIEW] = LoadShader("","shaders/predator.fs")
	shaders[FX_SCANLINES] = LoadShader("","shaders/scanlines.fs")
	shaders[FX_FISHEYE] = LoadShader("","shaders/fisheye.fs")
	shaders[FX_SOBEL] = LoadShader("","shaders/sobel.fs")
	shaders[FX_BLOOM] = LoadShader("","shaders/bloom.fs")
	shaders[FX_BLUR] = LoadShader("","shaders/blur.fs")
	currentShader = FX_GRAYSCALE
	target = LoadRenderTexture(screenWidth,screenHeight)
	SetCameraMode(camera,CAMERA_ORBITAL)
	SetTargetFPS(60)
	while !WindowShouldClose() { 
		UpdateCamera(camera)
		if (IsKeyPressed(KEY_RIGHT)) { 
			currentShader++
			elseif (IsKeyPressed(KEY_LEFT))
				currentShader--
		} 
		if (currentShader >= MAX_POSTPRO_SHADERS) { 
			currentShader = 1
			elseif (currentShader < 1)
				currentShader = MAX_POSTPRO_SHADERS-1
		} 
		BeginDrawing()
		ClearBackground(RAYWHITE)
		BeginTextureMode(target)
		ClearBackground(RAYWHITE)
		BeginMode3D(camera)
		DrawModel(model,position,0.1,WHITE)
		DrawGrid(10,1.0)
		EndMode3D()
		EndTextureMode()
		BeginShaderMode(shaders[currentShader])
		DrawTextureRec(target.texture,Rectangle(0,0,target.texture.width,-target.texture.height),Vector2(0,0),WHITE)
		EndShaderMode()
		DrawRectangle(0,9,580,30,Fade(LIGHTGRAY,0.7))
		DrawText("(c) Church 3D model by Alberto Cano",screenWidth-200,screenHeight-20,10,GRAY)
		DrawText("CURRENT POSTPRO SHADER:",10,15,20,BLACK)
		DrawText(postproShaderText[currentShader],330,15,20,RED)
		DrawText("< >",540,10,30,DARKBLUE)
		DrawFPS(700,15)
		EndDrawing()
	} 
	for i = 1 to MAX_POSTPRO_SHADERS step 1 { 
		UnloadShader(shaders[i])
	} 
	UnloadTexture(texture)
	UnloadModel(model)
	UnloadRenderTexture(target)
	CloseWindow()
} 
