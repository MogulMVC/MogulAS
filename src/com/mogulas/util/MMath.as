package com.mogulas.util
{
	public class MMath
	{
		public function MMath()
		{
		}
		
		public static function random(min:Number, max:Number):Number
		{
			return Math.random() * (max - min) + min;
		}
		
		public static function linear_regression(x:Array, y:Array):Array
		{
			// calculate number points
			var n:uint = x.length;
			
			// ensure both arrays of points are the same size
			if(n != y.length){
				return ['Error'];
			}
			
			// calculate sums
			var x_sum:Number = 0;
			
			for (var i:uint = 0; i < x.length; i++) {
				x_sum += x[i];
			}
			
			var y_sum:Number = 0;
			
			for (var i2:uint = 0; i2 < y.length; i2++) {
				y_sum += y[i2];
			}
			
			var xx_sum:Number = 0;
			var xy_sum:Number = 0;
			
			for(var i3:uint = 0; i3 < n; i3++){
				xy_sum += (x[i3] * y[i3]);
				xx_sum += (x[i3] * x[i3]);
			}
			
			// calculate slope
			var m:Number = ((n * xy_sum) - (x_sum * y_sum)) / ((n * xx_sum) - (x_sum * x_sum));
			
			// calculate intercept
			var b:Number = (y_sum - (m * x_sum)) / n;
			
			// return result
			return [m,b];
		}
	}
}