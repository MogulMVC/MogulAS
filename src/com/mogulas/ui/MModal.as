package com.mogulas.ui
{
	import com.mogulas.config.MConfig;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class MModal extends Sprite
	{
		public function MModal()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
		}
		
		private function stageAdded(event:Event):void
		{
			this.graphics.beginFill(MConfig.mono_1, 0.4);
			this.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			this.graphics.endFill();
		}
	}
}