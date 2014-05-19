package 
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.geom.Rectangle;

    public class GiftBall extends MovieClip
    {
        public var speedX:int = 10;
        public var speedY:int = -10;

        public function GiftBall()
        {
            addEventListener(Event.ENTER_FRAME, onEnterFrame);
        }

        private function onEnterFrame(event:Event):void
        {
            x += speedX;
            y += speedY;

            var limit:Rectangle = getBounds(parent.parent);

            if (limit.left < 55 || limit.right > (190 + 55))
            {
                speedX *= -1;
            }

            if (limit.top < 58 || limit.bottom > (183 + 58))
            {
                speedY *= -1;
            }
        }
    }
}