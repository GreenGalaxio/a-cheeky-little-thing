// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.MegaShield_gif_temporary__94

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class MegaShield_gif_temporary__94 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;

        public function MegaShield_gif_temporary__94()
        {
            addFrameScript(0, this.frame1, 8, this.frame9);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame9():*
        {
            gotoAndPlay("loop");
        }


    }
}//package megaman_fla

