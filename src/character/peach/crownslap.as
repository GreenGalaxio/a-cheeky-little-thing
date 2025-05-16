// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//crownslap

package 
{
    import flash.display.MovieClip;

    public dynamic class crownslap extends MovieClip 
    {

        public function crownslap()
        {
            addFrameScript(12, this.frame13);
        }

        internal function frame13():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

