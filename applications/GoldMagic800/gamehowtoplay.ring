class GameHowToPlay
	func HowToPlay  { 
		Start2DScreen()
		DrawStoryBackGroundImage()
		DrawHowToPlayImage()
		End2DScreen()
		al_flip_display()
		lFlipDisplay = False
		if KEY[KEY_SPACE] OR KEY[KEY_ENTER] OR KEY[KEY_ESCAPE] OR Mouse_Button_Down { 
			Mouse_Button_Down = False
			KEY[KEY_SPACE] = False
			KEY[KEY_ENTER] = False
			KEY[KEY_ESCAPE] = False
			nActiveScreen = C_SCREEN_MAINMENU
		} 
	} 
private
