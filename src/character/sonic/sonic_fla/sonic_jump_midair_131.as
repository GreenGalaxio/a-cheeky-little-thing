// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_jump_midair_131

package sonic_fla
{
    import flash.display.MovieClip;

    public dynamic class sonic_jump_midair_131 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;

        public function sonic_jump_midair_131()
        {
            addFrameScript(20, this.frame21);
        }

        internal function frame21():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package sonic_fla

