// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.mario_sparkle_142

package marth_fla
{
    import flash.display.MovieClip;

    public dynamic class mario_sparkle_142 extends MovieClip 
    {

        public function mario_sparkle_142()
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
}//package marth_fla

