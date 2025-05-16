// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//soapBubbles

package 
{
    import flash.display.MovieClip;

    public dynamic class soapBubbles extends MovieClip 
    {

        public var loop:*;

        public function soapBubbles()
        {
            addFrameScript(0, this.frame1, 48, this.frame49);
        }

        internal function frame1():*
        {
            this.loop = false;
        }

        internal function frame49():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

