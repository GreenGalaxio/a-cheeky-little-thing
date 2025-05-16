// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_Run_15

package bomberman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Bomberman_Run_15 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function Bomberman_Run_15()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 16, this.frame17, 24, this.frame25, 26, this.frame27, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            SSF2API.playSound("bomberman_dash");
        }

        internal function frame7():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame8():*
        {
            SSF2API.playSound("bomberman_step1");
        }

        internal function frame17():*
        {
            SSF2API.playSound("bomberman_step1");
        }

        internal function frame25():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame27():*
        {
            SSF2API.playSound("bomberman_turn");
        }

        internal function frame31():*
        {
            this.gotoAndPlay("run");
        }


    }
}//package bomberman_fla

