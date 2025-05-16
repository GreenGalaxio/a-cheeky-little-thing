// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.Roll_DoubleJump_17

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Roll_DoubleJump_17 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var done:*;

        public function Roll_DoubleJump_17()
        {
            addFrameScript(0, this.frame1, 16, this.frame17, 17, this.frame18);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.done = false;
        }

        internal function frame17():*
        {
            this.done = true;
            stop();
        }

        internal function frame18():*
        {
            this.gotoAndStop("done");
        }


    }
}//package lloyd_fla

