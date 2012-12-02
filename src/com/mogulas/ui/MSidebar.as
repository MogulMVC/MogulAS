package com.mogulas.ui
{
	import com.mogulas.config.MConfig;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import com.mogulas.manager.MShadowManager;
	
	public class MSideBar extends Sprite
	{
		private var _setWidth:Number = 300;
		
		public function MSideBar()
		{
			super();
			
			MShadowManager.setup(this);
			
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
		}
		
		private function stageAdded(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, stageAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, stageRemove);
			
			stage.addEventListener(Event.RESIZE, update);
			
			//Initially resize
			update(null);
		}		
		
		private function stageRemove(event:Event):void
		{
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
			removeEventListener(Event.REMOVED_FROM_STAGE, stageRemove);
			
			stage.removeEventListener(Event.RESIZE, update);
		}
		
		public function update(event:Event):void
		{
			this.graphics.lineStyle(1, MConfig.outline);
			this.graphics.beginFill(MConfig.mono_5);
			this.graphics.drawRect(0, 0, _setWidth, stage.stageHeight);
			this.graphics.endFill();
			
			if(MHeader.shown)
			{
				this.y = MHeader.staticHeight;
				this.height = stage.stageHeight - MHeader.staticHeight;
			}
			else
			{
				this.y = 0;
				this.height = stage.stageHeight;
			}
			
			this.x = 0;
			this.width = _setWidth;
		}
		
	}
}