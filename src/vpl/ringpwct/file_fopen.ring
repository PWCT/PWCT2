/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_fopen Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_fopenComponentController from ComponentControllerParent 

	oView = new file_fopenComponentView

	func GenerateAction 

				if NoValueMsg(:value) or NoValueMsg(:value3) { return False }

				switch Variable(:Value2) {
					
					case 1 cMode = "r" 
					case 2 cMode = "w" 
					case 3 cMode = "a" 
					case 4 cMode = "r+" 
					case 5 cMode = "w+" 
					case 6 cMode = "a+" 
		
				}
		
				NewStep( StepData(:Value3) + " = "  +  T_CT_FILE_FOPEN_ST_VALUE  + StepData(:Value ) +  T_CT_FILE_FOPEN_ST_VALUE2 + 
								StyleData(T_CT_FILE_FOPEN_IP_VALUE2LIST[Variable(:value2)])  )
		SetStepCode( Variable(:Value3) + " = fopen("  + Variable(:Value ) + ',"'  + cMode + '")'  )

		return True 

class file_fopenComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_FOPEN_IP_TITLE )	
		TextBox( T_CT_FILE_FOPEN_IP_VALUE , :value)
		ListBox( T_CT_FILE_FOPEN_IP_VALUE2 , :value2, 
				T_CT_FILE_FOPEN_IP_VALUE2LIST )
		TextBox( T_CT_FILE_FOPEN_IP_VALUE3 , :value3)
		PageButtons()
