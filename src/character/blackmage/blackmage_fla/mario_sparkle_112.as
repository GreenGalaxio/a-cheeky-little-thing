// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.mario_sparkle_112

package blackmage_fla
{
    import flash.display.MovieClip;

    public dynamic class mario_sparkle_112 extends MovieClip 
    {

        public function mario_sparkle_112()
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
}//package blackmage_fla

