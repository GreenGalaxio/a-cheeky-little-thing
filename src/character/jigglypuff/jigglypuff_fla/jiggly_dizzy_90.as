// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_dizzy_90

package jigglypuff_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class jiggly_dizzy_90 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function jiggly_dizzy_90()
        {
            addFrameScript(0, this.frame1, 12, this.frame13);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame13():*
        {
            gotoAndPlay("again");
        }


    }
}//package jigglypuff_fla

