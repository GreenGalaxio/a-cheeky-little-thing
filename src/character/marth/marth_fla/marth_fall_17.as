// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_fall_17

package marth_fla
{
    import flash.display.MovieClip;

    public dynamic class marth_fall_17 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;

        public function marth_fall_17()
        {
            addFrameScript(3, this.frame4);
        }

        internal function frame4():*
        {
            gotoAndPlay("again");
        }


    }
}//package marth_fla

