// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_afterImage

package 
{
    import flash.display.MovieClip;

    public dynamic class sonic_afterImage extends MovieClip 
    {

        public function sonic_afterImage()
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

