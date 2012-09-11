package manager
{
	import config.MConfig;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	
	public class MGlowManager
	{
		private var _item:DisplayObject;
		private var _glow:GlowFilter;
		private var _glowColor:uint = MConfig.blue_2;
		
		public function MGlowManager()
		{
			_glow = new GlowFilter();
			_glow.color = _glowColor;
			_glow.alpha = 0;
			_glow.blurX = 10;
			_glow.blurY = 10;
			_glow.quality = BitmapFilterQuality.LOW;
		}
		
		public function setup(item:DisplayObject):void
		{
			_item = item;
			_item.addEventListener(MouseEvent.MOUSE_OVER, glowAdd);
			_item.addEventListener(MouseEvent.MOUSE_OUT, glowRemove);
		}
		
		private function glowAdd(event:MouseEvent):void
		{
			_glow.alpha = 1;
			_item.filters = [_glow];
		}
		
		private function glowRemove(event:MouseEvent):void
		{
			_glow.alpha = 0;
			_item.filters = [_glow];
		}
	}
}