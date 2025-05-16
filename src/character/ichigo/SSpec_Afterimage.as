// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//SSpec_Afterimage

package 
{
    import flash.display.MovieClip;

    public dynamic class SSpec_Afterimage extends MovieClip 
    {

        public function SSpec_Afterimage()
        {
            addFrameScript(4, this.frame5);
        }

        internal function frame5():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

