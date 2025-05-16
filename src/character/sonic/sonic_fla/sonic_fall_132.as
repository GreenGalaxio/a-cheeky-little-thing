// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_fall_132

package sonic_fla
{
    import flash.display.MovieClip;

    public dynamic class sonic_fall_132 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;

        public function sonic_fall_132()
        {
            addFrameScript(7, this.frame8);
        }

        internal function frame8():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package sonic_fla

