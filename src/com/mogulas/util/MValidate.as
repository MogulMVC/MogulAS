package com.mogulas.util
{
	public class MValidate
	{
		public function MValidate()
		{
		}
		
		public static function email(email:String):Boolean
		{
			var reg:RegExp = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
			return reg.test(email);
		}
		
		public static function state(state:String):Boolean 
		{
			
			var stateString:String = state.toLowerCase();
			
			var stateAbbreviationArray:Array = ['ak', 'al', 'ar', 'as', 'az', 'ca', 'co', 'ct', 'dc', 'de', 'fl', 'ga', 'gu', 'hi', 'ia', 'id', 'il', 'in', 'ks', 'ky', 'la', 'ma', 'md', 'me', 'mh', 'mi', 'mn', 'mo', 'ms', 'mt', 'nc', 'nd', 'ne', 'nh', 'nj', 'nm', 'nv', 'ny', 'oh', 'ok', 'or', 'pa', 'pr', 'pw', 'ri', 'sc', 'sd', 'tn', 'tx', 'ut', 'va', 'vi', 'vt', 'wa', 'wi', 'wv', 'wy'];
			var stateArray:Array = ['alabama', 'alaska', 'arizona', 'arkansas', 'california', 'colorado', 'connecticut', 'delaware', 'florida', 'georgia', 'hawaii', 'idaho', 'illinois', 'indiana', 'iowa', 'iansas', 'kentucky', 'louisiana', 'maine', 'maryland', 'massachusetts', 'michigan', 'minnesota', 'mississippi', 'missouri', 'montana', 'nebraska', 'nevada', 'new hampshire', 'new jersey', 'new mexico', 'new york', 'north carolina', 'north dakota', 'ohio', 'oklahoma', 'oregon', 'pennsylvania', 'rhode island', 'south carolina', 'south dakota', 'tennessee', 'texas', 'utah', 'vermont', 'virginia', 'washington', 'west virginia', 'wisconsin', 'wyoming'];
			
			// Check the abbreviations
			for (var i:uint = 0, j:uint = stateAbbreviationArray.length; i < j; i++) {
				
				if (stateString == stateAbbreviationArray[i]) {
					return true;
				}
				
			}
			
			// Check the full name
			for (var ii:uint = 0, jj:uint = stateArray.length; ii < jj; ii++) {
				
				if (stateString == stateArray[ii]) {
					return true;
				}
				
			}
			
			// If the state was not found
			return false;
			
		}
		
		
	}
}