// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//floorTwinkle

package 
{
    import flash.display.MovieClip;

    public dynamic class floorTwinkle extends MovieClip 
    {

        public var loop:*;

        public function floorTwinkle()
        {
            addFrameScript(0, this.frame1, 75, this.frame76);
        }

        internal function frame1():*
        {
            this.loop = false;
        }

        internal function frame76():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

