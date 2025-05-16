// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.mario_sparkle_73

package jigglypuff_fla
{
    import flash.display.MovieClip;

    public dynamic class mario_sparkle_73 extends MovieClip 
    {

        public function mario_sparkle_73()
        {
            addFrameScript(10, this.frame11);
        }

        internal function frame11():*
        {
            stop();
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }


    }
}//package jigglypuff_fla

