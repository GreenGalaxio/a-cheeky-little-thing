// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//upSpecSparkle

package 
{
    import flash.display.MovieClip;

    public dynamic class upSpecSparkle extends MovieClip 
    {

        public function upSpecSparkle()
        {
            addFrameScript(5, this.frame6);
        }

        internal function frame6():*
        {
            stop();
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

