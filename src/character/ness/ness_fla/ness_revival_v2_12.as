// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_revival_v2_12

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ness_revival_v2_12 extends MovieClip 
    {

        public var self:*;

        public function ness_revival_v2_12()
        {
            addFrameScript(0, this.frame1, 26, this.frame27);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame27():*
        {
            gotoAndPlay("idle");
        }


    }
}//package ness_fla

