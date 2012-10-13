package com.mogulas.ui
{
	import com.mogulas.config.MConfig;
	
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	import com.mogulas.manager.MDraggableManager;
	import com.mogulas.manager.MShadowManager;
	
	public class MSystemMessage extends Sprite
	{
		private var _width:Number = 450;
		private var _height:Number = 0;
		
		private var _labelField:TextField;
		private var _labelValue:String;
		private var _labelPadding:uint = 10;
		
		public function MSystemMessage(value:String = "System Message")
		{
			super();
			
			var drag:MDraggableManager = new MDraggableManager();
			drag.setup(this,this);
			
			MShadowManager.setup(this);
			
			var format:TextFormat = MConfig.textFormatWhite;
			
			_labelField = new TextField();
			_labelField.width = _width - _labelPadding * 2;
			_labelField.x = _labelPadding;
			_labelField.y = _labelPadding;
			_labelField.autoSize = TextFieldAutoSize.LEFT;
			_labelField.wordWrap = true;
			_labelField.defaultTextFormat = format;
			addChild(_labelField);
			
			setLabel(value);
			
			addEventListener(Event.ADDED_TO_STAGE, stageAdded);
		}
		
		private function stageAdded(event:Event):void
		{
			var timer:Timer = new Timer(5000, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, startRemove);
			timer.start();
		}
		
		private function startRemove(event:TimerEvent):void
		{
			addEventListener(Event.ENTER_FRAME, fadeOut);
		}
		
		protected function fadeOut(event:Event):void
		{
			this.alpha -= .05;
			
			if(this.alpha <= 0)
			{
				removeEventListener(Event.ENTER_FRAME, fadeOut);
				parent.removeChild(this);
			}
		}
		
		private function drawBackground():void
		{
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(450, _height, (Math.PI/180)*90, 0, 1);
			
			this.graphics.beginGradientFill(GradientType.LINEAR, [MConfig.mono_2, MConfig.mono_1], [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			this.graphics.drawRoundRect(0, 0, 450, _height, MConfig.rounded);
		}
		
		public function setLabel(value:String):void
		{
			_labelValue = value;
			_labelField.text = _labelValue;
			
			_height = _labelField.height + _labelPadding * 2;
			
			drawBackground();
		}
		

	}
}