#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose : Target
#**	Date : 2020.02.20
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class Target
	func GenerateSeeExpr oParser { 
		oParser {
			Generate([:Command = : see,:Expression = Parameter(:Expression)],C_CLEARBUFFER)
		}
	} 
	func GenerateQuestionMarkExpr oParser { 
		oParser {
			Generate([:Command = :QuestionMark,:Expression = Parameter(:Expression)],C_CLEARBUFFER)
		}
	} 
	func GenerateBlockStart oParser { 
		oParser {
			Generate([:Command = :BlockStart],C_KEEPBUFFER)
		}
	} 
	func GenerateBlockEnd oParser { 
		oParser {
			Generate([:Command = :BlockEnd],C_KEEPBUFFER)
		}
	} 
	func GenerateIfExpr oParser { 
		oParser {
			Generate([:Command = : if,:Expression = Parameter(:Condition)],C_CLEARBUFFER)
		}
	} 
	func GenerateLoadLiteral oParser { 
		oParser {
			Generate([:Command = : load,:Expression = Parameter(:FileName),:Type = Parameter(:Type)],C_CLEARBUFFER)
		}
	} 
	func GenerateFuncPara oParser { 
		oParser {
			Generate([:Command = : func,: function = Parameter(:FunctionName),:Parameters = Parameter(:FunctionParameters)],C_CLEARBUFFER)
		}
	} 
	func GenerateReturn oParser { 
		oParser {
			Generate([:Command = : return,:Expression = Parameter(:Expression)],C_CLEARBUFFER)
		}
	} 
	func GenerateGiveIdentifier oParser { 
		oParser {
			Generate([:Command = : give,:Identifier = Parameter(:Identifier)],C_CLEARBUFFER)
		}
	} 
	func GenerateDefineClass oParser { 
		oParser {
			Generate([:Command = : class,:classname = Parameter(:ClassName),:parentclassname = Parameter(:ParentClassName)],C_CLEARBUFFER)
		}
	} 
	func GeneratePrivate oParser { 
		oParser {
			Generate([:Command = : private],C_CLEARBUFFER)
		}
	} 
	func GeneratePackage oParser { 
		oParser {
			Generate([:Command = : package,:PackageName = Parameter(:PackageName)],C_CLEARBUFFER)
		}
	} 
	func GenerateExpressionCommand oParser { 
		oParser {
			cExpr = Parameter(:Expression)
			#Because we may have Assignment Component during expression
			if Parameter(:LeftSide) != "" { 
				cExpr = Parameter(:LeftSide)+cExpr
			} 
			#Don't generate empty lines
			if trim(cExpr) = "" { 
				return 
			} 
			Generate([:Command = :Expression,:Expression = cExpr],C_CLEARBUFFER)
		}
	} 
	func GenerateWhileExpr oParser { 
		oParser {
			Generate([:Command = : while,:Expression = Parameter(:Condition)],C_CLEARBUFFER)
		}
	} 
	func GenerateButExpr oParser { 
		oParser {
			Generate([:Command = :but,:Expression = Parameter(:Condition)],C_CLEARBUFFER)
		}
	} 
	func GenerateElse oParser { 
		oParser {
			Generate([:Command = :else],C_CLEARBUFFER)
		}
	} 
	func GenerateForLoop oParser { 
		oParser {
			Generate([:Command = : for,:Start = Parameter(:Start),:to = Parameter(:to),:step = Parameter(:step)],C_CLEARBUFFER)
		}
	} 
	func GenerateForInLoop oParser { 
		oParser {
			Generate([:Command = :ForIn,:Variable = Parameter(:Variable),:in = Parameter(:in),:step = Parameter(:step)],C_CLEARBUFFER)
		}
	} 
	func GenerateDoAgainExpr oParser { 
		oParser {
			Generate([:Command = :DoAgain],C_CLEARBUFFER)
		}
	} 
	func GenerateExit oParser { 
		oParser {
			Generate([:Command = : exit,:Value = Parameter(:Value)],C_CLEARBUFFER)
		}
	} 
	func GenerateLoop oParser { 
		oParser {
			Generate([:Command = : loop,:Value = Parameter(:Value)],C_CLEARBUFFER)
		}
	} 
	func GenerateBye oParser { 
		oParser {
			Generate([:Command = : bye],C_CLEARBUFFER)
		}
	} 
	func GenerateSwitch oParser { 
		oParser {
			Generate([:Command = : switch,:Variable = Parameter(:Variable)],C_CLEARBUFFER)
		}
	} 
	func GenerateSwitchCase oParser { 
		oParser {
			Generate([:Command = :SwitchCase,:Value = Parameter(:Value)],C_CLEARBUFFER)
		}
	} 
	func GenerateSwitchOther oParser { 
		oParser {
			Generate([:Command = :SwitchOther],C_CLEARBUFFER)
		}
	} 
	func GenerateImportPackage oParser { 
		oParser {
			Generate([:Command = : import,:Value = Parameter(:Value)],C_CLEARBUFFER)
		}
	} 
	func GenerateTry oParser { 
		oParser {
			Generate([:Command = : try],C_KEEPBUFFER)
		}
	} 
	func GenerateCatch oParser { 
		oParser {
			Generate([:Command = :catch],C_KEEPBUFFER)
		}
	} 
	func GenerateAssignment oParser { 
		oParser {
			Generate([:Command = :Assignment,:LeftSide = Parameter(:LeftSide),:RightSide = Parameter(:RightSide)],C_CLEARBUFFER)
		}
	} 
	func GenerateUsingBraces oParser { 
		oParser {
			Generate([:Command = :UsingBraces],C_CLEARBUFFER)
		}
	} 
	func GenerateComment oParser { 
		oParser {
			Generate([:Command = :Comment,:Comment = oParser.cTokenValue],C_KEEPBUFFER)
		}
	} 
private
