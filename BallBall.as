package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class BallBall extends MovieClip 
	{
		private var tot_ball:uint = 5;
		private var tot_click:uint = 0;
		
		public function BallBall() 
		{
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onStageClick);
		}
		
		private function onStageClick (pEvent:MouseEvent):void 
		{
			if(tot_click > 4)
			{
				stage.removeEventListener(MouseEvent.MOUSE_DOWN, onStageClick);
			}

			for (var i:uint = 0; i < tot_ball; i++) 
			{
				var ball:Ball = new Ball();
				
				ball.x = pEvent.stageX;
				ball.y = pEvent.stageY;
				
				ball.speedX = (Math.random() * 30) - 15;
				ball.speedY = (Math.random() * 30) - 15;
				
				addChild(ball);
			}

			tot_click += 1;
		}
	}
}