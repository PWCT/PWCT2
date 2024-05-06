load "stdlibcore.ring"
load "raylib.ring"
load "Resources.ring"
load "Fire.ring"
load "Ship.ring"
load "PlayerShip.ring"
load "EnemyShip.ring"
load "Collider.ring"
load "Waves.ring"
load "Scene.ring"
load "MainMenuScene.ring"
load "HelathPower.ring"
load "ShotPower.ring"
load "ShieldPower.ring"
screenWidth = 800
screenHeight = 600
score = 0
gameObjects = []
waves = []
timeBetweenWave = 3
WaveTimer = timeBetweenWave
currentWave = 1
currentShipsRow = 1
timeBetweenPower = 10
powerTimer = 0
isFinished = False
#RingRayLib window inti
InitWindow(screenWidth,screenHeight,"Space Shooter")
windowIcon = resources.Image("Assets/icon.png")
SetWindowIcon(windowIcon)
SetTargetFPS(60)
#Create the main ship (The player)
player = new PlayerShip(0)
gameObjects+player
#Load game sounds
InitAudioDevice()
Sounds = [:laser1 = LoadSound("Assets/laser1.ogg"),:laser2 = LoadSound("Assets/laser2.ogg")]
#Play music
mainMusic = LoadMusicStream("Assets/Dimensions.ogg")
PlayMusicStream(mainMusic)
#Waves init
#Load background
generateWave()
backgroundImage = resources.Image("Assets/black.png")
ImageResize(backgroundImage,screenWidth,screenHeight)
backgroundTex = resources.texture(backgroundImage)
#Scenes
mainMenuScene = new MainMenuScene()
{
	name = "SPACE SHOOTER"
}
while !WindowShouldClose() { 
	BeginDrawing()
	DrawTexture(backgroundTex,0,0,WHITE)
	#Load the main scene until the user click the play button
	while  NOT mainMenuScene.isDone { 
		DrawTexture(backgroundTex,0,0,WHITE)
		mainMenuScene.draw()
		EndDrawing()
	} 
	if mainMenuScene.lCloseGame { 
		exit 1
	} 
	#Game play scene
	UpdateMusicStream(mainMusic)
	#If the current wave has been finished, wait before start the next wave
	#Update time between power
	WaveTimer += getFrameTime()
	#Generate a new power
	powerTimer += getFrameTime()
	if powerTimer >= timeBetweenPower AND  NOT isFinished { 
		generatePower()
		powerTimer = 0
	} 
	#Check if the player dead or not
	if gameObjects[1].checkHealth() { 
		DrawText("GAME OVER",screenWidth/2-220,screenHeight*0.4,72,RED)
		EndDrawing()
		loop 1
	} 
	#Wave generator
	#Timer between wave's row
	if currentWave <= len(waves) AND WaveTimer >= timeBetweenWave { 
		#Generate the next wave row
		waves[currentWave].timer += getFrameTime()
		if waves[currentWave].timer >= waves[currentWave].timeBetweenRow { 
			waves[currentWave].timer = 0
			#Current wave's row generator
			if currentShipsRow <= len(waves[currentWave].shipsRow) { 
				for i = 1 to len(waves[currentWave].shipsRow[currentShipsRow]) step 1 { 
					generateEnemy(i,waves[currentWave].shipsRow[currentShipsRow][i])
				} 
				currentShipsRow++
				else
					#End of the wave
					currentShipsRow = 1
					currentWave++
					WaveTimer = 0
			} 
		} 
		#Game ends
		elseif currentWave > len(waves)
			isFinished = True
			DrawText("YOU WIN",screenWidth/2-130,screenHeight*0.4,72,BLUE)
	} 
	#Number of waves
	DrawText("WAVE "+currentWave+" / "+len(waves),screenWidth*0.05,screenHeight*0.05,20,GRAY)
	#Render all gameObjects
	for i = len(gameobjects) to 1 step -1 { 
		#if the current object damageable check its health
		gameObjects[i].draw()
		if ismethod(gameObjects[i],"checkHealth") AND gameObjects[i].checkHealth() { 
			if i > 1 { 
				del(gameObjects,i)
				#Update the score
				score += 2
			} 
			loop 1
		} 
		#if the current object has timer to dead try to destroy it
		if isattribute(gameObjects[i],:deathTimer) { 
			if gameObjects[i].tryToDestroy() { 
				gameObjects[i] = null
				del(gameobjects,i)
				loop 1
			} 
		} 
		#if the current object is enemy fire
		if classname(gameObjects[i]) = "enemyfire" { 
			firePos = gameObjects[i].position
			#Check if the main ship collides with the enemy fire
			#Check if the player has a shield
			if isattribute(gameObjects[1],:collider) AND gameObjects[1].collider.intersectWithPoint(firePos.x,firePos.y) { 
				if  NOT gameObjects[1].powerShieldActive { 
					gameObjects[1].health -= gameObjects[i].damageAmount
				} 
				del(gameObjects,i)
				loop 1
			} 
		} 
		#Check if the main ship collides with a power
		if classname(gameObjects[i]) = "healthpower" OR classname(gameObjects[i]) = "shotpower" OR classname(gameObjects[i]) = "shieldpower" { 
			if gameObjects[1].collider.intersectWithPoint(gameObjects[i].position.x,gameObjects[i].position.y) { 
				gameObjects[i].activate(gameObjects[1])
				del(gameObjects,i)
				loop 1
			} 
		} 
		#Check if the main ship fire collides with an enemy
		if classname(gameObjects[i]) = "playerfire" { 
			checkCollisionWithEnemies(gameObjects[i],i)
			loop 1
		} 
	} 
	#Draw player health and score
	showPlayerHealth()
	showPlayerScore()
	EndDrawing()
} 
#Function to check if main ship fire collides with an enemy
CloseWindow()
func checkCollisionWithEnemies playerFire,index { 
	for i = 2 to len(gameObjects) step 1 { 
		if classname(gameObjects[i]) = "enemyship" { 
			if gameObjects[i].collider.intersectWithPoint(playerFire.position.x,playerFire.position.y) { 
				gameObjects[i].health -= playerFire.damageAmount
				del(gameObjects,index)
				return True
			} 
		} 
	} 
	return False
	#Function to generate enemy
} 
func generateEnemy index,type { 
	if type = 0 { 
		return 
	} 
	gameObjects+ new EnemyShip(getShipType()) {
		setPosition(0+40*2.4*index,-100)
		setSpeed(1)
		setTimeBetweenShots(1)
		scale = -1
	}
	#Function to return ship type using the current wave state
} 
func getShipType  { 
	if currentWave >= 15 { 
		return 4 
		elseif currentWave >= 10
			return 3 
		elseif currentWave >= 5
			return 2 
		elseif currentWave >= 1
			return 1 
	} 
	#Function to generate random power in random position
} 
func generatePower  { 
	randx = random(screenWidth-180)+70
	randy = random(screenHeight-150)+100
	randPos = new Vector2(randx,randy)
	randType = random(2)+1
	switch randType { 
		case 1
			gameObjects+ new HealthPower(6,randType,randPos)
		case 2
			gameObjects+ new ShotPower(5,randType,randPos)
		case 3
			gameObjects+ new ShieldPower(5,randType,randPos)
	} 
	#Function to draw player health
} 
func showPlayerHealth  { 
	DrawText("SHIP HEALTH: "+gameObjects[1].health,screenWidth*0.05,screenHeight*0.9,20,GRAY)
	#Function to draw player score
} 
func showPlayerScore  { 
	DrawText("SCORE: "+score,screenWidth*0.05,screenHeight*0.94,20,GRAY)
	## Function to generate the game waves using Ring list
} 
func generateWave  { 
	#Easy
	waves+ new Waves {
		timeBetweenRow = 5
		shipsRow = [[1],[0,0,0,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 5
		shipsRow = [[1,1],[0,0,1,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 5
		shipsRow = [[1,1],[1,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 5
		shipsRow = [[0,0,1,1],[0,0,1,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 5
		shipsRow = [[0,1,0,1,0,1],[0,1,0,1,0,1],[0,1,0,1,0,1]]
	}
	#Medium
	waves+ new Waves {
		timeBetweenRow = 3
		shipsRow = [[0,1,0,1,0,1],[1,0,1,0,1,0],[0,1,0,1,0,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 3
		shipsRow = [[1,0,1,0,1,0],[0,1,0,1,0,1],[1,0,1,0,1,0]]
	}
	waves+ new Waves {
		timeBetweenRow = 3
		shipsRow = [[1,0,1,1,0,1],[1,1,0,0,1,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 3
		shipsRow = [[1],[0,1,1],[0,0,1,1,1],[0,0,0,1,1,1,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 3
		shipsRow = [[0,0,0,1,1,1,1],[0,0,1,1,1],[0,1,1],[1]]
	}
	waves+ new Waves {
		timeBetweenRow = 2
		shipsRow = [[0,0,0,1,0,0],[0,0,1,0,1,0],[0,1,0,0,0,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 2
		shipsRow = [[0,0,0,1,0,0],[0,1,1,0,1,1],[1,1,0,0,1,1],[1,1,1,1,1,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 2
		shipsRow = [[1,1],[0,0,1,1],[0,0,0,0,1,1]]
	}
	#Hard
	waves+ new Waves {
		timeBetweenRow = 2
		shipsRow = [[1,1,0,0,1,1],[0,0,1,1,0,0],[1,1,0,0,1,1],[0,0,1,1,0,0]]
	}
	waves+ new Waves {
		timeBetweenRow = 0.5
		shipsRow = [[1,0,1],[0,1,0],[0,0,0,1,0,1],[0,0,0,0,1,0]]
	}
	waves+ new Waves {
		timeBetweenRow = 0.5
		shipsRow = [[0,0,0,1,0,1],[0,0,0,0,1,0],[1,0,1],[0,1,0]]
	}
	waves+ new Waves {
		timeBetweenRow = 2
		shipsRow = [[1,1,0,0,1,1],[0,0,1,1,0,0],[1,1,1,1,1,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 2
		shipsRow = [[1,0,0,0,0,1],[0,1,0,0,1,0],[0,0,1,1,0,0],[0,0,1,1,0,0],[0,1,0,0,1,0],[1,0,0,0,0,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 2
		shipsRow = [[1,0,1,1,0,1],[0,1,0,0,1,0],[1,0,1,1,0,0],[0,0,1,1,0,1],[0,1,0,0,1,0],[1,0,1,1,0,1]]
	}
	waves+ new Waves {
		timeBetweenRow = 2
		shipsRow = [[1,0,1,1,0,1],[0,1,1,0,1,0],[1,0,1,1,0,1],[1,0,1,1,0,1],[0,1,0,1,1,0],[1,0,1,1,0,1]]
	}
} 
