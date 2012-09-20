package ui
{
	import flash.display.Sprite;

	public class MComboBox extends Sprite
	{
		private var _choices:Array;
	
		public function MComboBox()
		{
		
		
		_choices = [];
		
		}
		
		private function stageAdded(event:Event):void
		{
			drawBackground(null);
			
			removeEventListener(Event.ADDED_TO_STAGE, stageAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, stageRemove);
			
			//Add mouse events
			addEventListener(MouseEvent.MOUSE_DOWN, drawBackgroundDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, drawBackground);
		}		
		
		private function stageRemove(event:Event):void
		{
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
			removeEventListener(Event.REMOVED_FROM_STAGE, stageRemove);
			
			//Remove mouse events
			removeEventListener(MouseEvent.MOUSE_DOWN, drawBackgroundDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, drawBackground);
		}
		
		private function drawBackground(event:MouseEvent):void
		{
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(_width, _height, (Math.PI/180)*90, 0, 1);
			
			this.graphics.clear();
			this.graphics.lineStyle(1, MConfig.outline, 1, true);
			this.graphics.beginGradientFill(GradientType.LINEAR, _colorNormal, [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			this.graphics.drawRoundRect(0, 0, _width, _height, MConfig.rounded);
			setLabelPosition();
		}
		
		private function drawBackgroundDown(event:MouseEvent):void
		{
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(_width, _height, (Math.PI/180)*90, 0, 1);
			
			this.graphics.clear();
			this.graphics.lineStyle(1, MConfig.outline, 1, true);
			this.graphics.beginGradientFill(GradientType.LINEAR, _colorDown, [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			this.graphics.drawRoundRect(0, 0, _width, _height, MConfig.rounded);
			setLabelPosition();
		}
		
		private function drawDropdown(event:MouseEvent):void
		{
		
		}
		
		private function undrawDropdown(event:MouseEvent):void
		{
		
		}
		
		public function addChoice(key:String, value:Object):void
		{
		var new choice:Object = new Object();
		choice.key = key;
		choice.value = value;
		_choices.push(choice);
		}
		
		public function setSelectionIndex(index:uint):void
		{
		}
		
		public function getSelectionIndex(index:uint):Object
		{
		return _choices[index];
		}
	}
}