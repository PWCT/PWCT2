/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Generate Ring Code from PWCT Visual Source File 
**	Date : 2025.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Load Ring Libraries
	load "stdlibcore.ring"

# Load General Libraries
	load "../../general/globals.ring"
	load "../../general/mainlib.ring"
	load "../../general/log.ring"
	
# Load the File System Files
	C_VPL_NAME = "RingPWCT"
	load "../../filesystem/visualsourcefile2.ring"

# Mobile functions 
	load "../../mobile/mobilefunctions.ring"

# Goal Designer Model Files
	load "../../goaldesigner/goaldesignermodel.ring"
	load "../../goaldesigner/treemodel.ring"
	load "../../goaldesigner/interactionmodel.ring"

# HTML Styles - Used by Goal Designer Model
	load "../../goaldesigner/htmlfunctions.ring"
	load "../../goaldesigner/htmlstyles.ring"

# Load PWCT Translation 
	load "../../translation/english.ring"

func main 
	drawline()
	? "PWCT2Ring Converter"
	? "2025, Mahmoud Fayed"
	drawline()
	
	aAppArgs = AppArguments()

	if aAppArgs {
		cInputFile = aAppArgs[1]
		if fexists(cInputFile) and right(cInputFile,5) = ".pwct" {
			cOutputFile = left(cInputFile,len(cInputFile)-5) + ".ring"
			? "Input  File: " + cInputFile
			? "Output File: " + cOutputFile
			process(cInputFile,cOutputFile)
		}
	}

func drawline 
	? Copy("=",60)

func process cInputFile,cOutputFile

	oVisualSourceFile = new VisualSourceFile
	oVisualSourceFile.cFileName = cInputFile
	oVisualSourceFile.LoadTables()
	aStepsTree    =  oVisualSourceFile.GetStepsTreeTable()
	aInteractions =  oVisualSourceFile.GetInteractionsTable()
	nStepsIDCounter = oVisualSourceFile.GetStepsID()
	nInteractionsIDCounter = oVisualSourceFile.GetInteractionsID()
	oVisualSourceFile.Close()

	oModel = new GoalDesignerModel
	oModel.oStepsTreeModel = new TreeModel 
	oModel.oInteractionModel = new InteractionModel
	oModel.oStepsTreeModel.SetData(aStepsTree)
	oModel.oInteractionModel.SetData(aInteractions)
	oModel.oStepsTreeModel.SetID(nStepsIDCounter)
	oModel.oInteractionModel.SetID(nInteractionsIDCounter)

	cCode = oModel.StepsTreeCode()

	? "Writing code..."
	write(cOutputFile,cCode)
	? "Done.."
