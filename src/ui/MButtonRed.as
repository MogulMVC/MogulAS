package ui
{
	import flash.text.TextFormat;
	
	public class MButtonRed extends MButtonRedBase
	{
		private var _label:String;
		
		public function MButtonRed(value:String = "Button")
		{
			stop();
			buttonMode = true;
			mouseChildren = false;
			
			var format:TextFormat = new TextFormat();
			format.bold = true;
			tfLabel.defaultTextFormat = format;
			
			setLabel(value);
		}
		
		public function setLabel(value:String):void
		{
			_label = value;
			tfLabel.text = _label;
		}
		
	}
}