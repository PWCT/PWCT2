# Load Ring Libraries
	load "stdlib.ring"

# Load General Libraries
	load "../../general/globals/globals.ring"
	load "../../general/mainlib.ring"
	load "../../general/log.ring"
	
# Load the File System Files
	load "../../filesystem/databasesqlite.ring"
	load "../../filesystem/databasesqliteqt.ring"
	load "../../filesystem/database.ring"
	load "../../filesystem/visualsourcefile.ring"

# Mobile functions 
	load "../../mobile/mobilefunctions.ring"

# Goal Designer Model Files
	load "../../goaldesigner/model/goaldesignermodel.ring"
	load "../../goaldesigner/model/treemodel.ring"
	load "../../goaldesigner/model/interactionmodel.ring"
	# Used by Goal Designer Model
		load "../../goaldesigner/controller/htmlfunctions.ring"

class VSFGenerator

	cFileName = "test.pwct"
	oModel = new GoalDesignerModel

	func startGenerator
		? "Hello"	
		oVisualSourceFile = new visualSourceFile
		oVisualSourceFile.cFileName  =  cFileName
		oVisualSourceFile.Open()
		oVisualSourceFile.SetStepsTreeTable(oModel.oStepsTreeModel.GetData())
		oVisualSourceFile.SetInteractionsTable(oModel.oInteractionModel.GetData())
		oVisualSourceFile.SetStepsID(oModel.oStepsTreeModel.GetID())
		oVisualSourceFile.SetInteractionsID(oModel.oInteractionModel.GetID())
		oVisualSourceFile.CreateTables()
		oVisualSourceFile.SaveTables()
		oVisualSourceFile.Close()
