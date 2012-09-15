package manager
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class MDraggableManager
	{
		private var _initalizer:Sprite;
		private var _draggable:Sprite;
		
		public function MDraggableManager()
		{
		}
		
		public function setup(initalizer:Sprite, draggable:Sprite):void
		{
			_initalizer = initalizer;
			_draggable = draggable;
			
			_initalizer.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		}
		
		private function mouseDown(event:MouseEvent):void
		{
			_initalizer.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			_draggable.startDrag();
		}
		
		private function mouseUp(event:MouseEvent):void
		{
			_initalizer.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
			_draggable.stopDrag();
		}
	}
}