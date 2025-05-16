// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//explosionNew

package 
{
    import flash.display.MovieClip;

    public dynamic class explosionNew extends MovieClip 
    {

        public function explosionNew()
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

