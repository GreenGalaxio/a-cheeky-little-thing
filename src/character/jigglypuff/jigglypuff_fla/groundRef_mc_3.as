// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.groundRef_mc_3

package jigglypuff_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class groundRef_mc_3 extends MovieClip 
    {

        public var self:*;

        public function groundRef_mc_3()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.visible = false;
        }


    }
}//package jigglypuff_fla

