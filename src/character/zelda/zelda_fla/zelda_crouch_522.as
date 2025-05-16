// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.zelda_crouch_522

package zelda_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class zelda_crouch_522 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;

        public function zelda_crouch_522()
        {
            addFrameScript(0, this.frame1, 9, this.frame10);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame10():*
        {
            gotoAndPlay("loop");
        }


    }
}//package zelda_fla

