/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Play As Movie  Class
**	Date : 2019.02.18
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class PlayAsMovieController

	lPlayingStarted = False 
	lPlayingStatus  = :Stop

	/*
		Time Machine - Play As Movie 
	*/
	func PlayMovie oGoalDesignerController 
		oGoalDesignerController  {
			if this.lPlayingStarted = False {
				this.lPlayingStarted = True
				this.lPlayingStatus  = :Play
				oView.sliderTimeMachine.setValue(0)
				oView.StopMovieIcon()
			else 
				if this.lPlayingStatus  = :Play {
					this.lPlayingStatus  = :Stop
					oView.timerTM.Stop()
					oView.PlayMovieIcon()
					return 
				else  
					this.lPlayingStatus  = :Play
					oView.StopMovieIcon()
				}
			}
			PlayMovieTimer()
		}

	/*
		The Play Movie Timer 
	*/
	func PlayMovieTimer oGoalDesignerController 
		oGoalDesignerController {
			oView.timerTM.Stop()
			nValue = oView.sliderTimeMachine.Value()
			if nValue != oView.sliderTimeMachine.getInteractionPoints() {
				# Get the Interaction Information 
					nTMValue = oView.sliderTimeMachine.GetActiveInteraction()
					nIID = oModel.oInteractionModel.GetInteractionID(nTMValue + 1)
					lVisible = False
					aList = oModel.GetStepsInTimeRange(nIID,nIID+1,lVisible)	
					if len(aList) >= 1 {
						item = aList[1]
						nStepID = item[C_TREEMODEL_NODEID]
						nParentID = item[C_TREEMODEL_PARENTID]
						nStepIID = item[C_TREEMODEL_CONTENT][:interactionid]
						nStepType = item[C_TREEMODEL_CONTENT][:steptype]
						if nStepType = C_STEPTYPE_ROOT {
							# Select the parent step
								oItem = oView.oStepsTree.GetObjByID(nParentID)
								oView.oStepsTree.SetCurrentItem(oItem,0)
								PWCT_APP.processevents()
								sleep(0.5)
							# Select the Component in the Components Browser
								cComponentFile 	=  oModel.oInteractionModel.GetInteractionComponent(nStepIID)
								aComponent 	= ComponentsBrowserWindow().GetComponentByFileName(cComponentFile)
								cComponentName	= aComponent[C_TREEMODEL_CONTENT][:name]
								if parent().lDockForComponentsBrowserIsVisible {
									Parent().oView.oDockComponentsBrowser.raise()
								else 
									ComponentsBrowserWindow().Start()
									ComponentsBrowserWindow().oView.win.raise()
								}
								ComponentsBrowserWindow().oView.oTextSearch.setText(cComponentName)
								ComponentsBrowserWindow().SearchAction()
								PWCT_APP.processevents()
								sleep(1)
								if ! parent().lDockForComponentsBrowserIsVisible {
									ComponentsBrowserWindow().CloseAction()
								}
							# Display the Interaction Page 
								# Check Step Type
									openComponent(nStepID)
								# Display the Window 
									if lInteractionPagesInGoalDesigner {
										oView.layoutVPages.InsertWidget(0,Last_Window().oView.win,0,0)
										Last_Window().Start()	# Show The Window
										oView.widgetVPages.Show()	# Show the Splitter Widget
									else
										Last_Window().Start()	# Show The Window
									}
									nInteractionPagesToModifyCount++
									Last_Window().AfterOpen()
								Last_Window().oView.win.setfocus(0)
								Last_Window().oView.win.raise()
								PWCT_APP.processevents()
								sleep(3)
								Last_Window().CloseBtnAction()
								ComponentsBrowserWindow().oView.oTextSearch.setText("")
								oView.win.setfocus(0)
								oView.win.show()
								Parent().oView.oDockGoalDesigner.raise()
								oView.win.raise()
								PWCT_APP.processevents()
						else 
							# When the step type is a Comment
								oView.sliderTimeMachine.setValue(nValue+1)
								PWCT_APP.processevents()
								sleep(0.5)
								PlayMovieTimer()
								return 
						}
					}
				oView.sliderTimeMachine.setValue(nValue+1)
				oView.timerTM.Start()	
			else	
				oView.timerTM.Stop()
				this.lPlayingStarted = False
				this.lPlayingStatus  = :Stop
				oView.PlayMovieIcon()
			} 
		}	
