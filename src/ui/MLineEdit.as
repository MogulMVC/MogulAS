package ui
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import manager.MGlowManager;
	
	public class MLineEdit extends TextField
	{
		private var _prompt:String = "";
		
		public function MLineEdit()
		{
			super();
			
			//Add a glow
			var glow:MGlowManager = new MGlowManager();
			glow.setup(this);
			
			var inputFormat:TextFormat = new TextFormat(); 
			inputFormat.font = "Arial";
			inputFormat.size = 14;
			
			this.defaultTextFormat = inputFormat;
			
			this.text = "";
			
			this.background = true;
			this.backgroundColor = 0xffffff;
			
			this.type = TextFieldType.INPUT;
			
			this.height = 24;
			
			this.border = true;
			this.borderColor = 0x646464;
			
			this.addEventListener(MouseEvent.CLICK, promptClear);
		}
		
		private function promptClear(event:Event):void
		{
			if(this.text == _prompt)
			{
				this.text = "";
			}
		}
		
		public function setPrompt(value:String):void
		{
			_prompt = value;
			this.text = _prompt;
		}
		
	}
}