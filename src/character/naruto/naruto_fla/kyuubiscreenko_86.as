// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.kyuubiscreenko_86

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class kyuubiscreenko_86 extends MovieClip 
    {

        public var self:*;

        public function kyuubiscreenko_86()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }


    }
}//package naruto_fla

