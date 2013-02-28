/* 
* Mogul AS by Alan James
* version 130228
*/

package com.mogulas.config
{
	import flash.text.TextFormat;

	public class MConfig
	{
		public static var version:String = "130228";
		
		//Speed
		
		/* Needs Matching */
		public static var speedFast:uint = 125;
		public static var speedNorm:uint = 250;
		public static var speedSlow:uint = 500; 
	
		//Color
		
		public static var mono_1:uint = 0x0a0a0a;
		public static var mono_1_2:uint = 0x141414; /* Will Fix Later */
		public static var mono_1_3:uint = 0x232323; /* Will Fix Later */
		public static var mono_2:uint = 0x323232;
		public static var mono_3:uint = 0x646464;
		public static var mono_4:uint = 0x969696;
		public static var mono_4_2:uint = 0xc8c8c8; /* Will Fix Later */
		public static var mono_5:uint = 0xe6e6e6;
		public static var mono_6:uint = 0xffffff;
		
		public static var red_1:uint = 0x960000;
		public static var red_2:uint = 0xfa0000;
		public static var red_3:uint = 0xf07373;
		public static var red_4:uint = 0x890c0c;
		
		public static var orange_1:uint = 0x963c00;
		public static var orange_2:uint = 0xfa6400;
		public static var orange_3:uint = 0xf0a573;
		public static var orange_4:uint = 0x8c4110;
		
		public static var yellow_1:uint = 0x969600;
		public static var yellow_2:uint = 0xfafa00; //Change to #fac800 after redesign
		public static var yellow_3:uint = 0xf0f073;
		public static var yellow_4:uint = 0x8b8b0e;
		
		public static var green_1:uint = 0x009600;
		public static var green_2:uint = 0x00fa00;
		public static var green_3:uint = 0x73f073;
		public static var green_4:uint = 0x0d8a0d;
		
		public static var blue_1:uint = 0x004b96;
		public static var blue_2:uint = 0x007dfa;
		public static var blue_3:uint = 0x73b2f0;
		public static var blue_4:uint = 0x104e8c;
		
		public static var violet_1:uint = 0x4b0096;
		public static var violet_2:uint = 0x7d00fa;
		public static var violet_3:uint = 0xb273f0;
		public static var violet_4:uint = 0x4a0c89;
		
		public static var outline:uint = mono_3;
		public static var outline_down:uint = mono_2;
		
		//Visual
		
		public static var rounded:uint = 6; //Double size of CSS
		public static var rounded_large:uint = 20; 
		
		//Font / Text
		
		public static var font:String = "Verdana";
		
		public static var textFormatDefault:TextFormat = new TextFormat();
		textFormatDefault.color = mono_1;
		textFormatDefault.font = font;
		textFormatDefault.size = 12;
		
		public static var textFormatRed:TextFormat = new TextFormat();
		textFormatRed.color = red_1;
		textFormatRed.font = font;
		textFormatRed.size = 12;
		
		public static var textFormatOrange:TextFormat = new TextFormat();
		textFormatOrange.color = orange_1;
		textFormatOrange.font = font;
		textFormatOrange.size = 12;
		
		public static var textFormatYellow:TextFormat = new TextFormat();
		textFormatYellow.color = yellow_1;
		textFormatYellow.font = font;
		textFormatYellow.size = 12;
		
		public static var textFormatGreen:TextFormat = new TextFormat();
		textFormatGreen.color = green_1;
		textFormatGreen.font = font;
		textFormatGreen.size = 12;
		
		public static var textFormatBlue:TextFormat = new TextFormat();
		textFormatBlue.color = blue_1;
		textFormatBlue.font = font;
		textFormatBlue.size = 12;
		
		public static var textFormatViolet:TextFormat = new TextFormat();
		textFormatViolet.color = violet_1;
		textFormatViolet.font = font;
		textFormatViolet.size = 12;
		
		public static var textFormatBlack:TextFormat = new TextFormat();
		textFormatBlack.color = mono_1;
		textFormatBlack.font = font;
		textFormatBlack.size = 12;
		
		public static var textFormatWhite:TextFormat = new TextFormat();
		textFormatWhite.color = mono_6;
		textFormatWhite.font = font;
		textFormatWhite.size = 12;
			
		public function MConfig()
		{
		}
	}
}