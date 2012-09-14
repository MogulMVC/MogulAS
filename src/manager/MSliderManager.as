package manager
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class MSliderManager extends EventDispatcher
	{
		private var _track:Sprite;
		private var _handle:Sprite
		
		private var _paddingV:Number;
		private var _paddingH:Number;
		
		private var _isVertical:Boolean = false;
		private var _isHorrizontal:Boolean = false;
		
		private var _percent:Number = 0;
		
		private var _rangeMin:Number = 0;
		private var _rangeMax:Number = 1;
		
		public function MSliderManager()
		{
		}
		
		public function setup(track:Sprite, handle:Sprite):void
		{
			_track = track;
			_handle = handle;
			
			_paddingV = (_track.height - _handle.height) * .5;
			_paddingH = (_track.width - _handle.width) * .5;
			
			_handle.buttonMode = true;
			_handle.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		}
		
		private function mouseDown(event:MouseEvent):void
		{
			_handle.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			_handle.addEventListener(Event.ENTER_FRAME, calculate);
			
			var bound:Rectangle = new Rectangle(_paddingH, _paddingV, (_track.width - _paddingH * 2) - _handle.width, 0);
			_handle.startDrag(false, bound); 
		}
		
		private function mouseUp(event:MouseEvent):void
		{
			_handle.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
			_handle.removeEventListener(Event.ENTER_FRAME, calculate);
			
			_handle.stopDrag();
		}
		
		private function calculate(event:Event):void
		{
			var total:Number = _track.width - _handle.width - _paddingH * 2;
			var sub:Number = _handle.x - _paddingH;
			var percent:Number = sub / total;
			
			if(_percent != percent)
			{
				_percent = percent;
				var updateEvent:Event = new Event(Event.CHANGE);
				dispatchEvent(updateEvent);
			}
		}
		
		public function setPercent(value:Number):void
		{
			if(value >= 0 && value <= 1)
			{
				_percent = value;
				var total:Number = _track.width - _handle.width - _paddingH * 2;
				var handlePosition:Number = _percent * total;
				_handle.x = handlePosition;
			}
		}
		
		public function getPercent():Number
		{
			return _percent;
		}
		
		public function setValue(value:Number):void
		{
			if(value >= _rangeMin && value <= _rangeMax)
			{
				setPercent(value / (_rangeMax - _rangeMin));
			}
		}
		
		public function getValue():Number
		{
			return getPercent() * (_rangeMax - _rangeMin) + _rangeMin;
		}
		
		public function setRange(valueMin:Number, valueMax:Number):void
		{
			_rangeMin = valueMin;
			_rangeMax = valueMax;
		}
		
	}
}