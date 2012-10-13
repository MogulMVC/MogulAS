package com.mogulas.manager
{
	import com.mogulas.config.MConfig;
	
	import flash.display.DisplayObject;
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
			_glow.blurX = 5;
			_glow.blurY = 5;
			_glow.quality = BitmapFilterQuality.MEDIUM;
		}
		
		public function setup(item:DisplayObject):void
		{
			_item = item;
			
			_item.addEventListener(MouseEvent.MOUSE_OVER, glowAdd);
			_item.addEventListener(MouseEvent.MOUSE_OUT, glowRemove);
			
			_item.addEventListener(MouseEvent.MOUSE_UP, glowAdd);
			_item.addEventListener(MouseEvent.MOUSE_DOWN, glowRemove);
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