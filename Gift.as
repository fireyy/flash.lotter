package
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import fl.transitions.Tween;
    import fl.transitions.easing.*;
    import fl.transitions.TweenEvent;
    import flash.system.Security;
	import flash.utils.*;
    import flash.utils.getDefinitionByName;

    public class Gift extends MovieClip
    {
        private var speedX:int = 10;
        private var speedY:int = -10;
        private var tot_ball:uint = 7;
        private var ballArr:Array = new Array();
        public var ballValue:Number = 0;
		public var timerrr:uint = 0;

        public function Gift()
        {
            Security.allowDomain("*");
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
        }

        function setBallvalue(v){
            ballValue = v;
        }

        function setBall(v){
            var a:Number = v*1 - 1;
            for(var i:uint = 0; i < tot_ball; i++){
                //if(a == i) continue;
                ballArr[i].alpha = 0;
                ballArr[i].speedX = 0;
                ballArr[i].speedY = 0;
            }
            //ballArr[a].speedX = 0;
            //ballArr[a].speedY = 0;
			//ballArr[a].x = -40;
            //ballArr[a].y = -40;
        }

        function checkPanel(v){
			ballValue = v;
            var v1 = (-360 / 6 * (Math.floor(Math.random()*(6-1)+1))) + 3600;
            var _loc3:Tween = new Tween(bg, "rotation", Strong.easeOut, bg.rotation, v1, 4, true);
            _loc3.addEventListener(TweenEvent.MOTION_FINISH, onMotionFinished);
			timerrr = setTimeout(function(){
				 stopRotation();
			},4000);
            gift.gift_bg.visible = false;
            if(ballArr.length == 0) {
                addBall();
            }else{
                showBall();
            }
        }

        function showBall(){
            for (var i:uint = 0; i < ballArr.length; i++)
            {
                ballArr[i].alpha = 1;
				ballArr[i].x = 0 + 2*i;
                ballArr[i].y = 0 + 2*i;

                ballArr[i].speedX = Math.random()*(20-10+1)+10;
                ballArr[i].speedY = Math.random()*(20-10+1)+10;
            }
        }

        function addBall(){
            for (var i:uint = 0; i < tot_ball; i++)
            {
                var ball:GiftBall = new GiftBall();
                ballArr.push(ball);
                var giftImg:Class = getDefinitionByName("gift" + (i+1)) as Class;
                if(giftImg){
                    ball.addChild(new giftImg());
                }

                ball.x = 0 + 2*i;
                ball.y = 0 + 2*i;

                ball.speedX = Math.random()*(20-10+1)+10;
                ball.speedY = Math.random()*(20-10+1)+10;

                gift.addChild(ball);
            }
        }
		
		function stopRotation(){
			if(timerrr) clearTimeout(timerrr);
			ExternalInterface.call("_rotationEnd");
            setBall(ballValue);
            ballValue = 0;
        }

        function onMotionFinished(e:Event){
			stopRotation();
        }
		
		private function onEnterFrame(event:Event):void
        {
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);

			if (ExternalInterface.available) {
			    ExternalInterface.addCallback("flashrotation",checkPanel);
                //ExternalInterface.addCallback("flashsetball",setBallvalue);
                //checkPanel();
			}
             
        }
    }
}