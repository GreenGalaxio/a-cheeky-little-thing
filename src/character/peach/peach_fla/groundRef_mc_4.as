// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.groundRef_mc_4

package peach_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class groundRef_mc_4 extends MovieClip 
    {

        public var self:*;

        public function groundRef_mc_4()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.visible = false;
        }


    }
}//package peach_fla

