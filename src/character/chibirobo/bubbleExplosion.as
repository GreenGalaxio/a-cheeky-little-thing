// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//bubbleExplosion

package 
{
    import flash.display.MovieClip;

    public dynamic class bubbleExplosion extends MovieClip 
    {

        public var loop:*;

        public function bubbleExplosion()
        {
            addFrameScript(0, this.frame1, 18, this.frame19);
        }

        internal function frame1():*
        {
            this.loop = false;
        }

        internal function frame19():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

