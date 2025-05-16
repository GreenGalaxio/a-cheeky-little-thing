// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_gutsblockbreak

package 
{
    import flash.display.MovieClip;

    public dynamic class megaman_gutsblockbreak extends MovieClip 
    {

        public function megaman_gutsblockbreak()
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

