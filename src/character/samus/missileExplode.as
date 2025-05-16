// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//missileExplode

package 
{
    import flash.display.MovieClip;

    public dynamic class missileExplode extends MovieClip 
    {

        public function missileExplode()
        {
            addFrameScript(13, this.frame14);
        }

        internal function frame14():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

