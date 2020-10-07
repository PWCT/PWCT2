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
				], True )
		}

	func GenerateQuestionMarkExpr oParser 
		oParser {
			Generate( [
					:Command = :QuestionMark,
					:Expression = Parameter(:Expression)
				], True )
		}

	func GenerateBlockStart oParser 
		oParser {
			Generate( [
					:Command = :BlockStart
				], False )
		}

	func GenerateBlockEnd oParser 
		oParser {
			Generate( [
					:Command = :BlockEnd
				], False )
		}

	func GenerateIfExpr oParser 
		oParser {
			Generate( [
					:Command = :If,
					:Expression = Parameter(:Condition)
				], True )
		}

	func GenerateLoadLiteral oParser 
		oParser {
			Generate( [
					:Command = :load,
					:Expression = Parameter(:FileName)
				], True )
		}

	func GenerateFuncPara oParser 
		oParser {
			Generate( [
				  	:Command = :Func,
					:function = Parameter(:FunctionName),
					:Parameters = Parameter(:FunctionParameters)
				], True )
		}

	func GenerateReturn oParser 
		oParser {
			Generate( [
					:Command = :Return,
					:Expression = Parameter(:Expression)
				], True )
		}

	func GenerateGiveIdentifier oParser 
		oParser {
			Generate( [
					:Command = :Give,
					:Identifier = Parameter(:Identifier)
				], True )
		}
