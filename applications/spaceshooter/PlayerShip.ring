load "Ship.ring"
load "PlayerFire.ring"
class PlayerShip from Ship
	fireDamageAmount = 12
	oldDamageAmount = fireDamageAmount
	powerShotActive = False
	powerShieldActive = False
	_powerTimer = 0
	func move  { 
		timer += getFrameTime()
		if powerShotActive OR powerShieldActive { 
			updatePowerTimer()
		} 
		if IsKeyDown(KEY_LEFT) AND position.x >= 60 { 
			position.x -= speed
		} 
		if IsKeyDown(KEY_RIGHT) AND position.x+w+80 <= screenWidth { 
			position.x += speed
		} 
		if IsKeyDown(KEY_UP) AND position.y-w/2 >= 0 { 
			position.Y -= speed
		} 
		if IsKeyDown(KEY_DOWN) AND position.y+w <= screenHeight { 
			position.Y += speed
		} 
		if IsKeyDown(KEY_SPACE) AND timer >= timeBetweenShots { 
			shot()
		} 
		drawShield()
	} 
	func shot  { 
		firePosition = position
		firePosition.x = firePosition.x+w/2-5
		imagePath = ""
		if powerShotActive { 
			imagePath = "Assets/laserGreen.png"
			else
				imagePath = "Assets/laserBlue.png"
		} 
		gameObjects+ new PlayerFire(firePosition,imagePath,sounds[:laser1],0,fireDamageAmount)
		timer = 0
	} 
	func initTimer  { 
		timeBetweenShots = 0.15
		timer = timeBetweenShots
	} 
	func incrementHealth amount { 
		if health+amount >= 100 { 
			health = 100
			else
				health += amount
		} 
	} 
	func setFireDamageAmount amount { 
		powerShotActive = True
		fireDamageAmount = amount
	} 
	func returnFireDamageAmount  { 
		fireDamageAmount = oldDamageAmount
	} 
	func updatePowerTimer  { 
		_powerTimer += getFrameTime()
		if _powerTimer >= 5 { 
			returnFireDamageAmount()
			powerShotActive = False
			powerShieldActive = False
			_powerTimer = 0
		} 
		if powerShieldActive { 
			DrawText("SHIELD: "+ceil(5-_powerTimer),screenWidth*0.8,screenHeight*0.9,20,GRAY)
			elseif powerShotActive
				DrawText("MEGA SHOT: "+ceil(5-_powerTimer),screenWidth*0.8,screenHeight*0.9,20,GRAY)
		} 
	} 
	func activeTheShield  { 
		powerShieldActive = True
		#Function to draw a shield
	} 
	func drawShield  { 
		if powerShieldActive { 
			image = resources.image("Assets/shield1.png")
			tex = resources.texture(image)
			DrawTexture(tex,position.x-10,position.y-10,WHITE)
		} 
	} 
private
