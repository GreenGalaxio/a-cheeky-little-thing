// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//uspecSparkle

package 
{
    import flash.display.MovieClip;

    public dynamic class uspecSparkle extends MovieClip 
    {

        public function uspecSparkle()
        {
            addFrameScript(4, this.frame5);
        }

        internal function frame5():*
        {
            stop();
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

