// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_jump_19

package yoshi_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Yoshi_jump_19 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var done:Boolean;

        public function Yoshi_jump_19()
        {
            addFrameScript(0, this.frame1, 3, this.frame4);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.done = false;
            };
            SSF2API.playSound("Yoshi_jump1");
        }

        internal function frame4():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package yoshi_fla

