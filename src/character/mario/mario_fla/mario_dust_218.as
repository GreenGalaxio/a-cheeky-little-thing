// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_dust_218

package mario_fla
{
    import flash.display.MovieClip;

    public dynamic class mario_dust_218 extends MovieClip 
    {

        public function mario_dust_218()
        {
            addFrameScript(8, this.frame9);
        }

        internal function frame9():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package mario_fla

