// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_jump_midair_19

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class chibi_jump_midair_19 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function chibi_jump_midair_19()
        {
            addFrameScript(0, this.frame1, 5, this.frame6);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame6():*
        {
            this.done = true;
            gotoAndPlay("jump");
        }


    }
}//package chibirobo_fla

