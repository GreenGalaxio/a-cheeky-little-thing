// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.ichigo_lose_bankai_flashing__154

package donkeykong_fla
{
    import flash.display.MovieClip;

    public dynamic class ichigo_lose_bankai_flashing__154 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;

        public function ichigo_lose_bankai_flashing__154()
        {
            addFrameScript(20, this.frame21);
        }

        internal function frame21():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package donkeykong_fla

