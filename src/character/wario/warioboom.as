// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//warioboom

package 
{
    import flash.display.MovieClip;

    public dynamic class warioboom extends MovieClip 
    {

        public function warioboom()
        {
            addFrameScript(27, this.frame28);
        }

        internal function frame28():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

