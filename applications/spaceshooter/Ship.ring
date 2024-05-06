class Ship
	position
	health
	shipTex
	w
	h
	speed = 12
	rotation = 0
	timeBetweenShots = 0.2
	timer = timeBetweenShots
	collider
	scale = 1
	health = 100
	type = 0
	func init type { 
		this.type = type
		#Load and set the ship image
		initTimer()
		shipImage = loadShipImage()
		if scale = -1 { 
			ImageFlipVertical(shipImage)
		} 
		w = shipImage.width
		h = shipImage.height
		shipTex = LoadTextureFromImage(shipImage)
		#Position the ship
		#Collider init
		position = new Vector2(screenWidth/2,screenHeight*0.8)
		collider = new Collider
		{
			x = this.position.x
			y = this.position.y
			w = this.w
			h = this.h
		}
		return self
	} 
	func initTimer  { 
		timeBetweenShots = 0.2
		timer = timeBetweenShots
	} 
	func draw  { 
		move()
		updateCollider()
		loadTex()
	} 
	func drawShield  { 
	} 
	func loadTex  { 
		DrawTextureEx(shipTex,position,rotation,1,WHITE)
		#Function to update collider position when moving the ship
	} 
	func updateCollider  { 
		collider {
			x = this.position.x
			y = this.position.y
		}
	} 
	func setRotation angle { 
		rotation = angle
	} 
	func setSpeed speed { 
		this.speed = speed
	} 
	func setPosition x,y { 
		this.position = new Vector2(x,y)
	} 
	func setTimeBetweenShots time { 
		this.timeBetweenShots = time
		#Function to check if the ship is dead
	} 
	func checkHealth  { 
		if health <= 0 { 
			return True
		} 
		return False
		#Function to load ship image using a type
	} 
	func loadShipImage  { 
		switch type { 
			case 0
				return resources.image("Assets/Ship1.png") 
			case 1
				return resources.image("Assets/enemyGreen.png") 
			case 2
				return resources.image("Assets/enemyRed.png") 
			case 3
				return resources.image("Assets/enemyBlue.png") 
			case 4
				return resources.image("Assets/enemyBlack.png") 
		} 
	} 
private
