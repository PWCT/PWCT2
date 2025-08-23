class GameLevel
	func DefaultLevelData  { 
		nScore = 0
		if lNoPlayInLarge2D { 
			oGameCamera.lPlay2D = False
		} 
	} 
	func PlayLevel  { 
		DrawBackGroundImage()
		LevelStyle()
		oGameCamera.GameLevelCameraView()
		lShowActiveRegionOnly = (nLevel > C_SHOW_ACTIVE_REGION_ONLY_AFTER_LEVEL)
		cDrawingMode = :GamePlay
		DrawLevel()
		if lShow2DMap AND nLevel <= C_SHOW_MAP_UP_TO_LEVEL AND  NOT oGameCamera.lPlay2D { 
			lIs2DMapVisible = True
			oGameCamera.GameMapCameraView()
			lShowActiveRegionOnly = false
			cDrawingMode = :GameMap
			DrawLevel()
			else
				lIs2DMapVisible = False
		} 
		set2DMODE()
		DrawGameName()
		PlayerEvents()
	} 
	func LoadLevel  { 
		if nLevel = 1 { 
			nScore = 0
		} 
		cFileName = "levels/level"+nLevel+".level"
		if !fexists(cFileName) { 
			return 
		} 
		eval(read(cFileName))
		aLevel = aLevelData
		nActiveDoor = 0
		nDoorsCount = 0
		for t1 = 1 to nRows step 1 { 
			for t2 = 1 to nCols step 1 { 
				if aLevel[t1][t2] = C_GOLDMARK OR aLevel[t1][t2] = C_PATHMARK { 
					aLevel[t1][t2] = C_GROUND
				} 
				if aLevel[t1][t2] = C_PLAYER { 
					nPlayerY = t1
					nPlayerX = t2
				} 
				nPos = find([C_DOOR,C_DOOR2,C_DOOR3,C_DOOR4,C_DOOR5,C_DOOR6,C_DOOR7,C_DOOR8,C_DOOR9,C_DOOR10,C_DOOR11,C_DOOR12,C_DOOR13,C_DOOR14,C_DOOR15,C_DOOR16],aLevel[t1][t2])
				if nPos { 
					nDoorsCount = max(nDoorsCount,nPos)
				} 
			} 
		} 
	} 
	func SetCameraAtPlayerPosition  { 
		for t = 1 to (nRows-nPlayerY) step 1 { 
			oGameCamera.FastmoveUp()
		} 
	} 
	func nextlevel  { 
		nLevel++
		loadlevel()
		DefaultLevelData()
		oGameCamera.DefaultCameraData()
		SetCameraAtPlayerPosition()
	} 
	func restartlevel  { 
		loadlevel()
		oGameCamera.DefaultCameraData()
		SetCameraAtPlayerPosition()
		nScore = 0
	} 
	func DrawLevel  { 
		glTranslatef(-21,-3,-30)
		nMode = :none
		for y = 0 to nRows+1 step 1 { 
			for x = 0 to nCols+1 step 1 { 
				if lShowActiveRegionOnly { 
					if  NOT (x >= nPlayerX-C_ACTIVE_REGION_SIZE AND x <= nPlayerX+C_ACTIVE_REGION_SIZE AND y >= nPlayerY-C_ACTIVE_REGION_SIZE AND y <= nPlayerY+C_ACTIVE_REGION_SIZE) { 
						loop 1
					} 
				} 
				if x = 0 OR y = 0 OR x = nCols+1 OR y = nRows+1 { 
					glBindTexture(GL_TEXTURE_2D,WallTexture)
					nMode = :Wall
					else
						glBindTexture(GL_TEXTURE_2D,GroundTexture)
						nMode = :Ground
				} 
				if y >= 1 AND x >= 1 AND y <= nRows AND x <= nCols { 
					switch aLevel[y][x] { 
						case C_PLAYER
							glBindTexture(GL_TEXTURE_2D,PlayerTexture)
							nMode = :Player
						case C_GROUND
							glBindTexture(GL_TEXTURE_2D,GroundTexture)
							nMode = :Ground
						case C_WALL
							glBindTexture(GL_TEXTURE_2D,WallTexture)
							nMode = :Wall
						case C_DOOR
							glBindTexture(GL_TEXTURE_2D,DoorTexture)
							nMode = :Door
						case C_GOLDGROUND
							glBindTexture(GL_TEXTURE_2D,GoldGroundTexture)
							nMode = :GoldGround
						case C_DOOR2
							glBindTexture(GL_TEXTURE_2D,Door2Texture)
							nMode = :Door2
						case C_GOLDCUBE
							glBindTexture(GL_TEXTURE_2D,TexturenewWall)
							nMode = :GoldCube
						case C_DOOR3
							glBindTexture(GL_TEXTURE_2D,Door3Texture)
							nMode = :Door3
						case C_DOOR4
							glBindTexture(GL_TEXTURE_2D,Door4Texture)
							nMode = :Door4
						case C_DOOR5
							glBindTexture(GL_TEXTURE_2D,Door5Texture)
							nMode = :Door5
						case C_DOOR6
							glBindTexture(GL_TEXTURE_2D,Door6Texture)
							nMode = :Door6
						case C_DOOR7
							glBindTexture(GL_TEXTURE_2D,Door7Texture)
							nMode = :Door7
						case C_DOOR8
							glBindTexture(GL_TEXTURE_2D,Door8Texture)
							nMode = :Door8
						case C_DOOR9
							glBindTexture(GL_TEXTURE_2D,Door9Texture)
							nMode = :Door9
						case C_DOOR10
							glBindTexture(GL_TEXTURE_2D,Door10Texture)
							nMode = :Door10
						case C_DOOR11
							glBindTexture(GL_TEXTURE_2D,Door11Texture)
							nMode = :Door11
						case C_DOOR12
							glBindTexture(GL_TEXTURE_2D,Door12Texture)
							nMode = :Door12
						case C_DOOR13
							glBindTexture(GL_TEXTURE_2D,Door13Texture)
							nMode = :Door13
						case C_DOOR14
							glBindTexture(GL_TEXTURE_2D,Door14Texture)
							nMode = :Door14
						case C_DOOR15
							glBindTexture(GL_TEXTURE_2D,Door15Texture)
							nMode = :Door15
						case C_DOOR16
							glBindTexture(GL_TEXTURE_2D,Door16Texture)
							nMode = :Door16
					} 
				} 
				if x = nPlayerX AND Y = nPlayerY { 
					glBindTexture(GL_TEXTURE_2D,PlayerTexture)
					nMode = :Player
				} 
				lDrawAsCube = DrawAsCube(nMode)
				if lDrawAsCube { 
					if (nMode = :Wall OR nMode = :GoldCube) AND lWallSizeIsSmall { 
						glTranslatef(0,1,0)
						else
							glTranslatef(0,2,0)
					} 
				} 
				glPushMatrix()
				glTranslatef(x*2,0,y*2)
				if !lDrawAsCube { 
					DrawGround()
					else
						DrawCubeFixedSizeNoBottom()
				} 
				glPopMatrix()
				if lDrawAsCube { 
					if (nMode = :Wall OR nMode = :GoldCube) AND lWallSizeIsSmall { 
						glTranslatef(0,-1,0)
						else
							glTranslatef(0,-2,0)
					} 
				} 
			} 
		} 
	} 
	func DrawAsCube nMode { 
		if oGameCamera.nViewType = oGameCamera.C_VIEWTYPE_MAP { 
			return False
		} 
		lNotCurrentDoor = NOT CurrentDoor(nMode)
		if nMode = :Wall OR nMode = :Player OR nMode = :GoldCube OR lNotCurrentDoor { 
			return True
		} 
		return False
	} 
	func CurrentDoor nMode { 
		if find([:Door,:Door2,:Door3,:Door4,:Door5,:Door6,:Door7,:Door8,:Door9,:Door10,:Door11,:Door12,:Door13,:Door14,:Door15,:Door16],nMode) { 
			switch nActiveDoor { 
				case 1
					if nMode = :Door { 
						return True
					} 
				case 2
					if nMode = :Door2 { 
						return True
					} 
				case 3
					if nMode = :Door3 { 
						return True
					} 
				case 4
					if nMode = :Door4 { 
						return True
					} 
				case 5
					if nMode = :Door5 { 
						return True
					} 
				case 6
					if nMode = :Door6 { 
						return True
					} 
				case 7
					if nMode = :Door7 { 
						return True
					} 
				case 8
					if nMode = :Door8 { 
						return True
					} 
				case 9
					if nMode = :Door9 { 
						return True
					} 
				case 10
					if nMode = :Door10 { 
						return True
					} 
				case 11
					if nMode = :Door11 { 
						return True
					} 
				case 12
					if nMode = :Door12 { 
						return True
					} 
				case 13
					if nMode = :Door13 { 
						return True
					} 
				case 14
					if nMode = :Door14 { 
						return True
					} 
				case 15
					if nMode = :Door15 { 
						return True
					} 
				case 16
					if nMode = :Door16 { 
						return True
					} 
			} 
			return False
		} 
		return True
	} 
	func IsWall Y,X { 
		if aLevel[Y][X] = C_WALL OR aLevel[Y][X] = C_GOLDCUBE OR (aLevel[Y][X] = C_DOOR AND nActiveDoor != 1) OR (aLevel[Y][X] = C_DOOR2 AND nActiveDoor != 2) OR (aLevel[Y][X] = C_DOOR3 AND nActiveDoor != 3) OR (aLevel[Y][X] = C_DOOR4 AND nActiveDoor != 4) OR (aLevel[Y][X] = C_DOOR5 AND nActiveDoor != 5) OR (aLevel[Y][X] = C_DOOR6 AND nActiveDoor != 6) OR (aLevel[Y][X] = C_DOOR7 AND nActiveDoor != 7) OR (aLevel[Y][X] = C_DOOR8 AND nActiveDoor != 8) OR (aLevel[Y][X] = C_DOOR9 AND nActiveDoor != 9) OR (aLevel[Y][X] = C_DOOR10 AND nActiveDoor != 10) OR (aLevel[Y][X] = C_DOOR11 AND nActiveDoor != 11) OR (aLevel[Y][X] = C_DOOR12 AND nActiveDoor != 12) OR (aLevel[Y][X] = C_DOOR13 AND nActiveDoor != 13) OR (aLevel[Y][X] = C_DOOR14 AND nActiveDoor != 14) OR (aLevel[Y][X] = C_DOOR15 AND nActiveDoor != 15) OR (aLevel[Y][X] = C_DOOR16 AND nActiveDoor != 16) { 
			return True
		}
		return False
	} 
	func LevelStyle  { 
		nStyle = (nLevel%4)+1
		switch nStyle { 
			case 1
				GroundTexture = textureGround2
				WallTexture = textureWall4
			case 2
				GroundTexture = textureGround1
				WallTexture = textureWall2
			case 3
				GroundTexture = textureGround1
				WallTexture = textureWall3
			case 4
				GroundTexture = textureGround3
				WallTexture = textureWall1
		} 
	} 
	func ConvertGoldToWall  { 
		for nY = 1 to nRows step 1 { 
			for nX = 1 to nCols step 1 { 
				if aLevel[nY][nX] = C_GOLDGROUND { 
					aLevel[nY][nX] = C_GOLDCUBE
				} 
			} 
		} 
	} 
	func LevelComplete  { 
		# Wait 1 second so we can see the player position
		# In the end of the level
		DrawBackGroundImage()
		oGameCamera.GameLevelCameraView()
		DrawLevel()
		set2DMODE()
		DrawGameName()
		al_flip_display()
		sleep(1)
		# Draw Level Complete Message
		set2DMODE()
		Start2DScreen()
		DrawWinBackGroundImage()
		DrawLevelComplete()
		End2DScreen()
		al_flip_display()
		lFlipDisplay = False
		Sleep(2)
		DefaultLevelData()
		nActiveScreen = C_SCREEN_GAMEPLAY
		if nLevel = nLevelsCount { 
			nLevel = 0
			nActiveScreen = C_SCREEN_PLAYERWIN
		} 
		nextlevel()
	} 
private
