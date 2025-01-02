# The Ring Standard Library
# Game Engine for 2D Games
# Flappy Bird 3000 Game
oGameState = NULL
if isAndroid() { 
	GAME_FPS = 15
	GAME_FixedFPS = 180
	else
		GAME_FPS = 60
		GAME_FixedFPS = 120
} 
load "gameengine.ring"
func main  { 
	oGame = new Game
	while true { 
		oGameState = new GameState
		oGame {
			FPS = GAME_FPS
			FixedFPS = GAME_FixedFPS
			title = "Flappy Bird 3000"
			icon = "images/fbbirddown.png"
			sprite {
				file = "images/fbback.png"
				x = 0
				y = 0
				width = 800
				height = 600
				scaled = true
				animate = false
				keypress = func ogame,oself,nKey {
					if nkey = key_esc OR nKey = GE_AC_BACK { 
						ogame.shutdown()
						elseif nKey = key_space
							oGameState.startplay = true
							ogame.shutdown = true
					} 
				}
				mouse = func ogame,oself,nType,aMouseList {
					if nType = GE_MOUSE_UP { 
						call oself.keypress(oGame,oSelf,Key_Space)
					} 
				}
			}
			text {
				animate = false
				size = 35
				file = "fonts/pirulen.ttf"
				text = "Flappy Bird 3000"
				x = 150
				y = 50
			}
			text {
				animate = false
				size = 25
				file = "fonts/pirulen.ttf"
				text = "Version 1.0"
				x = 280
				y = 100
			}
			text {
				animate = false
				size = 16
				file = "fonts/pirulen.ttf"
				text = "(C) 2016, RINGLANG TEAM"
				x = 245
				y = 140
			}
			text {
				animate = false
				size = 25
				file = "fonts/pirulen.ttf"
				text = "To Win Get Score = 3000"
				x = 150
				y = 270
			}
			text {
				animate = false
				size = 25
				file = "fonts/pirulen.ttf"
				text = "Press Space to start"
				x = 190
				y = 470
			}
			text {
				animate = false
				size = 20
				file = "fonts/pirulen.ttf"
				text = "Press Esc to Exit"
				x = 260
				y = 510
			}
			animate {
				file = "images/fbbird.png"
				x = 200
				y = 200
				framewidth = 20
				scaled = true
				height = 50
				width = 50
				nStep = 3
				transparent = true
				animate = true
				direction = ge_direction_random
				state = func oGame,oSelf {
					oSelf {
						nStep--
						if nStep = 0 { 
							nStep = 3
							if frame < 3 { 
								frame++
								else
									frame = 1
							} 
						} 
						if x <= 0 { 
							x = 0
						} 
						if y <= 0 { 
							y = 0
						} 
						if x >= 750 { 
							x = 750
						} 
						if y > 550 { 
							y = 550
						} 
					}
				}
			}
			Sound {
				file = "sound/music2.wav"
			}
		}
		if oGameState.startplay { 
			oGame.refresh()
			playstart(oGame)
			oGame.refresh()
		} 
	} 
} 
func playstart oGame { 
	oGame {
		FPS = GAME_FPS
		FixedFPS = GAME_FixedFPS
		nTimeOut = 0
		Title = "Flappy Bird 3000"
		Sprite {
			file = "images/fbback.png"
			x = 0
			y = 0
			width = 800
			height = 600
			scaled = true
			animate = false
			keypress = func ogame,oself,nKey {
				if nkey = key_esc OR nKey = GE_AC_BACK { 
					ogame.shutdown()
				} 
			}
		}
		Map {
			blockwidth = 80
			blockheight = 80
			aMap = [[0,0,0,0,0,0,0,0,0,1,0,0,0,3,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,1,0,0,0],[0,0,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,3,0,0,0,1,0,0,0,1,0,0,0],[0,0,0,0,0,0,0,0,0,3,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,3,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]]
			newmap(aMap)
			aImages = ["images/fbwall.png","images/fbwallup.png","images/fbwalldown.png"]
			state = func oGame,oSelf {
				if oGameState.gameresult = false { 
					px = oGame.aObjects[3].x
					py = oGame.aObjects[3].y
					oSelf {
						x -= 3
						if x < -2100 { 
							x = 0
							newmap(aMap)
						} 
						nCol = getcol(px,0)
						if nCol = 11 OR nCol = 15 OR nCol = 19 OR nCol = 23 OR nCol = 27 { 
							if nCol! = oGameState.lastcol { 
								oGameState.lastcol = nCol
								oGameState.Score += 100
								oGame {
									Sound {
										once = true
										file = "sound/sfx_point.wav"
									}
								}
								checkwin(oGame)
							} 
						} 
					}
					if oSelf.getvalue(px+40,py)! = 0 OR oSelf.getvalue(px+40,py+40)! = 0 OR oSelf.getvalue(px,py)! = 0 OR oSelf.getvalue(px,py+40)! = 0 { 
						oGameState.gameresult = true
						oGame {
							oGame.aObjects[3] {
								file = "images/fbbirddown.png"
								transparentdone = false
								nstep = 0
								frame = 1
							}
							text {
								point = 550
								size = 30
								nStep = 3
								file = "fonts/pirulen.ttf"
								text = "Game Over !!!"
								x = 500
								y = 10
								state = func ogame,oself {
									if oself.y >= 550 { 
										ogame.shutdown = true
									} 
									if oself.y = 90 { 
										ogame {
											Sound {
												once = true
												file = "sound/sfx_die.wav"
											}
										}
									} 
								}
							}
							Sound {
								once = true
								file = "sound/sfx_hit.wav"
							}
						}
					} 
				} 
			}
		}
		animate {
			file = "images/fbbird.png"
			x = 10
			y = 10
			framewidth = 20
			scaled = true
			height = 50
			width = 50
			nStep = 3
			transparent = true
			state = func oGame,oSelf {
				oSelf {
					nStep--
					if nStep = 0 { 
						nStep = 3
						if frame < 3 { 
							frame++
							else
								frame = 1
						} 
					} 
				}
				if  NOT oGameState.playerwin { 
					oGameState.down--
					if oGameState.down = 0 { 
						oGameState.down = 3
						oself {
							y += 25
							if y > 550 { 
								y = 550
							} 
						}
					} 
				} 
			}
			keypress = func ogame,oself,nKey {
				if oGameState.gameresult = false { 
					oself {
						if nkey = key_space { 
							y -= 55
							oGameState.down = 60
							if y <= 0 { 
								y = 0
							} 
						} 
					}
				} 
			}
			mouse = func ogame,oself,nType,aMouseList {
				if nType = GE_MOUSE_UP { 
					call oself.keypress(oGame,oSelf,Key_Space)
				} 
			}
		}
		text {
			animate = false
			point = 400
			size = 30
			file = "fonts/pirulen.ttf"
			text = "Score : "+oGameState.score
			x = 500
			y = 10
			state = func oGame,oSelf {
				oSelf {
					text = "Score : "+oGameState.score
				}
			}
		}
	}
} 
func newmap aMap { 
	aV = [[1,1,3,0,0,2,1,1],[1,3,0,0,0,2,1,1],[1,1,1,3,0,2,1,1],[1,1,1,3,0,0,0,0],[0,0,0,0,2,1,1,1],[0,0,2,1,1,1,1,1],[0,0,0,2,1,1,1,1],[1,1,1,3,0,2,1,1],[1,1,1,1,1,3,0,0],[3,0,0,2,1,1,1,1],[3,0,0,2,3,0,0,2]]
	for x = 10 to 24 step 4 { 
		aVar = aV[(random(10)+1)]
		for y = 1 to 8 step 1 { 
			aMap[y][x] = aVar[y]
		} 
	} 
} 
func checkwin ogame { 
	if oGameState.score = 3000 { 
		oGameState.gameresult = true
		oGameState.playerwin = true
		oGame {
			text {
				point = 400
				size = 30
				nStep = 3
				file = "fonts/pirulen.ttf"
				text = "You Win !!!"
				x = 500
				y = 10
				state = func ogame,oself {
					if oself.y >= 400 { 
						ogame.shutdown = true
						oGameState.Score = 0
					} 
				}
			}
		}
	} 
} 
class GameState
	down = 3
	gameresult = false
	Score = 0
	startplay = false
	lastcol = 0
	playerwin = false
private
