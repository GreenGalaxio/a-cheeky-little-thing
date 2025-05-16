// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_lose_28

package naruto_fla
{
    import flash.display.MovieClip;

    public dynamic class naruto_lose_28 extends MovieClip 
    {

        public var hitBox:MovieClip;

        public function naruto_lose_28()
        {
            addFrameScript(0, this.frame1, 25, this.frame26);
        }

        internal function frame1():*
        {
        }

        internal function frame26():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package naruto_fla

