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
					:Expression = Parameter(:Expression)
				] )
			clearTextBuffer()
		}

	func GenerateQuestionMarkExpr oParser 
		oParser {
			Generate( [
					:Command = :QuestionMark,
					:Expression = Parameter(:Expression)
				] )
			clearTextBuffer()
		}

	func GenerateBlockStart oParser 
		oParser {
			Generate( [
					:Command = :BlockStart
				] )
		}

	func GenerateBlockEnd oParser 
		oParser {
			Generate( [
					:Command = :BlockEnd
				] )
		}

	func GenerateIfExpr oParser 
		oParser {
			Generate( [
					:Command = :If,
					:Expression = Parameter(:Condition)
				] )
			clearTextBuffer()
		}

	func GenerateLoadLiteral oParser 
		oParser {
			Generate( [
					:Command = :load,
					:Expression = Parameter(:FileName)
				] )
			clearTextBuffer()
		}

	func GenerateFuncPara oParser 
		oParser {
			Generate( [
				  	:Command = :Func,
					:function = Parameter(:FunctionName),
					:Parameters = Parameter(:FunctionParameters)
				] )
			clearTextBuffer()
		}

	func GenerateReturn oParser 
		oParser {
			Generate( [
					:Command = :Return,
					:Expression = Parameter(:Expression)
				] )
		}

	func GenerateGiveIdentifier oParser 
		oParser {
			Generate( [
					:Command = :Give,
					:Identifier = Parameter(:Identifier)
				] )
		}
