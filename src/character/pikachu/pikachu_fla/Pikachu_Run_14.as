// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.Pikachu_Run_14

package pikachu_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Pikachu_Run_14 extends MovieClip 
    {

        public var hitBo4:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function Pikachu_Run_14()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 7, this.frame8, 10, this.frame11, 15, this.frame16, 21, this.frame22);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (SSF2API.isReady())
            {
                SSF2API.playSound("Run_start");
                SSF2API.playSound("footstep");
            };
        }

        internal function frame6():*
        {
            SSF2API.playSound("footstep");
        }

        internal function frame8():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame11():*
        {
            SSF2API.playSound("footstep");
        }

        internal function frame16():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame22():*
        {
            this.gotoAndPlay("run");
        }


    }
}//package pikachu_fla

