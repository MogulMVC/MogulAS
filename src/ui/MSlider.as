package ui
{
	import flash.events.Event;
	
	import manager.MGlowManager;
	import manager.MSliderManager;
	
	public class MSlider extends MSliderBase
	{
		private var _heightDefault:Number;
		private var _widthDefault:Number;
		private var _manager:MSliderManager;
		private var _rangeMin:Number = 0;
		private var _rangeMax:Number = 1;
		
		public function MSlider()
		{
			super();
			
			//Add a glow
			var glow:MGlowManager = new MGlowManager();
			glow.setup(this.handle);
			
			_heightDefault = this.track.height;
			_widthDefault = this.track.width;
			
			_manager = new MSliderManager();
			_manager.setup(this.track, this.handle);
			
			_manager.addEventListener(Event.CHANGE, change);
		}
		
		private function change(event:Event):void
		{
			var updateEvent:Event = new Event(Event.CHANGE);
			dispatchEvent(updateEvent);
		}
		
		public function setWidth(value:Number):void
		{
			this.track.width = value;
			this.track.height = _heightDefault;
		}
		
		public function setPercent(value:Number):void
		{
			_manager.setPercent(value);
		}
		
		public function getPercent():Number
		{
			return _manager.getPercent();
		}
		
		public function setValue(passedValue:Number):void
		{
			_manager.setValue(passedValue);
		}
		
		public function getValue():Number
		{
			return _manager.getValue();
		}
		
		public function setRange(valueMin:Number, valueMax:Number):void
		{
			_manager.setRange(valueMin, valueMax);
		}
		
	}
}