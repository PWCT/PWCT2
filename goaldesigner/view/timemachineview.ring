/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Time Machine View Class
**	Date : 2016.12.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TimeMachineView from QSlider

	nInteractionPoints = 0

	func init win
		super.init(win)
		resize(400,30)
		settickinterval(100)
		setorientation(Qt_Horizontal)
