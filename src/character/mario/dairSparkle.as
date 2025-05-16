// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//dairSparkle

package 
{
    import flash.display.MovieClip;

    public dynamic class dairSparkle extends MovieClip 
    {

        public function dairSparkle()
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

