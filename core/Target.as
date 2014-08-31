package core {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	
	
	public class Target extends MovieClip {

		private var health:Number = 1;
		public var myTimer:Timer;
		private var clip:MovieClip;
		//private var targets:Array = [];
		
		public function Target(TTL:Number, HP:Number, MC:MovieClip) {
			// constructor code
			
			myTimer = new Timer(1000,TTL);
			myTimer.start();
			health = HP;
			clip = MC;
			
			addChild(clip);
			this.addEventListener(TouchEvent.TOUCH_TAP, tapHandler);
			myTimer.addEventListener(TimerEvent.TIMER_COMPLETE, timeOut);
		}
		
		public function tapHandler(e:TouchEvent):void {
			var i:uint = 0;
			var _pos:Point = new Point(this.x,this.y);
			var a:Array = MovieClip(parent).targets;
			var b:Array = MovieClip(parent).nodes;
			
			health --;			
			if (this.health < 1) {
				for (i; i < a.length; i++) {
					if (a[i].clip.name == e.target.name) {
						MovieClip(parent).removeChild(a[i]); 
						b.push(_pos);
						a[i].removeEventListener(TouchEvent.TOUCH_TAP, tapHandler);
						a[i].removeEventListener(TimerEvent.TIMER_COMPLETE, timeOut);	
						a.splice(i,1);
						trace(a);
						break;
					}
				}
			}
		}	
			
		public function timeOut(e:TimerEvent):void {
			var i:uint = 0;
			var _pos:Point = new Point(this.x,this.y);
			var a:Array = MovieClip(parent).targets;
			var b:Array = MovieClip(parent).nodes;
			
			for (i; i < a.length; i++) {
				if (a[i].clip.name == this.clip.name) {
					MovieClip(parent).removeChild(a[i]); 
					b.push(_pos);
					a[i].removeEventListener(TouchEvent.TOUCH_TAP, tapHandler);
					a[i].removeEventListener(TimerEvent.TIMER_COMPLETE, timeOut);	
					a.splice(i,1);
					trace(a);
					break;
				}
			}

		
			
	//		var _pos:Point = new Point(this.x,this.y);
	//		trace("_Pos: " + _pos);
	//		trace(this.name + " died");
	//		MovieClip(parent).nodes.push(_pos);
	//		this.removeEventListener(TimerEvent.TIMER_COMPLETE, timeOut);				
	//		this.removeEventListener(TouchEvent.TOUCH_TAP, tapHandler);		
	//		removeChild(this.clip);			
	//		MovieClip(parent).removeChild(this);
//			MovieClip(parent).targets.splice(0,1);
		}
	}
}
