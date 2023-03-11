class GameLogo
	func DrawLogo  { 
		Start2DScreen()
		al_clear_to_color(al_map_rgb(40,40,40))
		DrawLogoImage()
		End2DScreen()
		al_flip_display()
		lFlipDisplay = False
		Sleep(3)
		nActiveScreen = C_SCREEN_STORY
	} 
private
