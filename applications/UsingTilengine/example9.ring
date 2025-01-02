# ===============================================================#
# Based on sample from : https://github.com/megamarc/Tilengine  #
# ===============================================================#
load "tilengine.ring"
WIDTH = 400
HEIGHT = 240
MIN_SCALE = 50
MAX_SCALE = 200
# /* RGB sky colors */
sky = [[0x19,0x54,0x75],[0x2C,0xB0,0xDC]]
# /* layers */
LAYER_FOREGROUND = 0
LAYER_BACKGROUND = 1
MAX_LAYER = 2
xpos = 0
ypos = 0
scale = 0
# /* entry point */
func main  { 
	# /* setup engine */
	TLN_Init(WIDTH,HEIGHT,MAX_LAYER,0,0)
	TLN_SetBGColor(34,136,170)
	TLN_SetRasterCallback("raster_callback()")
	# /* load resources */
	TLN_SetLoadPath("assets/fox")
	foreground = TLN_LoadTilemap("psycho.tmx",NULL)
	background = TLN_LoadTilemap("rolo.tmx",NULL)
	TLN_SetLayerTilemap(LAYER_FOREGROUND,foreground)
	TLN_SetLayerTilemap(LAYER_BACKGROUND,background)
	# /* initial values */
	xpos = 0
	ypos = 192
	scale = 100
	# /* main loop */
	TLN_CreateWindow(NULL,0)
	TLN_DisableCRTEffect()
	# /* user input */
	while TLN_ProcessWindow() { 
		if TLN_GetInput(INPUT_LEFT) { 
			xpos--
		} 
		if TLN_GetInput(INPUT_RIGHT) { 
			xpos++
		} 
		if TLN_GetInput(INPUT_UP)&&ypos > 0 { 
			ypos--
		} 
		if TLN_GetInput(INPUT_DOWN) { 
			ypos++
		} 
		if TLN_GetInput(INPUT_A)&&scale < MAX_SCALE { 
			scale += 1
		} 
		if TLN_GetInput(INPUT_B)&&scale > MIN_SCALE { 
			scale -= 1
		} 
		# /* calculate scale factor from fixed point base */
		fgscale = scale/100.0
		bgscale = lerp(scale,MIN_SCALE,MAX_SCALE,0.75,1.5)
		# /* scale dependant lower clipping */
		maxy = 640-(240*100/scale)
		if ypos > maxy { 
			ypos = maxy
		} 
		# /* update position */
		bgypos = lerp(scale,MIN_SCALE,MAX_SCALE,0,80)
		TLN_SetLayerPosition(LAYER_FOREGROUND,xpos*2,ypos)
		TLN_SetLayerPosition(LAYER_BACKGROUND,xpos,bgypos)
		TLN_SetLayerScaling(LAYER_FOREGROUND,fgscale,fgscale)
		TLN_SetLayerScaling(LAYER_BACKGROUND,bgscale,bgscale)
		# /* render to the window */
		TLN_DrawFrame(0)
	} 
	# /* release resources */
	TLN_DeleteTilemap(foreground)
	TLN_DeleteTilemap(background)
	# /* sky color gradient with raster effect */
	TLN_Deinit()
} 
func raster_callback  { 
	line = TLN_GetScanLine()
	if line <= 152 { 
		r = lerp(line,0,152,sky[1][1],sky[2][1])
		g = lerp(line,0,152,sky[1][2],sky[2][2])
		b = lerp(line,0,152,sky[1][3],sky[2][3])
		TLN_SetBGColor(r,g,b)
	} 
	# /* linear interploation */
} 
func lerp x,x0,x1,fx0,fx1 { 
	return (fx0)+((fx1)-(fx0))*((x)-(x0))/((x1)-(x0))
} 
