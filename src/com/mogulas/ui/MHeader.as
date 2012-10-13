package com.mogulas.ui
{
	import com.mogulas.config.MConfig;
	import com.mogulas.manager.MShadowManager;
	
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;

	public class MHeader extends Sprite
	{
		//shown tracks when the header has been added
		//This is so other classes can listen for it and position themselves around it
		public static var shown:Boolean = false;
		public static var staticHeight:Number = 0;
		
		private var _setHeight:Number = 36;
		
		private var _colors:Array = [MConfig.mono_1_3, MConfig.mono_1_2];
		
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
			
			stage.addEventListener(Event.RESIZE, updateUI);
			
			//Initially resize
			updateUI(null);
		}		
		
		private function stageRemove(event:Event):void
		{
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
			removeEventListener(Event.REMOVED_FROM_STAGE, stageRemove);
			
			shown = false;
			
			stage.removeEventListener(Event.RESIZE, updateUI);
			
			staticHeight = 0;
		}
		
		public function updateUI(event:Event):void
		{
			this.x = 0;
			this.y = 0;
			
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(stage.stageWidth, _setHeight, (Math.PI/180)*90, 0, 1);
			
			this.graphics.beginGradientFill(GradientType.LINEAR, _colors, [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			this.graphics.drawRect(0, 0, stage.stageWidth, _setHeight);
			this.graphics.endFill();
			
			staticHeight = _setHeight;
		}
		
	}
}