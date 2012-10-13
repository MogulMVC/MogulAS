package com.mogulas.ui
{
	import com.mogulas.config.MConfig;
	
	import flash.display.Sprite;
	import flash.events.Event;

	public class MVR extends Sprite
	{
		public function MVR()
		{
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
		}
		
		private function stageAdded(event:Event):void
		{
			this.graphics.lineStyle(1,MConfig.outline,1);
			this.graphics.moveTo(0,0);
			this.graphics.lineTo(0,parent.height);
		}
	}
}