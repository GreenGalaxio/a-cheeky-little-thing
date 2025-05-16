// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_run_gif_26

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class megaman_run_gif_26 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function megaman_run_gif_26()
        {
            addFrameScript(0, this.frame1, 12, this.frame13, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame13():*
        {
            SSF2API.playSound("mm_step");
        }

        internal function frame28():*
        {
            SSF2API.playSound("mm_step");
        }


    }
}//package megaman_fla

