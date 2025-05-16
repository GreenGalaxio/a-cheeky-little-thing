// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.selectscreen_105

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class selectscreen_105 extends MovieClip 
    {

        public var self:*;

        public function selectscreen_105()
        {
            addFrameScript(0, this.frame1, 35, this.frame36);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame36():*
        {
            this.gotoAndPlay("loop");
        }


    }
}//package ness_fla

