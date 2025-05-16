// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_run_gif2_27

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class megaman_run_gif2_27 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function megaman_run_gif2_27()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 9, this.frame10, 14, this.frame15, 23, this.frame24, 29, this.frame30, 35, this.frame36);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.playSound("run_start");
            };
        }

        internal function frame7():*
        {
            SSF2API.playSound("mm_step");
        }

        internal function frame10():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame15():*
        {
            SSF2API.playSound("mm_step");
        }

        internal function frame24():*
        {
            SSF2API.playSound("mm_step");
        }

        internal function frame30():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame36():*
        {
            this.gotoAndPlay("run");
        }


    }
}//package megaman_fla

