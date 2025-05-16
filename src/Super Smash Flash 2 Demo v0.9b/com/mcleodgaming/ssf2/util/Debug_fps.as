package com.mcleodgaming.ssf2.util
{
    import flash.display.Sprite;
    import flash.geom.Point;
    import flash.display.Stage;
    import flash.utils.getTimer;
    import flash.events.Event;

    public class Debug_fps 
    {


        private var fpsSymbol:Class = Debug_fps_fpsSymbol;
        private var fpsHolder:Sprite;
        private var pos:Point;
        private var stage:Stage;
        private var lowest:int;
        private var highest:int;
        private var checkCounter:int;
        private var checkRate:int;
        private var lowestResetCnt:int;
        private var startTime:Number;

        public function Debug_fps(_arg_1:Stage, _arg_2:Point)
        {
            this.stage = _arg_1;
            this.pos = _arg_2;
            this.lowest = this.stage.frameRate;
            this.highest = 0;
            this.checkCounter = 1;
            this.checkRate = 8;
            this.lowestResetCnt = (this.lowest * 5);
            this.startTime = getTimer();
            this.fpsHolder = new this.fpsSymbol();
            this.stage.addChild(this.fpsHolder);
            this.fpsHolder.x = this.pos.x;
            this.fpsHolder.y = this.pos.y;
            this.fpsHolder.addEventListener(Event.ENTER_FRAME, this.mainloop);
        }

        public function toString():String
        {
            return ("Debug_fps");
        }

        public function get FrameRate():Number
        {
            return (this.fpsHolder.stage.frameRate);
        }

        public function set FrameRate(_arg_1:Number):void
        {
            trace("Frame rate set disabled");
        }

        public function kill():void
        {
            this.fpsHolder.removeEventListener(Event.ENTER_FRAME, this.mainloop);
            this.stage.removeChild(this.fpsHolder);
        }

        private function mainloop(_arg_1:Event):void
        {
            var _local_3:Number;
            if (--this.checkCounter == 0)
            {
                _local_3 = (this.checkRate / ((getTimer() - this.startTime) / 1000));
                _local_3 = (Math.round((((_local_3 * 10) / 10) * 10)) / 10);
                if (_local_3 > this.fpsHolder.stage.frameRate)
                {
                    _local_3 = this.fpsHolder.stage.frameRate;
                };
                this.fpsHolder["fps"].text = _local_3;
                if (_local_3 < this.lowest)
                {
                    this.lowest = (this.fpsHolder["lowestValue"].text = _local_3);
                };
                if (_local_3 > this.highest)
                {
                    this.highest = _local_3;
                };
                this.startTime = getTimer();
                this.checkCounter = this.checkRate;
            };
            if (--this.lowestResetCnt == 0)
            {
                this.lowest = (this.fpsHolder["lowestValue"].text = this.highest);
                this.lowestResetCnt = (this.fpsHolder.stage.frameRate * 6);
            };
            this.fpsHolder["bar"].height = (((this.fpsHolder["fps"].text / this.fpsHolder.stage.frameRate) * 100) / 4);
            var _local_2:int = (this.stage.numChildren - 1);
            if (this.stage.getChildIndex(this.fpsHolder) < _local_2)
            {
                this.stage.setChildIndex(this.fpsHolder, _local_2);
            };
        }


    }
}//package com.mcleodgaming.ssf2.util