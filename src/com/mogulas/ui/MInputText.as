package com.mogulas.ui
{
	import com.mogulas.config.MConfig;
	import com.mogulas.manager.MGlowManager;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
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
			
			this.addEventListener(MouseEvent.CLICK, clearPlaceholder);
		}
		
		private function clearPlaceholder(event:Event):void
		{
			if(this.text == _prompt)
			{
				this.text = "";
			}
		}
		
		public function setPlaceholder(value:String):void
		{
			_prompt = value;
			this.text = _prompt;
		}
		
	}
}
