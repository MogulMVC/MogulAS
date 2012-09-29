package ui
{
	import config.MConfig;
	
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import manager.MGlowManager;
	
	public class MComboBox extends Sprite
	{
		private var _padding:Number = 10;
		
		private var _width:Number = 200;
		private var _height:Number = 20;
		
		private var _monoNormal:Array = [MConfig.mono_5, MConfig.mono_4];
		private var _redNormal:Array = [MConfig.red_2, MConfig.red_1];
		private var _orangeNormal:Array = [MConfig.orange_2, MConfig.orange_1];
		private var _yellowNormal:Array = [MConfig.yellow_2, MConfig.yellow_1];
		private var _greenNormal:Array = [MConfig.green_2, MConfig.green_1];
		private var _blueNormal:Array = [MConfig.blue_2, MConfig.blue_1];
		private var _violetNormal:Array = [MConfig.violet_2, MConfig.violet_1];
		
		// The default colors
		private var _colorNormal:Array = [MConfig.mono_5, MConfig.mono_4];
		private var _colorDown:Array = [MConfig.mono_2, MConfig.mono_2];
		
		// Label
		private var _labelField:TextField;
		private var _labelValue:String;
		private var _labelColor:uint = MConfig.mono_1;
		
		private var _arrow:TextField;
		private var _arrowWidth:Number = 20;
		
		// List
		private var _choices:Array;
		private var _selectedIndex:uint;
		
		private var _dropdown:Sprite;
		
		public function MComboBox()
		{
			super();
			
			this.buttonMode = true;
			this.mouseChildren = false;
			
			var glow:MGlowManager = new MGlowManager();
			glow.setup(this);
			
			_labelField = new TextField();
			_labelField.autoSize = TextFieldAutoSize.LEFT;
			_labelField.wordWrap = false;
			addChild(_labelField);
			
			_arrow = new TextField();
			_arrow.text = "▼";
			addChild(_arrow);
			
			labelColor();
			
			_choices = [];
			_dropdown = new Sprite();
			_dropdown.y = _height;
			addChild(_dropdown);
			
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
		}
		
		private function stageAdded(event:Event):void
		{
			drawBackground(null);
			
			removeEventListener(Event.ADDED_TO_STAGE, stageAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, stageRemove);
			
			//Add mouse events
			addEventListener(MouseEvent.MOUSE_DOWN, drawBackgroundDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, drawBackground);
			
			addEventListener(MouseEvent.MOUSE_DOWN, drawDropdown);
			stage.addEventListener(MouseEvent.MOUSE_UP, undrawDropdown);
		}		
		
		private function stageRemove(event:Event):void
		{
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
			removeEventListener(Event.REMOVED_FROM_STAGE, stageRemove);
			
			//Remove mouse events
			removeEventListener(MouseEvent.MOUSE_DOWN, drawBackgroundDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, drawBackground);
			
			removeEventListener(MouseEvent.MOUSE_DOWN, drawDropdown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, undrawDropdown);
		}
		
		private function drawBackground(event:MouseEvent):void
		{
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(_width, _height, (Math.PI/180)*90, 0, 1);
			
			//Adding 20 to the width for the arrow
			this.graphics.clear();
			this.graphics.lineStyle(1, MConfig.outline, 1, true);
			this.graphics.beginGradientFill(GradientType.LINEAR, _colorNormal, [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			this.graphics.drawRoundRect(0, 0, _width + _arrowWidth, _height, MConfig.rounded);
			labelPosition();
			arrowPosition();
		}
		
		private function drawBackgroundDown(event:MouseEvent):void
		{
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(_width, _height, (Math.PI/180)*90, 0, 1);
			
			//Adding 20 to the width for the arrow
			this.graphics.clear();
			this.graphics.lineStyle(1, MConfig.outline, 1, true);
			this.graphics.beginGradientFill(GradientType.LINEAR, _colorDown, [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			this.graphics.drawRoundRect(0, 0, _width + _arrowWidth, _height, MConfig.rounded);
			labelPosition();
			arrowPosition();
		}
		
		private function drawDropdown(event:MouseEvent):void
		{
			
			var i:uint = 0;
			for each(var choice:Object in _choices)
			{
				var key:String = choice.key;
				
				var choiceField:TextField = new TextField();
				choiceField.defaultTextFormat = MConfig.textFormatBlack;
				choiceField.autoSize = TextFieldAutoSize.LEFT;
				choiceField.wordWrap = false;
				choiceField.text = key;
				choiceField.y = i * 20;
				_dropdown.addChild(choiceField);
				
				i++;
			}
			
			_dropdown.graphics.clear();
			_dropdown.graphics.lineStyle(1, MConfig.outline, 1, true);
			_dropdown.graphics.beginFill(MConfig.mono_6, 1);
			_dropdown.graphics.drawRoundRect(0, 0, _width + _arrowWidth, _choices.length * 20, MConfig.rounded);
			labelPosition();
		}
		
		private function undrawDropdown(event:MouseEvent):void
		{
			while(_dropdown.numChildren > 0)
			{
				_dropdown.removeChildAt(0);
			}
			
			_dropdown.graphics.clear();
		}
		
		public function addChoice(key:String, value:Object):void
		{
			var choice:Object = new Object();
			choice.key = key;
			choice.value = value;
			_choices.push(choice);
			
			var choiceField:TextField = new TextField();
			choiceField.defaultTextFormat = MConfig.textFormatBlack;
			choiceField.autoSize = TextFieldAutoSize.LEFT;
			choiceField.wordWrap = false;
			choiceField.text = key;
			
			if(_width < choiceField.width)
			{
				this.width = choiceField.width;
			}
		}
		
		public function removeChoice(index:uint):void
		{
			
		}
		
		public function setSelectionIndex(index:uint):void
		{
			if(index < _choices.length - 1)
			{
				_selectedIndex = index;
				
				_labelValue = _choices[index].key;
				
				_labelField.text = _labelValue;
				
				labelColor();
				
//				this.width = _labelField.width + _padding * 2;
			}
		}
		
		private function labelColor():void
		{
			var format:TextFormat = MConfig.textFormatDefault;
			format.color = _labelColor;
			format.bold = true;
			
			_labelField.setTextFormat(format);
			_arrow.setTextFormat(format);
		}
		
		private function labelPosition():void
		{
			//_labelField.x = (_width / 2) - (_labelField.width / 2);
			_labelField.y = (_height / 2) - (_labelField.height / 2);
		}
		
		private function arrowPosition():void
		{
			//▼
			_arrow.x = _width;
			//_arrow.y = (_height / 2) - (_arrow.height / 2);
		}
		
		public function getSelectionIndex(index:uint):Object
		{
			return _choices[index];
		}
		
		//Padding
		
		public function setPadding(value:Number):void
		{
			_padding = 	value;
			drawBackground(null);
		}
		
		//Colors
		
		public function setMono():void
		{
			_colorNormal = _monoNormal;
			_labelColor = MConfig.mono_1;
			drawBackground(null);
			//			labelColor();
		}
		
		public function setRed():void
		{
			_colorNormal = _redNormal;
			_labelColor = MConfig.mono_6;
			drawBackground(null);
			//			labelColor();
		}
		
		public function setOrange():void
		{
			_colorNormal = _orangeNormal;
			_labelColor = MConfig.mono_6;
			drawBackground(null);
			//			labelColor();
		}
		
		public function setYellow():void
		{
			_colorNormal = _yellowNormal;
			_labelColor = MConfig.mono_1;
			drawBackground(null);
			//			labelColor();
		}
		
		public function setGreen():void
		{
			_colorNormal = _greenNormal;
			_labelColor = MConfig.mono_6;
			drawBackground(null);
			//			labelColor();
		}
		
		public function setBlue():void
		{
			_colorNormal = _blueNormal;
			_labelColor = MConfig.mono_6;
			drawBackground(null);
			//			labelColor();
		}
		
		public function setViolet():void
		{
			_colorNormal = _violetNormal;
			_labelColor = MConfig.mono_6;
			drawBackground(null);
			//			labelColor();
		}
		
		//Overrides
		
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