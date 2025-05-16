// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_bike

package 
{
    import flash.display.MovieClip;

    public dynamic class wario_bike extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;

        public function wario_bike()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 29, this.frame30);
        }

        internal function frame1():*
        {
            stop();
        }

        internal function frame2():*
        {
            this.gotoAndStop("begin");
        }

        internal function frame30():*
        {
            gotoAndPlay("toss");
        }


    }
}//package 

