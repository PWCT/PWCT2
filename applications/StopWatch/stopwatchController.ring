load "stopwatchView.ring"
import System.GUI
if IsMainSourceFile() { 
	new App
	{
		StyleFusion()
		open_window(:stopwatchController)
		exec()
	}
} 
class stopwatchController from windowsControllerParent
	oView = new stopwatchView
	{
		WatchTimer.stop()
		ButtonPause.setEnabled(False)
	}
	lStart = False
	lStop = False
	func StartWatch  { 
		oView {
			if !this.lStart { 
				this.lStart = True
				WatchTimer.start()
				ButtonStart.setText("Restart")
				ButtonPause.setEnabled(True)
				else
					WatchTimer.stop()
					watch.display(0)
					WatchTimer.start()
			} 
		}
	} 
	func PauseWatch  { 
		oView {
			if !this.lStop { 
				this.lStop = True
				watchTimer.stop()
				ButtonPause.SetText("Continue")
				else
					this.lStop = False
					watchTimer.Start()
					ButtonPause.SetText("Pause")
			} 
		}
	} 
	func ExitWatch  { 
		oView.win.close()
	} 
	func WatchTimerEvent  { 
		oView.watch {
			display(value()+1)
		}
	} 
private
