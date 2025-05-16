// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_climbladder_91

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ness_climbladder_91 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function ness_climbladder_91()
        {
            addFrameScript(0, this.frame1, 11, this.frame12);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame12():*
        {
            gotoAndPlay("loop");
        }


    }
}//package ness_fla

