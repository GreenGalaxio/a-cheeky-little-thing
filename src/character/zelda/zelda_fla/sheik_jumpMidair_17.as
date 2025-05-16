// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.sheik_jumpMidair_17

package zelda_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class sheik_jumpMidair_17 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function sheik_jumpMidair_17()
        {
            addFrameScript(0, this.frame1, 21, this.frame22, 22, this.frame23);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame22():*
        {
            this.done = true;
            stop();
        }

        internal function frame23():*
        {
            this.gotoAndStop("done");
        }


    }
}//package zelda_fla

