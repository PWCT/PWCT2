/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Components Tree View Class
**	Date : 2017.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentsTreeView from StepsTreeView

	cControlHeader = T_CB_COMPONENTSTREE 
	cStartPointText = T_CB_RINGPWCT

	# We create the Init Method to avoid adding the root two times
	# As a result of nested call to AddStartPoint()
	func Init win
		super.init(win)
		AddComponents()
		return self

	func AddComponents
		oVisualSourceFile = new VisualSourceFile
		oVisualSourceFile.cFileName = "vpl/components.pwct"
		oVisualSourceFile.Open()
		oVisualSourceFile.LoadTables()
		aStepsTree   =  oVisualSourceFile.GetStepsTreeTable()
		oVisualSourceFile.Close()
		for x = 2 to len(aStepsTree) {
			nStepID      = aStepsTree[x][1]
			nParentID   = aStepsTree[x][2]
			cStepName  = aStepsTree[x][3][:name]
			AddStep(nParentID,nStepID,cStepName)								
		}
