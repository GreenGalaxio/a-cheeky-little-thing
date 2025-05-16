// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_running_14

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class lloyd_running_14 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function lloyd_running_14()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 8, this.frame9, 16, this.frame17, 19, this.frame20, 25, this.frame26);
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
            SSF2API.playSound("lloyd_footstep");
        }

        internal function frame17():*
        {
            SSF2API.playSound("lloyd_footstep");
        }

        internal function frame20():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame26():*
        {
            gotoAndPlay("run");
        }


    }
}//package lloyd_fla

