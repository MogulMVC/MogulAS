package ui
{
	import config.MConfig;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class MHR extends Sprite
	{
		public function MHR()
		{
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
		}
		
		private function stageAdded(event:Event):void
		{
			this.graphics.lineStyle(1,MConfig.outline,1);
			this.graphics.moveTo(0,0);
			this.graphics.lineTo(parent.width,0);
		}
	}
}