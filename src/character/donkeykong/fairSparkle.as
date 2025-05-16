// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fairSparkle

package 
{
    import flash.display.MovieClip;

    public dynamic class fairSparkle extends MovieClip 
    {

        public function fairSparkle()
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

