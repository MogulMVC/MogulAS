package util
{
	public class MColor
	{
		public function MColor()
		{
		}
		
		public static function fadeHex(hex:uint, hex2:uint, ratio:Number):uint
		{
			var r:uint = hex >> 16;
			var g:uint = hex >> 8 & 0xFF;
			var b:uint = hex & 0xFF;
			
			r += ((hex2 >> 16)-r) * ratio;
			g += ((hex2 >> 8 & 0xFF) - g) * ratio;
			b += ((hex2 & 0xFF) - b) * ratio;
			
			return(r<<16 | g<<8 | b);
		}
	}
}