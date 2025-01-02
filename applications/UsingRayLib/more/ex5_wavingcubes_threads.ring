#===================================================================#
#Based on Original Sample from RayLib (https://www.raylib.com/)
#Ported to RingRayLib by Ring Team
#2020, Ilir Liburn <iliribur@gmail.com>
#===================================================================#
load "raylib.ring"
load "gamelib.ring"
numBlocks = 15
numThreads = 2
#including main thread, min = 1, max = 2 due to race conditions
qub = pow(numBlocks,3)
data = list(numThreads,qub)
mute = al_create_mutex()
screenWidth = 800
screenHeight = 450
prepareData()
createThreads()
startAnimation()
func prepareData  { 
	for j = 1 to numThreads step 1 { 
		for k = 1 to qub step 1 { 
			data[j][k] = [Vec3(),Vec3(),BLACK]
		} 
	} 
} 
func startAnimation  { 
	InitWindow(screenWidth,screenHeight,"Waving Cubes")
	camera = Camera3D(0.0,20.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,75.0,0)
	cam = camera.data()
	SetTargetFPS(10000)
	while !WindowShouldClose() { 
		cameraTime = GetTime()*0.3
		setCamera3DPosX(cam,cos(cameraTime)*40.0)
		setCamera3DPosZ(cam,sin(cameraTime)*40.0)
		BeginDrawing()
		ClearBackground_2(RAYWHITE)
		BeginMode3D_2(cam)
		DrawGrid(10,5.0)
		al_lock_mutex(mute)
		for i = 1 to qub step 1 { 
			DrawCubeV_2(data[1][i][1],data[1][i][2],data[1][i][3])
		} 
		al_unlock_mutex(mute)
		EndMode3D()
		DrawFPS(10,10)
		EndDrawing()
	} 
	CloseWindow()
	Shutdown()
} 
func createThreads  { 
	for t = 2 to numThreads step 1 { 
		al_create_thread("thread("+t+")")
	} 
} 
func thread i { 
	colors = []
	for c = 0 to 359 step 1 { 
		Add(colors,ColorFromHSV_2(c,0.75,0.9))
	} 
	cnt = numBlocks-1
	while true { 
		time = GetTime()
		scale = (2.0+sin(time))*0.7
		v = 1
		for x = 0 to cnt step 1 { 
			for y = 0 to cnt step 1 { 
				for z = 0 to cnt step 1 { 
					blockScale = (x+y+z)/30.0
					scatter = sin(blockScale*20.0+(time*4.0))
					Vec3Set(data[i][v][1],(x-numBlocks/2.0)*(scale*3.0)+scatter,(y-numBlocks/2.0)*(scale*2.0)+scatter,(z-numBlocks/2.0)*(scale*3.0)+scatter)
					size = (2.4-scale)*blockScale
					Vec3Set(data[i][v][2],size,size,size)
					data[i][v][3] = colors[((x+y+z)*18.0)%360+1]
					v++
				} 
			} 
		} 
		al_lock_mutex(mute)
		swap(data,1,i)
		al_unlock_mutex(mute)
	} 
} 
