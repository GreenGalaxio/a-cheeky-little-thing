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
            addFrameScript(10, this.frame11);
        }

        internal function frame11():*
        {
            stop();
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

