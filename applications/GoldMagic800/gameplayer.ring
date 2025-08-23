class GamePlayer
	func PlayerEvents  { 
		# Camera
		# Mouse Events
		oGameCamera.update()
		# Keyboard Events
		PlayUsingTheMouse()
		if key[KEY_ENTER] { 
			key[KEY_ENTER] = False
			oGameCamera {
				lPlay2D = !lPlay2D
			}
		} 
		# Don't support playing in Large 2D Map
		if lNoPlayInLarge2D { 
			if oGameCamera.lPlay2D { 
				return 
			} 
		} 
		if key[key_space] { 
			key[key_space] = false
			restartlevel()
		} 
		# Just accept one key of (Up|Down) and (Left|Right)
		if key[key_up] AND key[key_down] { 
			key[key_up] = False
			key[key_down] = False
		} 
		if key[key_left] AND key[key_right] { 
			key[key_left] = false
			key[key_right] = false
		} 
		if key[key_left] { 
			if nPlayerX > 1 { 
				if  NOT IsWall(nPlayerY,nPlayerX-1) { 
					oGameCamera.FastMoveleft()
					aLevel[nPlayerY][nPlayerX] = C_GOLDGROUND
					nPlayerX--
					if CheckWin() { 
						return 
					} 
					setIsPoint(nPlayerY,nPlayerX)
					aLevel[nPlayerY][nPlayerX] = C_PLAYER
					CheckPointActions()
				} 
			} 
		} 
		if key[key_right] { 
			if nPlayerX < nCols { 
				if  NOT IsWall(nPlayerY,nPlayerX+1) { 
					oGameCamera.FastMoveRight()
					aLevel[nPlayerY][nPlayerX] = C_GOLDGROUND
					nPlayerX++
					if CheckWin() { 
						return 
					} 
					setIsPoint(nPlayerY,nPlayerX)
					aLevel[nPlayerY][nPlayerX] = C_PLAYER
					CheckPointActions()
				} 
			} 
		} 
		if key[key_up] { 
			if nPlayerY > 1 { 
				if  NOT IsWall(nPlayerY-1,nPlayerX) { 
					oGameCamera.FastMoveUp()
					aLevel[nPlayerY][nPlayerX] = C_GOLDGROUND
					nPlayerY--
					if CheckWin() { 
						return 
					} 
					setIsPoint(nPlayerY,nPlayerX)
					aLevel[nPlayerY][nPlayerX] = C_PLAYER
					CheckPointActions()
				} 
			} 
		} 
		if key[key_down] { 
			if nPlayerY < nRows { 
				if  NOT IsWall(nPlayerY+1,nPlayerX) { 
					oGameCamera.FastMoveDown()
					aLevel[nPlayerY][nPlayerX] = C_GOLDGROUND
					nPlayerY++
					if CheckWin() { 
						return 
					} 
					setIsPoint(nPlayerY,nPlayerX)
					aLevel[nPlayerY][nPlayerX] = C_PLAYER
					CheckPointActions()
				} 
			} 
		} 
		# Move by mouse
		AfterMoveByMouse()
	} 
	func CheckWin  { 
		lPlayerWin = IsPlayerWin()
		if lPlayerWin { 
			nActiveScreen = C_SCREEN_LEVELCOMPLETE
		} 
		return lPlayerWin
	} 
	func IsPlayerWin  { 
		switch nActiveDoor { 
			case 0
				return False
			case 1
				nCheck = C_DOOR
			case 2
				nCheck = C_DOOR2
			case 3
				nCheck = C_DOOR3
			case 4
				nCheck = C_DOOR4
			case 5
				nCheck = C_DOOR5
			case 6
				nCheck = C_DOOR6
			case 7
				nCheck = C_DOOR7
			case 8
				nCheck = C_DOOR8
			case 9
				nCheck = C_DOOR9
			case 10
				nCheck = C_DOOR10
			case 11
				nCheck = C_DOOR11
			case 12
				nCheck = C_DOOR12
			case 13
				nCheck = C_DOOR13
			case 14
				nCheck = C_DOOR14
			case 15
				nCheck = C_DOOR15
			case 16
				nCheck = C_DOOR16
		} 
		if aLevel[nPlayerY][nPlayerX] = nCheck { 
			oGameSound.PlayLevelSound()
			ConvertGoldToWall()
			if nActiveDoor != nDoorsCount { 
				nActiveDoor++
				else
					return True
			}
		} 
		return False
	} 
	func SetIsPoint Y,X { 
		if aLevel[Y][X] = C_GROUND { 
			lIsPoint = True
		} 
	} 
	func CheckPointActions  { 
		if lIsPoint { 
			lIsPoint = False
			oGameSound.PlayPointSound()
			nScore += 10
			if nScore = C_MAX_REQUIRED_SCORE_FOR_GOLD AND nActiveDoor = 0 { 
				oGameSound.PlayLevelSound()
				nActiveDoor = 1
			} 
			if nScore > C_MAX_REQUIRED_SCORE_FOR_GOLD AND nActiveDoor = 1 { 
				oGameSound.PlayHitSound()
				nActiveDoor = 0
			} 
			else
				oGameSound.StopPointSound()
				oGameSound.StopHitSound()
		} 
	} 
	func PlayerWin  { 
		# Draw Level Complete Message
		set2DMODE()
		Start2DScreen()
		DrawWinBackGroundImage()
		DrawPlayerWin()
		End2DScreen()
		al_flip_display()
		lFlipDisplay = False
	} 
private
