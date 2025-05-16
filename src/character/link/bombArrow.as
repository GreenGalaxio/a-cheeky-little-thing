// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//bombArrow

package 
{
    import flash.display.MovieClip;

    public dynamic class bombArrow extends MovieClip 
    {

        public var stance:MovieClip;

        public function bombArrow()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            stop();
        }


    }
}//package 

