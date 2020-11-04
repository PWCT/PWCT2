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
				], C_CLEARBUFFER )
		}

	func GenerateQuestionMarkExpr oParser 
		oParser {
			Generate( [
					:Command = :QuestionMark,
					:Expression = Parameter(:Expression)
				], C_CLEARBUFFER )
		}

	func GenerateBlockStart oParser 
		oParser {
			Generate( [
					:Command = :BlockStart
				], C_KEEPBUFFER )
		}

	func GenerateBlockEnd oParser 
		oParser {
			Generate( [
					:Command = :BlockEnd
				], C_KEEPBUFFER )
		}

	func GenerateIfExpr oParser 
		oParser {
			Generate( [
					:Command = :If,
					:Expression = Parameter(:Condition)
				], C_CLEARBUFFER )
		}

	func GenerateLoadLiteral oParser 
		oParser {
			Generate( [
					:Command = :load,
					:Expression = Parameter(:FileName)
				], C_CLEARBUFFER )
		}

	func GenerateFuncPara oParser 
		oParser {
			Generate( [
				  	:Command = :Func,
					:function = Parameter(:FunctionName),
					:Parameters = Parameter(:FunctionParameters)
				], C_CLEARBUFFER )
		}

	func GenerateReturn oParser 
		oParser {
			Generate( [
					:Command = :Return,
					:Expression = Parameter(:Expression)
				], C_CLEARBUFFER )
		}

	func GenerateGiveIdentifier oParser 
		oParser {
			Generate( [
					:Command = :Give,
					:Identifier = Parameter(:Identifier)
				], C_CLEARBUFFER )
		}

	func GenerateDefineClass oParser 
		oParser {
			Generate( [
				  	:Command = :Class,
					:classname = Parameter(:ClassName),
					:parentclassname = Parameter(:ParentClassName)
				], C_CLEARBUFFER )
		}


	func GeneratePrivate oParser 
		oParser {
			Generate( [
				  	:Command = :Private
				], C_CLEARBUFFER )
		}

	func GeneratePackage oParser 
		oParser {
			Generate( [
					:Command = :Package,
					:PackageName = Parameter(:PackageName)
				], C_CLEARBUFFER )
		}

	func GenerateExpressionCommand oParser 
		oParser {
			Generate( [
					:Command = :Expression,
					:Expression = Parameter(:Expression)
				], C_CLEARBUFFER )
		}

	func GenerateWhileExpr oParser 
		oParser {
			Generate( [
					:Command = :While,
					:Expression = Parameter(:Condition)
				], C_CLEARBUFFER )
		}

	func GenerateButExpr oParser 
		oParser {
			Generate( [
					:Command = :But,
					:Expression = Parameter(:Condition)
				], C_CLEARBUFFER )
		}

	func GenerateElse oParser 
		oParser {
			Generate( [
				  	:Command = :Else
				], C_CLEARBUFFER )
		}

	func GenerateForLoop oParser 
		oParser {
			Generate( [
					:Command = :For,
					:Start = Parameter(:Start),
					:To = Parameter(:To),
					:Step = Parameter(:Step)
				], C_CLEARBUFFER )
		}

	func GenerateForInLoop oParser 
		oParser {
			Generate( [
					:Command = :ForIn,
					:Variable = Parameter(:Variable),
					:In = Parameter(:In),
					:Step = Parameter(:Step)
				], C_CLEARBUFFER )
		}

	func GenerateDoAgainExpr oParser 
		oParser {
			Generate( [
					:Command = :DoAgain
				], C_CLEARBUFFER )
		}

	 func GenerateExit oParser 
		oParser {
			Generate( [
					:Command = :Exit,
					:Value = Parameter(:Value)
				], C_CLEARBUFFER )
		}

	 func GenerateLoop oParser 
		oParser {
			Generate( [
					:Command = :Loop,
					:Value = Parameter(:Value)
				], C_CLEARBUFFER )
		}

	 func GenerateBye oParser 
		oParser {
			Generate( [
					:Command = :Bye
				], C_CLEARBUFFER )
		}

	 func GenerateSwitch oParser 
		oParser {
			Generate( [
					:Command = :Switch,
					:Variable = Parameter(:Variable)
				], C_CLEARBUFFER )
		}

	 func GenerateSwitchCase oParser 
		oParser {
			Generate( [
					:Command = :SwitchCase,
					:Value = Parameter(:Value)
				], C_CLEARBUFFER )
		}

	 func GenerateSwitchOther oParser 
		oParser {
			Generate( [
					:Command = :SwitchOther
				], C_CLEARBUFFER )
		}

	 func GenerateImportPackage oParser 
		oParser {
			Generate( [
					:Command = :Import,
					:Value = Parameter(:Value)
				], C_CLEARBUFFER )
		}

	func GenerateTry oParser 
		oParser {
			Generate( [
					:Command = :Try
				], C_KEEPBUFFER )
		}

	func GenerateCatch oParser 
		oParser {
			Generate( [
					:Command = :Try
				], C_KEEPBUFFER )
		}
