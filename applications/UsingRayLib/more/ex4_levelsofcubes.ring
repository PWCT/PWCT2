#Sample : Top-Down View - Many Levels of Cubes
#2018, Mahmoud Fayed <msfclipper@yahoo.com>
#2020, port to RayLib, Ilir Liburn <iliribur@gmail.com>
#Load Libraries
load "raylib.ring"
#RingRayLib  Library
load "opengl21lib.ring"
#RingOpenGL  Library
TITLE = "Sample : Top-Down View - Many Levels of Cubes"
GPU_FAST = TRUE
#acceleration
FPS = 60
screenWidth = 1280
screenHeight = 650
InitWindow(screenWidth,screenHeight,TITLE)
font = LoadFont("resources/pirulen.ttf")
background = LoadTexture("resources/back.png")
if GPU_FAST { 
	image = LoadImage("resources/cubicmap.png")
	texture = LoadTexture("resources/cubicmap_atlas.png")
	mesh = GenMeshCubicmap(image,Vector3(1.0,1.0,1.0))
	model = LoadModelFromMesh(mesh)
	setmodelmaterialtexture(model,0,MAP_DIFFUSE,texture)
	else
		texture = LoadTexture("resources/n1.png")
		mesh = GenMeshCube_2(1,1,1)
		cube = LoadModelFromMesh(mesh)
		setModelmaterialtexture(cube,0,0,texture)
} 
#angle of rotation for the camera direction
angle = 0.0
#XZ position of the camera
cx = 0.0
lx = 0.0
cz = 5.0
lz = -1.0
fraction = 0.01
textPosition = Vector2(400,400)
cubePosition = Vector3(0,0,0)
camera = Camera3D(cx,10,cz+5,cx,3.0,cz+lz,0,1.0,0,88,CAMERA_PERSPECTIVE)
SetTargetFPS(FPS)
while !WindowShouldClose() { 
	UpdateCamera(camera,CAMERA_ORBITAL)
	BeginDrawing()
	DrawTexture(background,0,0,WHITE)
	BeginMode3D(camera)
	glClear(GL_DEPTH_BUFFER_BIT)
	if GPU_FAST { 
		cubePosition.x = -10
		cubePosition.y = 5
		cubePosition.z = 0
		for i = 1 to 5 step 1 { 
			DrawModel(model,cubePosition,1.0,WHITE)
			cubePosition.y += 1
			cubePosition.z -= 8
		} 
		else
			cubePosition.y = 5.5
			for j = 4 to -28 step -8 { 
				for k in [1,-1,0] step 1 { 
					for i = k*10 to k step -k|1 { 
						cubePosition.x = i
						cubePosition.z = j
						DrawModel(cube,cubePosition,1,WHITE)
						cubePosition.z--
						DrawModel(cube,cubePosition,1,WHITE)
						cubePosition.z--
						DrawModel(cube,cubePosition,1,WHITE)
						cubePosition.z--
						DrawModel(cube,cubePosition,1,WHITE)
						cubePosition.z--
						DrawModel(cube,cubePosition,1,WHITE)
					} 
				} 
				cubePosition.y += 1
			} 
	} 
	EndMode3D()
	DrawTextEx(font,"Ring is fun!",textPosition,60,1,GREEN)
	DrawFPS(10,10)
	EndDrawing()
	speed = (FPS-GetFPS())/10
	if speed < 1 { 
		speed = 1
	} 
	if IsKeyDown(KEY_LEFT) { 
		angle -= fraction*4*speed
		lx = sin(angle)
		lz = -cos(angle)
		elseif IsKeyDown(KEY_RIGHT)
			angle += fraction*4*speed
			lx = sin(angle)
			lz = -cos(angle)
	} 
	if IsKeyDown(KEY_UP) { 
		cx -= lx*speed/10
		cz -= fraction*20*speed
		camera.position.y += fraction*speed
		camera.target.y -= fraction*speed
		elseif IsKeyDown(KEY_DOWN)
			cx += lx*speed/10
			cz += fraction*20*speed
			camera.position.y -= fraction*speed
			camera.target.y += fraction*speed
	} 
	camera.position.x = cx
	camera.position.z = cz+5
	camera.target.x = cx+lx
	camera.target.z = cz+lz
} 
if GPU_FAST { 
	UnloadModel(model)
	UnloadTexture(texture)
	UnloadImage(image)
	else
		UnloadModel(cube)
		UnloadTexture(texture)
} 
UnloadTexture(background)
UnloadFont(font)
CloseWindow()
