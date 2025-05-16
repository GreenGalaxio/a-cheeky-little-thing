// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_finalSmashGrab_97

package lloyd_fla
{
    import flash.display.MovieClip;

    public dynamic class lloyd_finalSmashGrab_97 extends MovieClip 
    {

        public var grabBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var xframe:String;

        public function lloyd_finalSmashGrab_97()
        {
            addFrameScript(0, this.frame1, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.xframe = "grab";
        }

        internal function frame28():*
        {
            gotoAndPlay("loop");
        }


    }
}//package lloyd_fla

