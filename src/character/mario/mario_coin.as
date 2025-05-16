// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_coin

package 
{
    import flash.display.MovieClip;

    public dynamic class mario_coin extends MovieClip 
    {

        public function mario_coin()
        {
            addFrameScript(12, this.frame13);
        }

        internal function frame13():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

