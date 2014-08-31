package core {
	import flash.display.MovieClip;
	import flash.events.TouchEvent;
	
	public class Duck extends MovieClip {
		private var health:uint;
		private var vel:uint;
		private var clip:MovieClip;

		public function Duck(speed:uint, HP:uint, MC:MovieClip) {
			// constructor code
			health = HP;
			vel = speed;
			clip = MC;
			
			addChild(clip);
			this.addEventListener(TouchEvent.TOUCH_TAP, tapHandler);
		}
			


		function tapHandler(e:TouchEvent): void {
			var i:uint = 0;
			var a = MovieClip(parent).ducks;

			health --;
//			trace("tapHandler called");
//			trace("Ducks clip: " + a[i].clip.name);
//			trace("target name: " + e.target.name);
			
			if (this.health < 1) {
				for (i; i < a.length; i++) {
					if (a[i].clip.name == e.target.name) {
						MovieClip(parent).removeChild(a[i]); 
						a[i].removeEventListener(TouchEvent.TOUCH_TAP, tapHandler)
						a.splice(i,1);
						trace(a);
						break;
					}
				}
			}
		}
	}
}
