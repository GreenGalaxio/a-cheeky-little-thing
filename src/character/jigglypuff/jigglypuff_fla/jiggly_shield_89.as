// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_shield_89

package jigglypuff_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class jiggly_shield_89 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;

        public function jiggly_shield_89()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame3():*
        {
            this.xframe = "again";
            stop();
        }

        internal function frame4():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package jigglypuff_fla

