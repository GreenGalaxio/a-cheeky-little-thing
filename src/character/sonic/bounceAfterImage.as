// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bounceAfterImage

package 
{
    import flash.display.MovieClip;

    public dynamic class bounceAfterImage extends MovieClip 
    {

        public function bounceAfterImage()
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

