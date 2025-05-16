// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_walk_17

package yoshi_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Yoshi_walk_17 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function Yoshi_walk_17()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 12, this.frame13);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame4():*
        {
            SSF2API.playSound("yoshi_step2");
        }

        internal function frame13():*
        {
            SSF2API.playSound("yoshi_step1");
        }


    }
}//package yoshi_fla

