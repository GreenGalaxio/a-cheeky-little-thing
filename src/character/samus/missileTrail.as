// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//missileTrail

package 
{
    import flash.display.MovieClip;

    public dynamic class missileTrail extends MovieClip 
    {

        public function missileTrail()
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

