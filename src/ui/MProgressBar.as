package ui
{
	public class MProgressBar extends MProgressBarBase
	{
		private var _heightDefault:Number;
		private var _widthDefault:Number;
		
		private var _value:Number;
		
		public function MProgressBar()
		{
			super();
			
			_heightDefault = this.progressBG.height;
			_widthDefault = this.progressBG.width;
		}
		
		private function updateUI():void
		{
			var totalWidth:Number = this.width;
			var progressWidth:Number = totalWidth * _value;
			
			this.progressFG.width = progressWidth;
		}
		
		public function setLength(value:Number):void
		{
			this.progressBG.width = value;
			this.progressBG.height = _heightDefault;
		}
		
		public function setValue(value:Number):void
		{
			_value = value;
			updateUI();
		}
		
		public function getValue():Number
		{
			return _value;
		}
	}
}