# Author: Bert Mariani (Ring Team)
# ## Move Sprite in Straight Lines and Circles
# ## gGlobals First ... before GameEngine
gIncX = 1
gIncY = 1
PI = 3.1415926535
# ## Circle is 2*PI radians
gDegree = PI/180
# ## 2*PI = 360 degrees	Radians to Degrees
Angle = 1
Radius = 100
Straight = 1
# ## SWITCH Straight=1  Circle=0
Bounced = 0
# ----------------------------------
load "GameEngine.ring"
# Give control to the game engine
func Main  { 
	# Called by the Game Engine
	# Create the Game Object
	oGame = new Game
	{
		title = "My First Game"
		FixedFPS = 1000
		sprite {
			type = GE_TYPE_PLAYER
			# Just for our usage
			x = 400
			y = 400
			width = 100
			height = 100
			file = "images/player.png"
			transparent = true
			Animate = false
			Move = false
			# Custom Movement
			Scaled = true
			keypress = func oGame,oSelf,nKey {
				oSelf {
					switch nKey { 
						case KEY_LEFT
							x -= 10
						case KEY_RIGHT
							x += 10
						case KEY_UP
							y -= 10
						case KEY_DOWN
							y += 10
					} 
				}
			}
			mouse = func oGame,oSelf,nType,aMouseList {
				if nType = GE_MOUSE_UP { 
					oSelf {
						x = aMouseList[GE_MOUSE_X]
						y = aMouseList[GE_MOUSE_Y]
					}
				} 
			}
			state = func oGame,oSelf {
				oSelf {
					# Check boundaries. Reverse direction					
					if x < 0 { 
						x = 0
						Bounced++
						gIncX = 1
					} 
					if y < 0 { 
						y = 0
						Bounced++
						gIncY = 1
					} 
					if x > ogame.width-width { 
						x = ogame.width-width
						Bounced++
						gIncX = -1
					} 
					if y > ogame.height-height { 
						y = ogame.height-height
						Bounced++
						gIncY = -1
					} 
					# Straight angle motion or Circle
					if Straight = 1 { 
						x = x+gIncX
						y = y+gincY
						if Bounced > 6 { 
							Bounced = 0
							Straight = 0
						} 
						else
							# Circular motion								
							angle++
							x = 600
							y = 300
							radius = 200
							aPointXY = DrawCirclePoint(x,y,radius,angle)
							x = aPointXY[1]+300
							y = aPointXY[2]+250
							if angle > 720 { 
								angle = 1
								Straight = 1
							} 
					} 
				}
			}
		}
		# sprite
	}
	# Game						# Start the Events Loop
	return 
	# ##---------------------------------------
	# ------------------------------------------
	# DrawCirclePoint on Circle Circumference
} 
func DrawCirclePoint (x,y,radius,angle) { 
	HCenter = x
	VCenter = y
	radian = Angle*gDegree
	x = cos(radian)
	# Cos() Horz X
	y = sin(radian)
	# Sin() Vert Y
	XPos = x*radius
	YPos = y*radius
	return [XPos,YPos]
} 
