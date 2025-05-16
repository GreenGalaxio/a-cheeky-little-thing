// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_duck_special_101

package mario_fla
{
    import flash.display.MovieClip;

    public dynamic class mario_duck_special_101 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox:MovieClip;

        public function mario_duck_special_101()
        {
            addFrameScript(2, this.frame3, 3, this.frame4);
        }

        internal function frame3():*
        {
            stop();
        }

        internal function frame4():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package mario_fla

