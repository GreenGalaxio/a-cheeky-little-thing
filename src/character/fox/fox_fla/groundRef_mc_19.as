// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.groundRef_mc_19

package fox_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class groundRef_mc_19 extends MovieClip 
    {

        public var self:*;

        public function groundRef_mc_19()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.visible = false;
        }


    }
}//package fox_fla

