// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.Pikachu_midairJump_16

package pikachu_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Pikachu_midairJump_16 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function Pikachu_midairJump_16()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame10():*
        {
            this.done = true;
        }

        internal function frame16():*
        {
            this.gotoAndPlay("redo");
        }


    }
}//package pikachu_fla

