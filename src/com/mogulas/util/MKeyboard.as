package com.mogulas.util
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

	public class MKeyboard
	{
		
		public static var keys:Array;
		
		public function MKeyboard()
		{
		}
		
		public static function init(st:Stage):void
		{
			st.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
			st.addEventListener(KeyboardEvent.KEY_UP, onUp);
			
			keys = [];
			
			for(var i:uint = 0; i < 100; i++)
			{
				keys[i] = 0;
			}
		}
		
		protected static function onDown(event:KeyboardEvent):void
		{
			keys[event.keyCode] = 1;
		}
		
		protected static function onUp(event:KeyboardEvent):void
		{
			keys[event.keyCode] = 0;
		}
		
	}
}