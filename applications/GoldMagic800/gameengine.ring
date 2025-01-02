class GameEngine from GameData
	func Start  { 
		SetGameIcon()
		PrepareCameraData()
	} 
	func Update  { 
		DisplayActiveScreen()
	} 
	func PlaySound  { 
		oGameSound.LoadSound()
	} 
	func SetGameIcon  { 
		# Game Icon
		al_set_display_icon(display,bitmapGold)
	} 
	func PrepareCameraData  { 
		# Prepare Camera Data
		oGameCamera.SCREEN_W = SCREEN_W
		oGameCamera.SCREEN_H = SCREEN_H
		oGameCamera.SCREEN_W_2D = SCREEN_W_2D
		oGameCamera.SCREEN_H_2D = SCREEN_H_2D
	} 
private
