// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsshield_93

package tails_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class tailsshield_93 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function tailsshield_93()
        {
            addFrameScript(0, this.frame1, 3, this.frame4);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame4():*
        {
            gotoAndPlay("redo");
        }


    }
}//package tails_fla

