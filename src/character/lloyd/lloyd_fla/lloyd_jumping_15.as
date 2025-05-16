// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_jumping_15

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class lloyd_jumping_15 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function lloyd_jumping_15()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "midair";
            this.done = false;
            SSF2API.playSound("lloyd_jumpSound");
        }

        internal function frame5():*
        {
            this.done = true;
            stop();
        }

        internal function frame6():*
        {
            this.gotoAndStop("done");
        }


    }
}//package lloyd_fla

