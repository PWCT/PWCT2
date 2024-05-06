class Fire
	position
	fireTex
	speed = 12
	deathTimer = 2
	rotation = 0
	damageAmount = 30
	h
	func init pos,file,sound,enemyType,damageAmount { 
		position = pos
		this.damageAmount = damageAmount
		setFireAmount(enemyType)
		fireImage = resources.image(file)
		fireTex = resources.texture(fireImage)
		h = fireimage.height
		playFireSound(sound)
		return self
	} 
	func draw  { 
		deathTimer -= getFrameTime()
		position.y -= speed
		if position.y+h/2 <= 0 { 
			deathTimer = 0
		} 
		DrawTextureEx(fireTex,position,rotation,1,WHITE)
	} 
	func tryToDestroy  { 
		if deathTimer <= 0 { 
			return True
		} 
		return False
	} 
	func playFireSound sound { 
		playSound(sound)
		#Function to set ship damage amount using ship type
	} 
	func setFireAmount enemyType { 
		if enemyType <= 0 { 
			return 
		} 
		switch enemyType { 
			case 1
				damageAmount = 2
			case 2
				damageAmount = 2
			case 3
				damageAmount = 3
			case 4
				damageAmount = 3
		} 
	} 
private
