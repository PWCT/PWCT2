# ===============================================================#
# Based on sample from : https://github.com/megamarc/Tilengine  #
# ===============================================================#
M_PI = 3.14159265
sintable = list(360)
costable = list(360)
func BuildSinTable  { 
	for c = 1 to 360 step 1 { 
		sintable[c] = sin(c*M_PI/180)*256
		costable[c] = cos(c*M_PI/180)*256
	} 
} 
func CalcSin angle,factor { 
	if angle > 359 { 
		angle = angle%360
	} 
	val = sintable[angle+1]*factor>>8
	return val
} 
func CalcCos angle,factor { 
	if angle > 359 { 
		angle = angle%360
	} 
	val = costable[angle+1]*factor>>8
	return val
} 
