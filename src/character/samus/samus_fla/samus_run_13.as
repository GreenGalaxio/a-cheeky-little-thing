// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_run_13

package samus_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class samus_run_13 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function samus_run_13()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 13, this.frame14, 20, this.frame21, 28, this.frame29);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                SSF2API.playSound("samus_dodge_run");
            };
        }

        internal function frame6():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame7():*
        {
            SSF2API.playSound("samus_step");
        }

        internal function frame14():*
        {
            SSF2API.playSound("samus_step");
        }

        internal function frame21():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame29():*
        {
            this.gotoAndPlay("run");
        }


    }
}//package samus_fla

