// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_jump_223

package sonic_fla
{
    import flash.display.MovieClip;

    public dynamic class sonic_jump_223 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;

        public function sonic_jump_223()
        {
            addFrameScript(11, this.frame12);
        }

        internal function frame12():*
        {
            gotoAndPlay("again");
        }


    }
}//package sonic_fla

