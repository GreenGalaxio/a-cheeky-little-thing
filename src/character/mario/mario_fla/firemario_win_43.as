// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.firemario_win_43

package mario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class firemario_win_43 extends MovieClip 
    {

        public var self:*;

        public function firemario_win_43()
        {
            addFrameScript(0, this.frame1, 10, this.frame11, 13, this.frame14, 16, this.frame17, 20, this.frame21, 23, this.frame24, 27, this.frame28, 31, this.frame32, 35, this.frame36, 39, this.frame40, 46, this.frame47, 60, this.frame61);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame11():*
        {
            SSF2API.playSound("mario_hoo");
            SSF2API.playSound("mario_hammer_fire");
        }

        internal function frame14():*
        {
            SSF2API.playSound("mario_hammer_fire");
        }

        internal function frame17():*
        {
            SSF2API.playSound("mario_hammer_fire");
        }

        internal function frame21():*
        {
            SSF2API.playSound("mario_hammer_fire");
        }

        internal function frame24():*
        {
            SSF2API.playSound("mario_hammer_fire");
        }

        internal function frame28():*
        {
            SSF2API.playSound("mario_hammer_fire");
        }

        internal function frame32():*
        {
            SSF2API.playSound("mario_hammer_fire");
        }

        internal function frame36():*
        {
            SSF2API.playSound("mario_hammer_fire");
        }

        internal function frame40():*
        {
            SSF2API.playSound("mario_hammer_fire");
        }

        internal function frame47():*
        {
            SSF2API.playSound("mario_ha");
        }

        internal function frame61():*
        {
            gotoAndPlay("goto");
        }


    }
}//package mario_fla

