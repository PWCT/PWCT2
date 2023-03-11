class GameSelectLevel
	func SelectLevelScreen  { 
		oGameCamera.lPlay2D = False
		nOldPlayerX = nPlayerX
		nOldPlayerY = nPlayerY
		nCurrentLevel = nLevel
		nLevel = nSelectedLevel
		LevelStyle()
		LoadLevel()
		nLevel = nCurrentLevel
		lShowActiveRegionOnly = False
		set2DMODE()
		Start2DScreen()
		DrawMainMenuBackGroundImage()
		if lUseGameTitleImage { 
			DrawGameTitleImage()
			else
				DrawTitle(Title,80,350)
		} 
		DrawOption("SELECT LEVEL ("+nSelectedLevel+")",SCREEN_H_2D-750+(100*5),(SCREEN_W_2D/2)-300,True)
		DrawOption("PRESS SPACE TO START",SCREEN_H_2D-750+(100*6),(SCREEN_W_2D/2)-400,True)
		End2DScreen()
		oGameCamera.GameLevelCameraView()
		oGameCamera.GameMapCameraView()
		C_MAP_SIZE_WIDTH = SCREEN_W/3
		C_MAP_SIZE_HEIGHT = SCREEN_H/2
		glViewport(SCREEN_W-C_MAP_SIZE_WIDTH-(SCREEN_W/3),SCREEN_H-C_MAP_SIZE_HEIGHT-20-(SCREEN_H/3),C_MAP_SIZE_WIDTH,C_MAP_SIZE_HEIGHT)
		cDrawingMode = :GameMap
		DrawLevel()
		set2DMODE()
		nPlayerX = nOldPlayerX
		nPlayerY = nOldPlayerY
		SelectLevelEvents()
	} 
	func SelectLevelEvents  { 
		# Mouse Events
		if Mouse_Button_Down { 
			Mouse_Button_Down = False
			Key[KEY_SPACE] = True
		} 
		# Keyboard Events
		if KEY[KEY_RIGHT] OR KEY[KEY_UP] { 
			KEY[KEY_RIGHT] = False
			KEY[KEY_UP] = False
			oGameSound.StopMenuChangeSound()
			oGameSound.PlayMenuChangeSound()
			if nSelectedLevel < nLevelsCount { 
				nSelectedLevel++
				else
					nSelectedLevel = 1
			} 
		} 
		if KEY[KEY_LEFT] OR KEY[KEY_DOWN] { 
			KEY[KEY_LEFT] = False
			KEY[KEY_DOWN] = False
			oGameSound.StopMenuChangeSound()
			oGameSound.PlayMenuChangeSound()
			if nSelectedLevel > 1 { 
				nSelectedLevel--
				else
					nSelectedLevel = nLevelsCount
			} 
		} 
		if Key[KEY_SPACE] OR Key[KEY_ENTER] { 
			KEY[KEY_SPACE] = False
			KEY[KEY_ENTER] = False
			oGameSound.StopMenuClickSound()
			oGameSound.PlayMenuClickSound()
			StartPlaying(nSelectedLevel)
		} 
		if key[KEY_ESCAPE] { 
			key[KEY_ESCAPE] = False
			nActiveScreen = C_SCREEN_MAINMENU
			nActiveItem = 1
		} 
	} 
	func StartPlaying nLevelIndex { 
		nActiveScreen = C_SCREEN_GAMEPLAY
		nLevel = nLevelIndex
		DefaultLevelData()
		loadLevel()
		oGameCamera.DefaultCameraData()
		SetCameraAtPlayerPosition()
	} 
private
