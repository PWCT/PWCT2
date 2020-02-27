/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Target 
**	Date : 2020.02.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class Target

	 func GenerateSeeExpr oParser 
		oParser {
			Generate( [
					:Command = :See,
					:Expression = cBuffer
				] )
			clearTextBuffer()
		}

	func GenerateQuestionMarkExpr oParser 
		oParser {
			Generate( [
					:Command = :QuestionMark,
					:Expression = cBuffer
				] )
			clearTextBuffer()
		}
