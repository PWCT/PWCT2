class GameScreen
	func DisplayActiveScreen  { 
		switch nActiveScreen { 
			case C_SCREEN_LOGO
				HideMouse()
				DrawLogo()
			case C_SCREEN_STORY
				HideMouse()
				ShowStory()
			case C_SCREEN_MAINMENU
				ShowMouse()
				MainMenu()
				if key[KEY_ESCAPE] { 
					key[KEY_ESCAPE] = False
					ExitFromMainLoop()
				} 
			case C_SCREEN_GAMEPLAY
				# To Enable or Disable (Continue and Restart) options
				HideMouse()
				lGameStarted = True
				PlayLevel()
				if key[KEY_ESCAPE] { 
					key[KEY_ESCAPE] = False
					nActiveScreen = C_SCREEN_MAINMENU
					nActiveItem = 2
				} 
			case C_SCREEN_LEVELCOMPLETE
				HideMouse()
				LevelComplete()
				lFlipDisplay = False
			case C_SCREEN_PLAYERWIN
				HideMouse()
				PlayerWin()
				lFlipDisplay = False
				if Mouse_Button_Down { 
					Mouse_Button_Down = False
					Key[KEY_SPACE] = True
				} 
				if key[KEY_ESCAPE] OR Key[KEY_SPACE] OR Key[KEY_ENTER] { 
					key[KEY_ESCAPE] = False
					key[KEY_SPACE] = False
					key[KEY_ENTER] = False
					ShowTheFinalStory()
				} 
			case C_SCREEN_SELECTLEVEL
				HideMouse()
				SelectLevelScreen()
			case C_SCREEN_HOWTOPLAY
				ShowMouse()
				HowToPlay()
				lFlipDisplay = False
		} 
	} 
private
