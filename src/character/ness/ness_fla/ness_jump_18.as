// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_jump_18

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ness_jump_18 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function ness_jump_18()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 7, this.frame8, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "midair";
                this.done = false;
            };
        }

        internal function frame2():*
        {
            SSF2API.playSound("ness_jumpSound");
        }

        internal function frame8():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }

        internal function frame28():*
        {
            this.done = true;
            gotoAndPlay("again");
        }


    }
}//package ness_fla

