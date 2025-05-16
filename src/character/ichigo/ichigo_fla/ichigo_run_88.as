// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_run_88

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ichigo_run_88 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function ichigo_run_88()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 8, this.frame9, 15, this.frame16, 20, this.frame21, 21, this.frame22, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            SSF2API.playSound("Run_start");
        }

        internal function frame8():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame9():*
        {
            SSF2API.playSound("ichigo_footstep");
        }

        internal function frame16():*
        {
            SSF2API.playSound("ichigo_footstep");
        }

        internal function frame21():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame22():*
        {
            SSF2API.playSound("ichigo_footstep");
        }

        internal function frame28():*
        {
            this.gotoAndPlay("run");
        }


    }
}//package ichigo_fla

