// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.Peach_Revivalplatformcopy_12

package peach_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Peach_Revivalplatformcopy_12 extends MovieClip 
    {

        public var self:*;

        public function Peach_Revivalplatformcopy_12()
        {
            addFrameScript(0, this.frame1, 150, this.frame151);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame151():*
        {
            stop();
        }


    }
}//package peach_fla

