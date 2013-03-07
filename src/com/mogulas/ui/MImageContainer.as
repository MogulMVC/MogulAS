package com.mogulas.ui
{
	import com.mogulas.config.MConfig;
	import com.mogulas.manager.MShadowManager;
	
	import flash.display.Sprite;
	
	public class MImageContainer extends Sprite
	{
		public function MImageContainer(setWidth:Number, setHeight:Number)
		{
			super();
			
			var even:uint = MConfig.mono_3;
			var odd:uint = MConfig.mono_4;
			
			var size:int = 10;
			
			var nH:int = setWidth / size;
			var nV:int = setHeight / size;
			
			var clr:uint;
			var i:uint;
			var j:uint;
			
			for (i=0;i<nV;++i)
			{
				even ^= odd;
				odd  ^= even;
				even ^= odd;
				
				for (j=0;j<nH;++j)
				{
					clr = j & 1 ? even : odd;
					
					this.graphics.beginFill(clr,1);
					this.graphics.drawRect(Number(j*size),Number(i*size),size,size);
					this.graphics.endFill();
				}
			}
			
			MShadowManager.setup(this);
			
		}
		
	}
}