// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//thunderJolt_trail

package 
{
    import flash.display.MovieClip;

    public dynamic class thunderJolt_trail extends MovieClip 
    {

        public var attackBox:MovieClip;

        public function thunderJolt_trail()
        {
            addFrameScript(6, this.frame7);
        }

        internal function frame7():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

