// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//landboom

package 
{
    import flash.display.MovieClip;

    public dynamic class landboom extends MovieClip 
    {

        public function landboom()
        {
            addFrameScript(22, this.frame23);
        }

        internal function frame23():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

