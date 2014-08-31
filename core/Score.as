package core {
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.display.MovieClip;
	
	public class Score {
		
		private var total:uint = 0;
		private var amount:uint;
		private var scoreFormat:TextFormat = new TextFormat;
		private var scoreBox:TextField = new TextField;
		private var xPos:Number = 200;
		private var yPos:Number = 50;
		private var alignPos:String = "RIGHT";
		
		public function Score(runningTotal:uint = 0, xVal:Number = xPos, yVal:Number = yPos, floatPos:String = alignPos, form:TextFormat = scoreFormat) {
			// constructor code
			scoreFormat.font = "Arial";
			scoreFormat.size = 50;
			scoreFormat.bold = false;
			scoreFormat.color = 0xFF0000;

			scoreBox.defaultTextFormat = scoreFormat;
			scoreBox.autoSize = TextFieldAutoSize.alignPos;
			scoreBox.x = xPos;
			scoreBox.y = yPos;
			scoreBox.text = "";
		
			total = runningTotal;
			xPos = xVal;
			yPos = yVal;
			alignPos = floatPos;
			scoreFormat = form;
			
			addChild(scoreBox);
			updateScore()
		}
		
		public function adjustScore(value:uint):void {
			total += value;
			if (total < 0) {
				total = 0;
			}
			updateScore();
		}
		
		public function resetScore(addToTotal:Boolean = false, varName:String = ""):void {
			if (addToTotal) {
				this.parent.varName += total;
			}
			total = 0;
			updateScore();
		}
		
		private function updateScore():void {
			scoreBox.text = "" + total;
		}
		
		public function killScore(addToTotal:Boolean = false, varName:String = "") {
			resetScore(addToTotal, varName);
			removeChild(this);
		}
	}
	
}
