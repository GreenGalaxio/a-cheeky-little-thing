// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//DSpec_Afterimage

package 
{
    import flash.display.MovieClip;

    public dynamic class DSpec_Afterimage extends MovieClip 
    {

        public function DSpec_Afterimage()
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

