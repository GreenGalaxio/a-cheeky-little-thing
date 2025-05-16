// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//springidle

package 
{
    import flash.display.MovieClip;

    public dynamic class springidle extends MovieClip 
    {

        public var stance:MovieClip;

        public function springidle()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            stop();
        }


    }
}//package 

