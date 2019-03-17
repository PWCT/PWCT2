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

if isMainSourceFile()
	? "Generation started!"
	t1 = clock()
	new VSFGenerator {
		startGenerator()
	}
	? "Generation done in " + ( (clock() - t1) / clockspersecond()) + " seconds!"
ok

class VSFGenerator

	cFileName = "test.pwct"
	oModel = new GoalDesignerModel

	func startGenerator
		TestGenerator()
		WriteVisualSourceFile()

	func WriteVisualSourceFile
		# Delete the old visual source file 
			if fexists(cFileName) remove(cFileName) ok
		# Write the new visual source file (*.pwct)
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
	
	func TestGenerator
		for x = 1 to 10
			AddRootStep("Step Number : " + x)
		next 

	func AddRootStep cStepName 
		cPlainStepName = cStepName
 		nStepID = oModel.AddStep(1,[
				:name = cStepName,
				:active = True , 
				:code = "" , 
			 	:interactionid = oModel.oInteractionModel.AddUserInteraction() ,
				:visible = True , 
				:stepnumber = 1 ,
				:steptype = C_STEPTYPE_COMMENT,
				:plainname = cPlainStepName
			]
		)
