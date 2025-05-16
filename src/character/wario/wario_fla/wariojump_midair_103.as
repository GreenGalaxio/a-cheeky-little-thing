// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.wariojump_midair_103

package wario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class wariojump_midair_103 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function wariojump_midair_103()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 7, this.frame8);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame2():*
        {
            SSF2API.playSound("wario_jumpSFX");
        }

        internal function frame8():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package wario_fla

