// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_crouchcopy_76

package jigglypuff_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class jiggly_crouchcopy_76 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function jiggly_crouchcopy_76()
        {
            addFrameScript(0, this.frame1, 8, this.frame9);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame9():*
        {
            gotoAndPlay("loop");
        }


    }
}//package jigglypuff_fla

