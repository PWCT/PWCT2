#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  Play As Movie  Class
#**	Date : 2019.02.18
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class PlayAsMovieController
	lPlayingStarted = False
	lPlayingStatus = :Stop
	oAutoDoc = new AutomaticDocumentation
	lAutomaticDocumentation = True
	#/*
	#		Time Machine - Play As Movie
	#	*/
	func PlayMovie oGoalDesignerController { 
		oAutoDoc.nShotID = 0
		oGoalDesignerController {
			if this.lPlayingStarted = False { 
				this.lPlayingStarted = True
				this.lPlayingStatus = :Play
				if oView.sliderTimeMachine.Value() = oView.sliderTimeMachine.getInteractionPoints() { 
					oView.sliderTimeMachine.setValue(0)
				} 
				oView.StopMovieIcon()
				else
					if this.lPlayingStatus = :Play { 
						this.lPlayingStatus = :Stop
						oView.timerTM.Stop()
						oView.PlayMovieIcon()
						return 
						else
							this.lPlayingStatus = :Play
							oView.StopMovieIcon()
					} 
			} 
			PlayMovieTimer()
		}
		#/*
		#		The Play Movie Timer
		#	*/
	} 
	func PlayMovieTimer oGoalDesignerController { 
		oGoalDesignerController {
			oView.timerTM.Stop()
			nValue = oView.sliderTimeMachine.Value()
			if nValue! = oView.sliderTimeMachine.getInteractionPoints() { 
				#Get the Interaction Information
				nTMValue = oView.sliderTimeMachine.GetActiveInteraction()
				nIID = oModel.oInteractionModel.GetInteractionID(nTMValue+1)
				nIID_End = oModel.oInteractionModel.GetInteractionID(nTMValue+2)
				lVisible = False
				aList = oModel.GetStepsInTimeRange(nIID,nIID_End,lVisible)
				if len(aList) >= 1 { 
					item = aList[1]
					nStepID = item[C_TREEMODEL_NODEID]
					nParentID = item[C_TREEMODEL_PARENTID]
					nStepIID = item[C_TREEMODEL_CONTENT][:interactionid]
					nStepType = item[C_TREEMODEL_CONTENT][:steptype]
					if nStepType = C_STEPTYPE_ROOT OR !oGoalDesignerController.oView.lUseNewCommentButton { 
						#Select the parent step
						oItem = oView.oStepsTree.GetObjByID(nParentID)
						oView.oStepsTree.SetCurrentItem(oItem,0)
						#Be sure that the last child is visible
						aChildren = oModel.oStepsTreeModel.Children(nParentID)
						if len(aChildren) > 0 { 
							for nMark = len(aChildren) to 1 step -1 { 
								nPos = aChildren[nMark]
								if oModel.oStepsTreeModel.aList[nPos][C_TREEMODEL_CONTENT][:visible] { 
									nParentID = oModel.oStepsTreeModel.aList[nPos][C_TREEMODEL_NODEID]
									exit 1
								} 
							} 
						} 
						oItem = oView.oStepsTree.GetObjByID(nParentID)
						oView.oStepsTree.scrolltoitem(oItem,0)
						PWCT_APP.processevents()
						sleep(0.5)
						this.GetScreenShot(oView.oTab)
						#Select the Component in the Components Browser
						cComponentFile = oModel.oInteractionModel.GetInteractionComponent(nStepIID)
						aComponent = ComponentsBrowserWindow().GetComponentByFileName(cComponentFile)
						cComponentName = aComponent[C_TREEMODEL_CONTENT][:plainname]
						if parent().lDockForComponentsBrowserIsVisible { 
							Parent().oView.oDockComponentsBrowser.raise()
							else
								ComponentsBrowserWindow().Start()
								ComponentsBrowserWindow().oView.win.raise()
						} 
						ComponentsBrowserWindow().oView.oTextSearch.setText(cComponentName)
						ComponentsBrowserWindow().SearchAction()
						ComponentsBrowserWindow().oView.oComponentsTree.setFocus(0)
						ComponentsBrowserWindow().oView.oComponentsTree.show()
						ComponentsBrowserWindow().oView.win.show()
						PWCT_APP.processevents()
						sleep(0.1)
						if parent().lDockForComponentsBrowserIsVisible { 
							Parent().oView.oDockComponentsBrowser.raise()
							else
								ComponentsBrowserWindow().oView.win.raise()
						} 
						PWCT_APP.processevents()
						sleep(0.5)
						this.GetScreenShot(ComponentsBrowserWindow().oView.win)
						if !parent().lDockForComponentsBrowserIsVisible { 
							ComponentsBrowserWindow().CloseAction()
						} 
						#Display the Interaction Page
						#Check Step Type
						openComponent(nStepID)
						#Display the Window
						if !Last_Window().lNoInteractionPage { 
							if lInteractionPagesInGoalDesigner { 
								oView.layoutVPages.InsertWidget(0,Last_Window().oView.win,0,0)
								#Show The Window
								Last_Window().Start()
								#Show the Splitter Widget
								oView.widgetVPages.Show()
								oView.oVPagesScroll.Show()
								else
									#Show The Window
									Last_Window().Start()
							} 
							nInteractionPagesToModifyCount++
							Last_Window().AfterOpen()
							Last_Window().oView.win.setfocus(0)
							Last_Window().oView.win.raise()
							PWCT_APP.processevents()
							sleep(1.5)
							this.GetScreenShot(Last_Window().oView.win)
						} 
						Last_Window().CloseBtnAction()
						ComponentsBrowserWindow().oView.oTextSearch.setText("")
						oView.win.setfocus(0)
						oView.win.show()
						Parent().oView.oDockGoalDesigner.raise()
						oView.win.raise()
						PWCT_APP.processevents()
						else
							#When the step type is a Comment
							oView.sliderTimeMachine.setValue(nValue+1)
							PWCT_APP.processevents()
							sleep(0.3)
							this.GetScreenShot(oView.oTab)
							PlayMovieTimer()
							return 
					} 
				} 
				oView.sliderTimeMachine.setValue(nValue+1)
				oView.timerTM.Start()
				else
					oView.timerTM.Stop()
					this.lPlayingStarted = False
					this.lPlayingStatus = :Stop
					oView.PlayMovieIcon()
					this.GetScreenShot(oView.oTab)
			} 
		}
	} 
	func GetScreenShot oWin { 
		if lAutomaticDocumentation { 
			oAutoDoc.GetWindowShot(oWin)
		} 
	} 
private
