package ui
{
	import flash.display.Sprite;

	public class MGroupBox extends Sprite
	{
	
	private var _width:Number = 0;
	private var _height:Number = 0;
	
		private var _labelField:TextField;
		private var _labelValue:String;
		private var _labelColor:uint = MConfig.mono_1;
	
		public function MGroupBox(value:String = "")
		{
		super();
		
		MShadowManager.setup(this);
		
		_labelField
		
		_labelField = new TextField();
			_labelField.autoSize = TextFieldAutoSize.LEFT;
			_labelField.wordWrap = false;
			addChild(_labelField);
		}
		
		private function drawBackground():void
		{
		
		}
		
		public function setLabel(value:String):void
		{
		}
		
		private function labelPosition():void
		{
			_labelField.x = (_width / 2) - (_labelField.width / 2);
			_labelField.y = (_height / 2) - (_labelField.height / 2);
		}
	}
}