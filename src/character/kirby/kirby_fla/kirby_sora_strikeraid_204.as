// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_sora_strikeraid_204

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.xml.*;

    public dynamic class kirby_sora_strikeraid_204 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function kirby_sora_strikeraid_204()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 32, this.frame33, 42, this.frame43, 43, this.frame44, 48, this.frame49);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame7():*
        {
            this.self.fireProjectile("sora_strikeraid");
            this.self.playAttackSound(1);
        }

        internal function frame33():*
        {
            gotoAndPlay("finish");
        }

        internal function frame43():*
        {
            this.self.endAttack();
        }

        internal function frame44():*
        {
        }

        internal function frame49():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

