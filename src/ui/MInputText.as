package ui
{
	import config.MConfig;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import manager.MGlowManager;
	
	import util.MColor;
	
	public class MInputText extends TextField
	{
		private var _prompt:String = "";
		
		public function MInputText(prompt:String = "")
		{
			super();
			
			//Add a glow
			var glow:MGlowManager = new MGlowManager();
			glow.setup(this);
			
			var inputFormat:TextFormat = MConfig.textFormatDefault; 
			
			this.defaultTextFormat = inputFormat;
			
			this.text = prompt;
			
			this.background = true;
			this.backgroundColor = MConfig.mono_6;
			
			this.type = TextFieldType.INPUT;
			
			this.height = 24;
			
			this.border = true;
			this.borderColor = MConfig.outline;
			
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
