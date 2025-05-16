// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_guard_69

package yoshi_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Yoshi_guard_69 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var shieldBox:MovieClip;
        public var self:*;
        public var startup:*;

        public function Yoshi_guard_69()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 101, this.frame102);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.startup = true;
            };
        }

        internal function frame3():*
        {
            this.startup = false;
        }

        internal function frame102():*
        {
            gotoAndPlay("loop");
        }


    }
}//package yoshi_fla

