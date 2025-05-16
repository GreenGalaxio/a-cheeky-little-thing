// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//dashicon

package 
{
    import flash.display.MovieClip;

    public dynamic class dashicon extends MovieClip 
    {

        public function dashicon()
        {
            addFrameScript(10, this.frame11);
        }

        internal function frame11():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

