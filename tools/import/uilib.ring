C_WIDTH	= 12

func Width cText,nWidth
	return cText+Copy(" ",nWidth-len(cText))
