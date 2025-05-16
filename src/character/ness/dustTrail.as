// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//dustTrail

package 
{
    import flash.display.MovieClip;

    public dynamic class dustTrail extends MovieClip 
    {

        public function dustTrail()
        {
            addFrameScript(16, this.frame17, 17, this.frame18);
        }

        internal function frame17():*
        {
            stop();
        }

        internal function frame18():*
        {
            gotoAndStop("done");
        }


    }
}//package 

