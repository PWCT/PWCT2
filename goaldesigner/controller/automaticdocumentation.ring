/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Automatic Documentation
**	Date : 2019.10.17
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class AutomaticDocumentation

	cOutputFolder = PWCT_FOLDER+"/shots"
	nShotID = 0

	func GetNewFileName
		nShotID++
		return cOutputFolder+"/screenshot_"+nShotID+"_"+substr(date(),"/","_")+
					"_"+substr(time(),":","_")+".png"

	func GetScreenShot oWin
		oWin {
			screen = windowhandle().screen()
		}
        	pixmap = screen.grabwindow(0,0,0,-1,-1)
        	image = pixmap.toimage()
		image.save(GetNewFileName(),"png",100)

	func GetWindowShot oWin
		oRect = new QRect()
		oRect.Adjust(0,0,oWin.width(),oWin.height())
		oWin.grab(oRect).toImage().save(GetNewFileName(),"PNG",100)
