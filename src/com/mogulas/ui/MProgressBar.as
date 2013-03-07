package com.mogulas.ui
{
	public class MProgressBar extends MProgressBarBase
	{
		private var _heightDefault:Number;
		private var _widthDefault:Number;
		
		private var _percent:Number;
		
		public function MProgressBar()
		{
			super();
			
			_heightDefault = this.progressBG.height;
			_widthDefault = this.progressBG.width;
		}
		
		private function update():void
		{
			var totalWidth:Number = this.width;
			var progressWidth:Number = totalWidth * _percent;
			
			this.progressFG.width = progressWidth;
		}
		
		public function setPercent(value:Number):void
		{
			_percent = value;
			update();
		}
		
		public function getPercent():Number
		{
			return _percent;
		}
		
		//Overrides
		
		override public function set width(value:Number):void
		{
			this.progressBG.width = value;
			this.progressBG.height = _heightDefault;
		}
	}
}