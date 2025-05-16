// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//explosionNewBig

package 
{
    import flash.display.MovieClip;

    public dynamic class explosionNewBig extends MovieClip 
    {

        public function explosionNewBig()
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

