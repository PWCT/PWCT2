/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  checkos Component
**	Date : 2017.09.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class checkosComponentController from ComponentControllerParent 

	oView = new checkosComponentView

	func GenerateAction 

		
				switch Variable(:Value2) {
					
					case 1 cFunc = "IsMSDOS" 
					case 2 cFunc = "IsWindows" 
					case 3 cFunc = "IsWindows64" 
					case 4 cFunc = "IsUnix" 
					case 5 cFunc = "IsMacOSX" 
					case 6 cFunc = "IsLinux" 
					case 7 cFunc = "IsFreeBSD" 
					case 8 cFunc = "IsAndroid" 
		
				}
		
				NewStep( StepData(:Value) + " = "  +  T_CT_CHECKOS_ST_VALUE  +
					StyleData(T_CT_CHECKOS_IP_VALUE2LIST[Variable(:Value2)])  )
				SetStepCode( Variable(:Value) + " = "+cFunc+"()"  )
				

		return True 

class checkosComponentView from ComponentViewParent
	 
		Title( T_CT_CHECKOS_IP_TITLE )	
		TextBox( T_CT_CHECKOS_IP_VALUE , :value)
		ListBox( T_CT_CHECKOS_IP_VALUE2 , :value2, 
				T_CT_CHECKOS_IP_VALUE2LIST )
		PageButtons()
