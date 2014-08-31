package core
{
	
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.display.MovieClip;

	public class roundTimer
	{
		//private var mainTimeline:MovieClip = this.parent as MovieClip; 
		public var myTimer:Timer;
		private var displayField:TextField;
		private var MAX_TIME:uint = 30;
		public var roundUp:Boolean = false;

		public function roundTimer(t:TextField, max:uint):void
		{
			// constructor code
			MAX_TIME = max;
			myTimer = new Timer(1000, MAX_TIME);
			myTimer.addEventListener(TimerEvent.TIMER, displayTime);
			//myTimer.addEventListener(TimerEvent.TIMER_COMPLETE, timerEnded);
			displayField = t;
			trace("roundTimer created");
		}
		
/*		private function timerEnded(e:TimerEvent):void{
			// do stuff at timer complete...
			roundUp = true;
			trace("round up");
			//this.parent.endGame();
			//button spawn... on click reset...
		}
*/		
		private function displayTime(e:TimerEvent):void
		{
			// do stuff at each timer tick...
			displayField.text = "" + (MAX_TIME - myTimer.currentCount);
		}
	}
}