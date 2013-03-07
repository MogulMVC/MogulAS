package com.mogulas.ui
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class MVBoxLayout extends Sprite
	{
		private var _children:Array;
		private var _padding:Number = 5;
		
		public function MVBoxLayout()
		{
			super();
			_children = [];
		}
		
		private function update():void
		{
			var yPos:Number = 0;
			for each(var child:DisplayObject in _children)
			{
				child.y = yPos;
				yPos += child.height + _padding;
			}
		}
		
		public function setPadding(value:Number):void
		{
			_padding = 	value;
			update();
		}
		
		//Overrides
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			_children.push(child);
			update();
			
			return super.addChild(child);
		}
		
	}
}