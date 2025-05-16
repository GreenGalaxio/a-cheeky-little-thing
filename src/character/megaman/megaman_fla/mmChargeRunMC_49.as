// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.mmChargeRunMC_49

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class mmChargeRunMC_49 extends MovieClip 
    {

        public function mmChargeRunMC_49()
        {
            addFrameScript(0, this.frame1, 12, this.frame13);
        }

        internal function frame1():*
        {
            SSF2API.playSound("mm_step");
        }

        internal function frame13():*
        {
            SSF2API.playSound("mm_step");
        }


    }
}//package megaman_fla

