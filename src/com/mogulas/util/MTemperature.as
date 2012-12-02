package com.mogulas.util
{
	public class MTemperature
	{
		public function MTemperature()
		{
		}
		
		public static function c2f(value:Number):Number
		{
			return value *  9 / 5 + 32;
		}
		
		public static function c2k(value:Number):Number
		{
			return value + 273.15;
		}
		
		public static function f2c(value:Number):Number
		{
			return (value - 32) * 5 / 9;
		}
		
		public static function f2k(value:Number):Number
		{
			return (5 / 9 * (value - 32) + 273);
		}
		
		public static function k2c(value:Number):Number
		{
			return value - 273.15;
		}
		
		public static function k2f(value:Number):Number
		{
			return ((value - 273) * 1.8) + 32;
		}
	}
}