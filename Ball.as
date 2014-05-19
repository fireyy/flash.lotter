package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	public class Ball extends MovieClip 
	{	
		public var speedX:int = 10;
		public var speedY:int = -10;
	
		public function Ball() 
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		    //
		}
	
		private function onEnterFrame(event:Event):void 
		{
			x += speedX;
			y += speedY;
			
			var limit:Rectangle = getBounds(parent);
		
			if (limit.left < -10 || limit.right > (stage.stageWidth + 10))
			{
				speedX *= -1;
			}
		
			if (limit.top < -10 || limit.bottom > (stage.stageHeight + 10)) 
			{
				speedY *= -1;
			}
		}
	}
}
