package com.mogulas.util
{
	public class MTime
	{
		public function MTime()
		{
		}
		
		public static function sec2hms(sec:int):String 
		{
			var hms:String = '';

			var hours:int = int(sec / 3600); 
			var minutes:int = int(sec / 60) % 60; 
			var seconds:int = int(sec % 60); 
			
			//Padding
			//Hours
			var hours_pad:String = '';
			
			if(hours < 10)
			{
				hours_pad = "0";
			}
			
			//Minutes
			var minutes_pad:String = '';
			
			if(minutes < 10)
			{
				minutes_pad = "0";
			}
			
			//Seconds
			var seconds_pad:String = '';
			
			if(seconds < 10)
			{
				seconds_pad = "0";
			}

			//Output
			//If there are hours
			if(hours >= 0)
			{
				hms = hours_pad + hours + ":" + minutes_pad + minutes + ":" + seconds_pad + seconds;
			}
			
			//If there are no hours but there are mins
			if(hours <= 0 && minutes > 0)
			{
				hms = minutes_pad + minutes + ":" + seconds_pad + seconds;
			}
			
			//If there are no hours and no minutes
			//This will display 00 if there are 0 seconds
			if(hours <= 0 && minutes <= 0)
			{
				hms = seconds_pad + seconds;
			}
			
			return hms;
		}
	}
}