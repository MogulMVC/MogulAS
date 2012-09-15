package ui
{
	import config.MConfig;
	
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import manager.MGlowManager;
	
	public class MButton extends Sprite
	{
		private var _width:Number = 60;
		private var _height:Number = 20;
		
		private var _monoNormal:Array = [MConfig.mono_5, MConfig.mono_4];
		private var _redNormal:Array = [MConfig.red_2, MConfig.red_1];
		private var _orangeNormal:Array = [MConfig.orange_2, MConfig.orange_1];
		private var _yellowNormal:Array = [MConfig.yellow_2, MConfig.yellow_1];
		private var _greenNormal:Array = [MConfig.green_2, MConfig.green_1];
		private var _blueNormal:Array = [MConfig.blue_2, MConfig.blue_1];
		private var _violetNormal:Array = [MConfig.violet_2, MConfig.violet_1];
		
		//The default colors
		private var _colorNormal:Array = _monoNormal;
		private var _colorDown:Array = [MConfig.mono_2, MConfig.mono_2];
		
		private var _labelField:TextField;
		private var _labelValue:String;
		private var _labelPadding:uint = 0;
		private var _labelColor:uint = MConfig.mono_1;
		
		public function MButton(value:String = "Button")
		{
			super();
			
			this.buttonMode = true;
			this.mouseChildren = false;
			
			_labelValue = value;
			
			_labelField = new TextField();
			_labelField.autoSize = TextFieldAutoSize.LEFT;
			_labelField.wordWrap = false;
			
			addChild(_labelField);
			
			setLabel(value);
			setLabelColor();
			
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
		}
		
		protected function stageAdded(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, stageAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, stageRemove);
			
			var glow:MGlowManager = new MGlowManager();
			glow.setup(this);
			
			drawBackground(null);
			
			addEventListener(MouseEvent.MOUSE_DOWN, drawBackgroundDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, drawBackground);
		}		
		
		protected function stageRemove(event:Event):void
		{
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
			removeEventListener(Event.REMOVED_FROM_STAGE, stageRemove);
			
			removeEventListener(MouseEvent.MOUSE_DOWN, drawBackgroundDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, drawBackground);
		}
		
		private function drawBackground(event:MouseEvent):void
		{
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(_width, _height, (Math.PI/180)*90, 0, 1);
			
			this.graphics.clear();
			this.graphics.lineStyle(1, MConfig.outline, 1, true);
			this.graphics.beginGradientFill(GradientType.LINEAR, _colorNormal, [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			this.graphics.drawRoundRect(0, 0, _width, _height, MConfig.rounded);
		}
		
		protected function drawBackgroundDown(event:MouseEvent):void
		{
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(_width, _height, (Math.PI/180)*90, 0, 1);
			
			this.graphics.clear();
			this.graphics.lineStyle(1, MConfig.outline, 1, true);
			this.graphics.beginGradientFill(GradientType.LINEAR, _colorDown, [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			this.graphics.drawRoundRect(0, 0, _width, _height, MConfig.rounded);
		}
		
		public function setMono():void
		{
			_colorNormal = _monoNormal;
			_labelColor = MConfig.mono_1;
			drawBackground(null);
			setLabelColor();
		}
		
		public function setRed():void
		{
			_colorNormal = _redNormal;
			_labelColor = MConfig.mono_6;
			drawBackground(null);
			setLabelColor();
		}
		
		public function setOrange():void
		{
			_colorNormal = _orangeNormal;
			_labelColor = MConfig.mono_6;
			drawBackground(null);
			setLabelColor();
		}
		
		public function setYellow():void
		{
			_colorNormal = _yellowNormal;
			_labelColor = MConfig.mono_1;
			drawBackground(null);
			setLabelColor();
		}
		
		public function setGreen():void
		{
			_colorNormal = _greenNormal;
			_labelColor = MConfig.mono_6;
			drawBackground(null);
			setLabelColor();
		}
		
		public function setBlue():void
		{
			_colorNormal = _blueNormal;
			_labelColor = MConfig.mono_6;
			drawBackground(null);
			setLabelColor();
		}
		
		public function setViolet():void
		{
			_colorNormal = _violetNormal;
			_labelColor = MConfig.mono_6;
			drawBackground(null);
			setLabelColor();
		}
		
		public function setLabel(value:String):void
		{
			_labelValue = value;
			
			_labelField.text = value;
			_labelField.x = _labelPadding;
			
			//This breaks the width
			//I will fix it later
			//_width = _labelField.getLineMetrics(0).width;
			
			drawBackground(null);
			setLabelColor();
		}
		
		private function setLabelColor():void
		{
			var format:TextFormat = MConfig.textFormatDefault;
			format.color = _labelColor;
			format.bold = true;
			
			_labelField.setTextFormat(format);
		}
		
		override public function set width(value:Number):void
		{
			_width = value;
			drawBackground(null);
		}
		
		override public function set height(value:Number):void
		{
			_height = value;
			drawBackground(null);
		}
		
	}
}