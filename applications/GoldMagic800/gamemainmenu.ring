class GameMainMenu
	func MainMenu  { 
		oGameSound.PlayBackGroundMusic()
		Start2DScreen()
		DrawMainMenuBackGroundImage()
		if lUseGameTitleImage { 
			DrawGameTitleImage()
			else
				DrawTitle(Title,80,350)
		} 
		# Mouse Events
		if lMouseMove { 
			lMouseMove = False
			for x = 1 to len(aMenu) step 1 { 
				if lGameStarted = False AND (x = 2 OR x = 3) { 
					loop 1
				} 
				if Mouse_Y >= Position2D_Y(SCREEN_H_2D-850+(100*x)) AND Mouse_Y <= Position2D_Y(SCREEN_H_2D-850+(100*x)+100) AND Mouse_X >= Position2D_X((SCREEN_W_2D/2)-250) AND Mouse_X <= Position2D_X((SCREEN_W_2D/2)-250+600) { 
					if nActiveItem != X { 
						oGameSound.StopMenuChangeSound()
						oGameSound.PlayMenuChangeSound()
						nActiveItem = X
					}
				} 
			} 
		} 
		if Mouse_Button_Down { 
			Mouse_Button_Down = False
			Key[KEY_SPACE] = True
		} 
		for x = 1 to len(aMenu) step 1 { 
			cMenu = aMenu[x]
			if x = nActiveItem { 
				DrawOption(cMenu,SCREEN_H_2D-850+(100*x),(SCREEN_W_2D/2)-250,True)
				else
					if lGameStarted = False AND (x = 2 OR x = 3) { 
						DrawDisabledOption(cMenu,SCREEN_H_2D-850+(100*x),(SCREEN_W_2D/2)-250,False)
						else
							DrawOption(cMenu,SCREEN_H_2D-850+(100*x),(SCREEN_W_2D/2)-250,False)
					} 
			} 
		} 
		# Keyboard Events
		End2DScreen()
		if key[KEY_DOWN] { 
			key[KEY_DOWN] = False
			oGameSound.StopMenuChangeSound()
			oGameSound.PlayMenuChangeSound()
			if nActiveItem < len(aMenu) { 
				nActiveItem++
				if nActiveItem = 2 AND lGameStarted = False { 
					nActiveItem = 4
				} 
				else
					nActiveItem = 1
					return 
			} 
		} 
		if key[KEY_UP] { 
			key[KEY_UP] = False
			oGameSound.StopMenuChangeSound()
			oGameSound.PlayMenuChangeSound()
			if nActiveItem > 1 { 
				nActiveItem--
				if nActiveItem = 3 AND lGameStarted = False { 
					nActiveItem = 1
				} 
				else
					nActiveItem = len(aMenu)
					return 
			} 
		} 
		if Key[KEY_SPACE] = True OR Key[KEY_ENTER] = True { 
			Key[KEY_SPACE] = False
			key[KEY_ENTER] = False
			oGameSound.StopMenuClickSound()
			oGameSound.PlayMenuClickSound()
			switch nActiveItem { 
				case 1
					nActiveScreen = C_SCREEN_SELECTLEVEL
				case 2
					nActiveScreen = C_SCREEN_GAMEPLAY
				case 3
					nActiveScreen = C_SCREEN_GAMEPLAY
					DefaultLevelData()
					loadLevel()
					oGameCamera.DefaultCameraData()
					SetCameraAtPlayerPosition()
				case 4
					oGameSound.SoundOnOff()
					ItemOnOff(aMenu,4)
				case 5
					oGameSound.MusicOnOff()
					ItemOnOff(aMenu,5)
				case 6
					nActiveScreen = C_SCREEN_HOWTOPLAY
				case 7
					ExitFromMainLoop()
			} 
		} 
	} 
	func ItemOnOff aList,nIndex { 
		if substr(aList[nIndex],"ON") { 
			aList[nIndex] = substr(aList[nIndex],"ON","OFF")
			else
				aList[nIndex] = substr(aList[nIndex],"OFF","ON")
		} 
	} 
private
