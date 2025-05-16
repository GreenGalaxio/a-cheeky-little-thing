// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_bike

package 
{
    import flash.display.MovieClip;

    public dynamic class kirby_bike extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;

        public function kirby_bike()
        {
            addFrameScript(0, this.frame1, 1, this.frame2);
        }

        internal function frame1():*
        {
            stop();
        }

        internal function frame2():*
        {
            this.gotoAndStop("begin");
        }


    }
}//package 

