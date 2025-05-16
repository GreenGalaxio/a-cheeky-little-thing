// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.sheik_run_15

package zelda_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class sheik_run_15 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function sheik_run_15()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 16, this.frame17, 22, this.frame23);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                SSF2API.playSound("Run_start");
            };
        }

        internal function frame8():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame17():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame23():*
        {
            gotoAndPlay("run");
        }


    }
}//package zelda_fla

