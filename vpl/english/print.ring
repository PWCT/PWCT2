func PrintComponentStart oParent
	Open_Window(:PrintComponentController)
	Last_Window().setParentObject(oParent)

Class PrintComponentController from ComponentControllerParent 

	oView = new PrintComponentView

	func GenerateAction 
		oParent = GetParentStep()
		NewParentStep(:Test)
			NewStep(:one)
				SetStepCode("The one step code")
			NewStep(:two)
				SetStepCode("The two step code")
				oParent2 = GetActiveStep()
		SetActiveStep(oParent)
		NewParentStep(:Test2)
			NewStep(:one2)
				SetStepCode("The one step code")
			NewStep(:two2)
				SetStepCode("The two step code")
		SetActiveStep(oParent2)
		SetStepCode("Yes I'm the new code")
		SetActiveStep(oParent)
		NewParentStep("Print Text : " + Variable(:text))

class PrintComponentView from ComponentViewParent
	 
		Title("Print Component")
		TextBox("Enter text : " , :text)
		PageButtons()
