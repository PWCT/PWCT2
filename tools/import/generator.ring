load "../vsfgenerator/generator.ring"

class Generator

	aParseTree = []

	func SetParseTree aTree
		aParseTree = aTree

	func Start 
		oPWCT = new VSFGenerator 
		for aCommand in aParseTree 
			switch aCommand[:Command]
				on :See 
					oPWCT.AddRootStep("See " + aCommand[:Expression])
			off
		next 
		oPWCT.WriteVisualSourceFile()
