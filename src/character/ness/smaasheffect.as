// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//smaasheffect

package 
{
    import flash.display.MovieClip;

    public dynamic class smaasheffect extends MovieClip 
    {

        public function smaasheffect()
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

