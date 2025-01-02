#Copyright (c) 2015 Ramon Santamaria (@raysan5)
#Ported to RingRayLib by Ring Team
load "raylib.ring"
func main  { 
	screenWidth = 800
	screenHeight = 450
	SetConfigFlags(FLAG_MSAA_4X_HINT)
	#Enable Multi Sampling Anti Aliasing 4x (if available)
	InitWindow(screenWidth,screenHeight,"raylib [shaders] example - custom uniform variable")
	#Define the camera to look into our 3d world
	camera = Camera3D(8.0,8.0,8.0,0.0,1.5,0.0,0.0,1.0,0.0,45.0,CAMERA_PERSPECTIVE)
	model = LoadModel("models/barracks.obj")
	#Load OBJ model
	texture = LoadTexture("models/barracks_diffuse.png")
	#Load model texture (diffuse map)
	setmodelmaterialtexture(model,0,MAP_DIFFUSE,texture)
	position = Vector3(0.0,0.0,0.0)
	#Set model position
	#Load postprocessing shader
	#NOTE: Defining 0 (NULL) for vertex shader forces usage of internal default vertex shader
	shader = LoadShader("","shaders/swirl.fs")
	#Get variable (uniform) location on the shader to connect with the program
	#NOTE: If uniform variable could not be found in the shader, function returns -1
	swirlCenterLoc = GetShaderLocation(shader,"center")
	swirlCenter = [screenWidth/2,screenHeight/2]
	#Create a RenderTexture2D to be used for render to texture
	target = LoadRenderTexture(screenWidth,screenHeight)
	SetTargetFPS(60)
	#Set our game to run at 60 frames-per-second
	#--------------------------------------------------------------------------------------
	#Main game loop
	#Detect window close button or ESC key
	while (!WindowShouldClose()) { 
		mousePosition = GetMousePosition()
		swirlCenter[1] = mousePosition.x
		swirlCenter[2] = screenHeight-mousePosition.y
		#Send new value to the shader to be used on drawing
		SetShaderVec2(shader,swirlCenterLoc,swirlCenter)
		UpdateCamera(camera,CAMERA_ORBITAL)
		#Update camera
		BeginDrawing()
		ClearBackground(RAYWHITE)
		BeginTextureMode(target)
		#Enable drawing to texture
		ClearBackground(RAYWHITE)
		#Clear texture background
		BeginMode3D(camera)
		#Begin 3d mode drawing
		DrawModel(model,position,0.5,WHITE)
		#Draw 3d model with texture
		DrawGrid(10,1.0)
		#Draw a grid
		#End 3d mode drawing, returns to orthographic 2d mode
		EndMode3D()
		DrawText("TEXT DRAWN IN RENDER TEXTURE",200,10,30,RED)
		#End drawing to texture (now we have a texture available for next passes)
		EndTextureMode()
		BeginShaderMode(shader)
		#NOTE: Render texture must be y-flipped due to default OpenGL coordinates (left-bottom)
		DrawTextureRec(target.texture,Rectangle(0,0,target.texture.width,-target.texture.height),Vector2(0,0),WHITE)
		#Draw some 2d text over drawn texture
		EndShaderMode()
		DrawText("(c) Barracks 3D model by Alberto Cano",screenWidth-220,screenHeight-20,10,GRAY)
		DrawFPS(10,10)
		#----------------------------------------------------------------------------------
		EndDrawing()
	} 
	UnloadShader(shader)
	#Unload shader
	UnloadTexture(texture)
	#Unload texture
	UnloadModel(model)
	#Unload model
	UnloadRenderTexture(target)
	#Unload render texture
	#Close window and OpenGL context
	CloseWindow()
} 
