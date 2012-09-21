package ui
{
	import config.MConfig;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class MList extends Sprite
	{
		private var _width:Number = 200;
		private var _height:Number = 200;
		
		private var _rowHeight:Number = 60;
		
		private var _columns:uint;
		
		private var _listItems:Array;
		private var _listRows:Array;
		
		public function MList()
		{
			_listItems = [];
			_listRows = [];
			drawSelf();
		}
		
		private function drawSelf():void
		{
			
		}
		
		private function drawRow(item:DisplayObject):void
		{
			var row:Sprite = new Sprite();
			row.graphics.beginFill(MConfig.mono_6);
			row.graphics.drawRect(0, 0, _width, _rowHeight);
			row.graphics.endFill();
			
			row.buttonMode = true;
			row.y = _listRows.length * _rowHeight;
			row.addEventListener(MouseEvent.MOUSE_OVER, rowOver);
			row.addEventListener(MouseEvent.MOUSE_OUT, rowOut);
			
			_listRows.push(row);
			
			addChild(row);
			
			row.addChild(item);
			
		}
		
		protected function rowOver(event:MouseEvent):void
		{
			trace("over");
			var row:Sprite = Sprite(event.currentTarget);
			row.graphics.clear();
			row.graphics.beginFill(MConfig.mono_5);
			row.graphics.drawRoundRect(0, 0, _width, _rowHeight, MConfig.rounded);
			row.graphics.endFill();
		}
		
		protected function rowOut(event:MouseEvent):void
		{
			trace("out");
			var row:Sprite = Sprite(event.currentTarget);
			row.graphics.clear();
			row.graphics.beginFill(MConfig.mono_6);
			row.graphics.drawRect(0, 0, _width, _rowHeight);
			row.graphics.endFill();
		}
		
		protected function drawRowOver(event:MouseEvent):void
		{
			var row:Sprite = Sprite(event.currentTarget);
			row.alpha = .5;
		}
		
		public function addItem(item:DisplayObject):void
		{
			_listItems.push(item);
			drawRow(item);
			drawSelf();
		}
		
		override public function set width(value:Number):void
		{
			_width = value;
			drawSelf();
		}
		
		override public function set height(value:Number):void
		{
			_height = value;
			drawSelf();
		}
	}
}