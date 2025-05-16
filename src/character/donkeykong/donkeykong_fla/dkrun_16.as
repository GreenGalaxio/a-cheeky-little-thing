// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkrun_16

package donkeykong_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class dkrun_16 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function dkrun_16()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 7, this.frame8, 13, this.frame14, 21, this.frame22, 29, this.frame30, 34, this.frame35, 40, this.frame41);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame6():*
        {
            SSF2API.playSound("dk_footstep");
        }

        internal function frame7():*
        {
            gotoAndPlay("run");
        }

        internal function frame8():*
        {
            if (((parent) && (SSF2API.isReady())))
            {
                SSF2API.playSound("dk_footstep");
            };
        }

        internal function frame14():*
        {
            SSF2API.playSound("dk_footstep");
        }

        internal function frame22():*
        {
            SSF2API.playSound("dk_footstep");
        }

        internal function frame30():*
        {
            SSF2API.playSound("dk_footstep");
        }

        internal function frame35():*
        {
            gotoAndPlay("run");
        }

        internal function frame41():*
        {
            gotoAndPlay("run");
        }


    }
}//package donkeykong_fla

