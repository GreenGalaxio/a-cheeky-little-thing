// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_blocking_special_115

package mario_fla
{
    import flash.display.MovieClip;

    public dynamic class mario_blocking_special_115 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox:MovieClip;

        public function mario_blocking_special_115()
        {
            addFrameScript(6, this.frame7, 7, this.frame8);
        }

        internal function frame7():*
        {
            stop();
        }

        internal function frame8():*
        {
            gotoAndStop("stopped");
        }


    }
}//package mario_fla

