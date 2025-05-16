// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_run_12

package metaknight_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class metaknight_run_12 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var dash_gate:Boolean;

        public function metaknight_run_12()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 8, this.frame9, 9, this.frame10, 14, this.frame15, 16, this.frame17, 20, this.frame21);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.dash_gate = false;
        }

        internal function frame4():*
        {
            if (this.dash_gate == false)
            {
                SSF2API.playSound("mk_dash");
                this.dash_gate = true;
            };
        }

        internal function frame9():*
        {
            gotoAndPlay("loop");
        }

        internal function frame10():*
        {
            SSF2API.playSound("mk_dodge");
        }

        internal function frame15():*
        {
            gotoAndPlay("run");
        }

        internal function frame17():*
        {
            SSF2API.playSound("mk_turn");
        }

        internal function frame21():*
        {
            gotoAndPlay("run");
        }


    }
}//package metaknight_fla

