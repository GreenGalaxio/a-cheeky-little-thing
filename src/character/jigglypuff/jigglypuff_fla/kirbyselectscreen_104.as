// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.kirbyselectscreen_104

package jigglypuff_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class kirbyselectscreen_104 extends MovieClip 
    {

        public var self:*;

        public function kirbyselectscreen_104()
        {
            addFrameScript(0, this.frame1, 31, this.frame32);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame32():*
        {
            gotoAndPlay("again");
        }


    }
}//package jigglypuff_fla

