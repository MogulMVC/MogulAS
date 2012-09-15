package ui
{
	import config.MConfig;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import manager.MShadowManager;

	public class MHeader extends Sprite
	{
		//shown tracks when the header has been added
		//This is so other classes can listen for it and position themselves around it
		public static var shown:Boolean = false;
		public static var staticHeight:Number = 0;
		
		private var _setHeight:Number = 30;
		
		public function MHeader()
		{
			super();
			
			MShadowManager.setup(this);
			
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
		}
		
		private function stageAdded(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, stageAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, stageRemove);
			
			shown = true;
			
			stage.addEventListener(Event.RESIZE, update);
			
			//Initially resize
			update(null);
		}		
		
		private function stageRemove(event:Event):void
		{
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
			removeEventListener(Event.REMOVED_FROM_STAGE, stageRemove);
			
			shown = false;
			
			stage.removeEventListener(Event.RESIZE, update);
			
			staticHeight = 0;
		}
		
		public function update(event:Event):void
		{
			this.x = 0;
			this.y = 0;
			
			this.graphics.beginFill(MConfig.mono_1);
			this.graphics.drawRect(0, 0, stage.stageWidth, _setHeight);
			this.graphics.endFill();
			
			trace("Stage Width " + stage.stageWidth, "This Width " + this.width);
			
			staticHeight = this.height;
		}
		
	}
}