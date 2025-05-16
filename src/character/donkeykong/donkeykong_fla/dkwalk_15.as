// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkwalk_15

package donkeykong_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class dkwalk_15 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function dkwalk_15()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 9, this.frame10, 12, this.frame13);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.playSound("dk_footstep");
            };
        }

        internal function frame7():*
        {
            SSF2API.playSound("dk_footstep");
        }

        internal function frame10():*
        {
            SSF2API.playSound("dk_footstep");
        }

        internal function frame13():*
        {
            SSF2API.playSound("dk_footstep");
        }


    }
}//package donkeykong_fla

