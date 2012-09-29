package ui
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
		
		private function updateUI():void
		{
			var totalWidth:Number = this.width;
			var progressWidth:Number = totalWidth * _percent;
			
			this.progressFG.width = progressWidth;
		}
		
		public function setWidth(value:Number):void
		{
			this.progressBG.width = value;
			this.progressBG.height = _heightDefault;
		}
		
		public function setPercent(value:Number):void
		{
			_percent = value;
			updateUI();
		}
		
		public function getPercent():Number
		{
			return _percent;
		}
	}
}