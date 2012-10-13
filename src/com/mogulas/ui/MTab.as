package com.mogulas.ui
{
	public class MTab
	{
		
		private var _tabs:Array;
		
		public function MTab()
		{
			_tabs = [];
		}
		
		public function addTab(tab:String):void
		{
		}
		
		public function setSelectionIndex(index:uint):void
		{
		}
		
		public function getSelectionIndex(index:uint):Object
		{
			return _tabs[index];
		}
	}
}