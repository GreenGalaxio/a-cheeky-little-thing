// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.ichigo_jump_special_114

package donkeykong_fla
{
    import flash.display.MovieClip;

    public dynamic class ichigo_jump_special_114 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var done:*;

        public function ichigo_jump_special_114()
        {
            addFrameScript(0, this.frame1, 11, this.frame12);
        }

        internal function frame1():*
        {
            this.done = false;
        }

        internal function frame12():*
        {
            this.done = true;
            this.gotoAndPlay("again");
        }


    }
}//package donkeykong_fla

