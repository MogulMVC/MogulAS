package com.mogulas.ui
{
	import com.mogulas.config.MConfig;
	import com.mogulas.manager.MGlowManager;
	
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class MButton extends Sprite
	{
		private var _padding:Number = 5;
		
		private var _width:Number = 60;
		private var _height:Number = 20;
		
		private var _monoNormal:Array = [MConfig.mono_5, MConfig.mono_4];
		private var _redNormal:Array = [MConfig.red_2, MConfig.red_1];
		private var _orangeNormal:Array = [MConfig.orange_2, MConfig.orange_1];
		private var _yellowNormal:Array = [MConfig.yellow_2, MConfig.yellow_1];
		private var _greenNormal:Array = [MConfig.green_2, MConfig.green_1];
		private var _blueNormal:Array = [MConfig.blue_2, MConfig.blue_1];
		private var _violetNormal:Array = [MConfig.violet_2, MConfig.violet_1];
		
		// The default colors
		private var _colorNormal:Array = _monoNormal;
		private var _colorDown:Array = [MConfig.mono_2, MConfig.mono_2];
		
		private var _labelField:TextField;
		private var _labelValue:String;
		private var _labelColor:uint = MConfig.mono_1;
		
		public function MButton(value:String = "Button")
		{
			super();
			
			this.buttonMode = true;
			this.mouseChildren = false;
			
			var glow:MGlowManager = new MGlowManager();
			glow.setup(this);
			
			_labelValue = value;
			
			_labelField = new TextField();
			_labelField.autoSize = TextFieldAutoSize.LEFT;
			_labelField.wordWrap = false;
			addChild(_labelField);
			
			setLabel(value);
			labelColor();
			
			addEventListener(Event.ADDED_TO_STAGE, onStageAdded);
		}
		
		// Events
		
		private function onStageAdded(event:Event):void
		{
			onDrawBackgroundUp(null);
			
			removeEventListener(Event.ADDED_TO_STAGE, onStageAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, onStageRemove);
			
			// Add mouse events
			addEventListener(MouseEvent.MOUSE_DOWN, onDrawBackgroundDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onDrawBackgroundUp);
		}		
		
		private function onStageRemove(event:Event):void
		{
			addEventListener(Event.ADDED_TO_STAGE, onStageAdded);
			removeEventListener(Event.REMOVED_FROM_STAGE, onStageRemove);
			
			// Remove mouse events
			removeEventListener(MouseEvent.MOUSE_DOWN, onDrawBackgroundDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, onDrawBackgroundUp);
		}
		
		private function onDrawBackgroundUp(event:MouseEvent):void
		{
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(_width, _height, (Math.PI/180)*90, 0, 1);
			
			this.graphics.clear();
			this.graphics.lineStyle(1, MConfig.outline, 1, true);
			this.graphics.beginGradientFill(GradientType.LINEAR, _colorNormal, [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			this.graphics.drawRoundRect(0, 0, _width, _height, MConfig.rounded);
			this.graphics.endFill();
			labelPosition();
		}
		
		private function onDrawBackgroundDown(event:MouseEvent):void
		{
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(_width, _height, (Math.PI/180)*90, 0, 1);
			
			this.graphics.clear();
			this.graphics.lineStyle(1, MConfig.outline, 1, true);
			this.graphics.beginGradientFill(GradientType.LINEAR, _colorDown, [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			this.graphics.drawRoundRect(0, 0, _width, _height, MConfig.rounded);
			this.graphics.endFill();
			labelPosition();
		}
		
		// Label
		
		private function labelColor():void
		{
			var format:TextFormat = MConfig.textFormatDefault;
			format.color = _labelColor;
			format.bold = true;
			
			_labelField.setTextFormat(format);
		}
		
		private function labelPosition():void
		{
			_labelField.x = (_width / 2) - (_labelField.width / 2);
			_labelField.y = (_height / 2) - (_labelField.height / 2);
		}
		
		public function setLabel(value:String):void
		{
			_labelField.text = _labelValue = value;
			labelColor();
			
			this.width = _labelField.width + _padding * 2;
			
		}
		
		// Colors
		
		public function setColor(color:String = ''):void
		{
			color = color.toLowerCase();
			
			if(color == '')
			{
				_colorNormal = _monoNormal;
				_labelColor = MConfig.mono_1;
			}
			else if(color == 'r' || color == 'red')
			{
				_colorNormal = _redNormal;
				_labelColor = MConfig.mono_6;
			}
			else if(color == 'o' || color == 'orange')
			{
				_colorNormal = _orangeNormal;
				_labelColor = MConfig.mono_6;
			}
			else if(color == 'y' || color == 'yellow')
			{
				_colorNormal = _yellowNormal;
				_labelColor = MConfig.mono_1;
			}
			else if(color == 'g' || color == 'green')
			{
				_colorNormal = _greenNormal;
				_labelColor = MConfig.mono_6;
			}
			else if(color == 'b' || color == 'blue')
			{
				_colorNormal = _blueNormal;
				_labelColor = MConfig.mono_6;
			}
			else if(color == 'v' || color == 'violet')
			{
				_colorNormal = _violetNormal;
				_labelColor = MConfig.mono_6;
			}
			
			onDrawBackgroundUp(null);
			labelColor();
		}
		
		// Overrides
		
		override public function set width(value:Number):void
		{
			_width = value;
			onDrawBackgroundUp(null);
		}
		
		override public function set height(value:Number):void
		{
			_height = value;
			onDrawBackgroundUp(null);
		}
		
	}
}