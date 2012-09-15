package ui
{
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	
	public class MImage extends Sprite
	{
		public static const PIXEL_SELECTED:String = "pixelSelected";
		
		private var _loaded:Boolean = false;
		
		private var _pixel:uint;
		
		private var _src:String;
		private var _ld:Loader;
		
		private var _keepAspect:String;
		private var _aspect:Number;
		
		private var _defaultWidth:Number;
		private var _defaultHeight:Number;
		
		private var _setWidth:Number;
		private var _setHeight:Number;
		
		private var _bitmapData:BitmapData;
		
		public function MImage()
		{
			super();
			_ld = new Loader();
			this.addChild(_ld);
			this.addEventListener(MouseEvent.MOUSE_DOWN, selectPixel);
		}
		
		public function setSrc(value:String):void
		{
			if(value != ""){
				_src = value;
				load();
			}
		}
		
		private function load():void
		{
			_ld.load(new URLRequest(_src));
			_ld.contentLoaderInfo.addEventListener(Event.COMPLETE, display);
			_ld.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorIO);
			_ld.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorSecurity);
		}
		
		private function display(event:Event):void
		{
			_loaded = true;
			
			_bitmapData = event.target.content.bitmapData;
			
			_defaultWidth = event.target.content.width;
			_defaultHeight = event.target.content.height;
			
			_aspect = _defaultWidth / _defaultHeight;
			
			if(!_setHeight){
				_setHeight = _defaultHeight;
			}
			
			if(!_setWidth){
				_setWidth = _defaultWidth;
			}
			
			resize();
		}
		
		private function errorIO(event:IOErrorEvent):void
		{
			trace("error - IO");
		}
		
		private function errorSecurity(event:SecurityErrorEvent):void
		{
			trace("error - security");
		}
		
		private function selectPixel(event:MouseEvent):void
		{
			if(_loaded)
			{
				_pixel = _bitmapData.getPixel(event.localX, event.localY);
				dispatchEvent(new Event(PIXEL_SELECTED));
			}
		}
		
		private function resize():void
		{
			if(_keepAspect == "w" || _keepAspect == "width")
			{
				_setHeight = _setWidth / _aspect;
			}
			
			if(_keepAspect == "h" || _keepAspect == "height")
			{
				_setWidth = _setHeight * _aspect;
			}
			
			_ld.height = _setHeight;	
			_ld.width = _setWidth;
		}
		
		public function resetWidth():void
		{
			_setWidth = _defaultWidth;
			resize();
		}
		
		public function resetHeight():void
		{
			_setHeight = _defaultHeight;
			resize();
		}
		
		public function setKeepAspect(value:String):void
		{
			_keepAspect = value;
			resize();
		}
		
		public function getPixel():uint
		{
			return _pixel;
		}
		
		override public function set width(value:Number):void
		{
			_setWidth = value;
			resize();
		}
		
		override public function get width():Number
		{
			return _setWidth;
		}
		
		override public function set height(value:Number):void
		{
			_setHeight = value;
			resize();
		}
		
		override public function get height():Number
		{
			return _setHeight;
		}
	}
}