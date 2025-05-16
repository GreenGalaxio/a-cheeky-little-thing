// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//gotint

package 
{
    import flash.display.MovieClip;

    public dynamic class gotint extends MovieClip 
    {

        public function gotint()
        {
            addFrameScript(0, this.frame1, 1, this.frame2);
        }

        internal function frame1():*
        {
            stop();
        }

        internal function frame2():*
        {
            this.gotoAndPlay("stop");
        }


    }
}//package 

