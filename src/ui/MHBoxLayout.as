package ui
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class MHBoxLayout extends Sprite
	{
		private var _children:Array;
		private var _padding:Number = 5;
		
		public function MHBoxLayout()
		{
			super();
			_children = [];
		}
		
		public function setPadding(value:Number):void
		{
			if(value > 0 && value < 100)
			{
				_padding = 	value;
			}
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			_children.push(child);
			updateUI();
			
			return super.addChild(child);
		}
		
		private function updateUI():void
		{
			var xPos:Number = 0;
			for each(var child:DisplayObject in _children)
			{
				child.x = xPos;
				xPos += child.width + _padding;
			}
		}
		
	}
}