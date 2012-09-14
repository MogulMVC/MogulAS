package manager
{
	import config.MConfig;
	
	import flash.display.DisplayObject;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;

	public class MShadowManager
	{
		public function MShadowManager()
		{
		}
		
		public static function setup(item:DisplayObject):void
		{
			var shadow:DropShadowFilter = new DropShadowFilter();
			shadow.color =  0x000000;
			shadow.alpha = 0.4;
			shadow.blurX = 10;
			shadow.blurY = 10;
			shadow.angle = 90;
			shadow.quality = BitmapFilterQuality.MEDIUM;
			
			item.filters = [shadow];
		}
	}
}