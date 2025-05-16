// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//arrowTrail

package 
{
    import flash.display.MovieClip;

    public dynamic class arrowTrail extends MovieClip 
    {

        public function arrowTrail()
        {
            addFrameScript(5, this.frame6);
        }

        internal function frame6():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

